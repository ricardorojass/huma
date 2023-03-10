# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :authenticate_user, only: [:create, :update, :destroy]
  before_action :authorize_actions

  def index
    categories = orchestrate_query(Category.all)
    render serialize(categories)
  end

  def show
    render serialize(category)
  end

  def create
    if category.save
      render serialize(category).merge(status: :created, location: category)
    else
      unprocessable_entity!(category)
    end
  end

  def update
    if category.update(category_params)
      render serialize(category).merge(status: :ok)
    else
      unprocessable_entity!(category)
    end
  end

  def destroy
    category.destroy
    render status: :no_content
  end

  private

  def category
    @category ||= params['id'] ? Category.find_by!(id: params[:id]) :
                                 Category.new(category_params)
  end
  alias_method :resource, :category

  def category_params
    params.require(:data).permit(:name, :description)
  end
end
