class SearchesController < ApplicationController
  def create
    @tag = Tag.find(params[:tag_id])
    @tag.searches.
  end
end
