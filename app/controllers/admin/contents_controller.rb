class Admin::ContentsController < ApplicationController

  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper
  load_and_authorize_resource

  def index
    contents_scope = Content.all

    smart_listing_create :contents, contents_scope, partial: "admin/contents/listing"
  end

  def new
    @content = Content.new
  end

  def create
    @content = Content.create(content_params)
  end

  def edit
    @content = Content.find(params[:id])
  end

  def update
    @content = Content.find(params[:id])
    @content.assign_attributes(content_params)
    @content.save
  end

  def destroy
    @content.destroy
  end

  private
    def find_content
      @content = Content.find(params[:id])
    end

    def content_params
      params.require(:content).permit([:title, :body, :summary, :keywords, :image_thumb_url, :image_url, :user_id, :created_at, :published])
    end
end