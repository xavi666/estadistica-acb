class ContentsController < ApplicationController

  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper

  def index
    # SEO
    @page_title       = t('.title')
    @page_description = t('.description')
    @page_keywords    = t('.keywords')
    # SEO

    @contents = Content.published
  end

  def show
    @content = Content.find params[:id]

    # SEO
    @page_title       = @content.title
    @page_description = @content.summary
    @page_keywords    = @content.keywords
    # SEO
  end

  private
    def find_content
      @game = Content.find(params[:id])
    end
end