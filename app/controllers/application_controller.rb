class ApplicationController < ActionController::Base
 # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception

  # By default, throw an exception if we're not running cancancan against the controller
  #check_authorization :unless => :devise_controller?

  # Before Action (https://www.cookieshq.co.uk/posts/easy-seo-metatags-with-rails-4/)
  before_action :prepare_meta_tags, if: "request.get?"

  # By default, assume no-one can see anything
  before_filter :check_active_account, :set_current_user, :dirty_response_headers, :set_locale, :init_layout_data

  # Throw away flash messages after AJAX request
  # (stops alerts etc popping up on next page load)
  after_filter { flash.discard if request.xhr? }

  layout :set_layout
  def set_layout
    if current_user and current_user.super_admin
      'back'
    else
      'front'
    end
  end

  def check_active_account
    if current_user and ! current_user.active
      sign_out current_user
      redirect_to :root
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, alert: exception.message
  end

  def page
    params[:page]
  end

  def set_current_user
    User.current = current_user
  end

  def dirty_response_headers
    case request.format
    when "Mime::PDF"
      response.headers['Content-Type'] = 'application/pdf'
      response.headers['Content-Disposition'] = 'attachment; filename=temp.pdf'
    when "Mime::CSV"
      response.headers['Content-Type'] = 'text/csv'
      response.headers['Content-Disposition'] = 'attachment; filename=temp.csv'
    end
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def init_layout_data
    @round_games = Game.by_season(CURRENT_SEASON).by_round(CURRENT_ROUND.to_i - 1) if CURRENT_ROUND.to_i > 1
    @teams = Team.active.order(position: :asc)

    @content = Content.published.last
  end

  def prepare_meta_tags(options={})
    site_name   = "Estadísticas ACB"
    title       = [controller_name, action_name].join(" ")
    description = "Todas las estadísticas de la Liga Endesa ACB, para jugar a SuperManager. Datos de cada jornada: valoración, puntos, rebotes, asistencias, triples y brokerbasket."
    image       = options[:image] || "your-default-image-url"
    current_url = request.url

    # Let's prepare a nice set of defaults
    defaults = {
      site:        site_name,
      title:       title,
      image:       image,
      description: description,
      keywords:    %w[estadísticas acb liga endesa valoración supermanager puntos triples asistencias rebotes brokerbasket],
      twitter: {
        site_name: site_name,
        site: '@estadisticasacb',
        card: 'summary',
        description: description,
        image: image
      },
      og: {
        url: current_url,
        site_name: site_name,
        title: title,
        image: image,
        description: description,
        type: 'website'
      }
    }

    options.reverse_merge!(defaults)

    #set_meta_tags options
  end

  private
    def current_ability
      # I am sure there is a slicker way to capture the controller namespace
      controller_name_segments = params[:controller].split('/')
      controller_name_segments.pop
      controller_namespace = controller_name_segments.join('/').camelize
      Ability.new(current_user, controller_namespace)
    end
end