class QuestionsController < ApplicationController
  def index
  end

  def show
    render questions_tags_path
  end


end
