class Api::V1::ContentsController < ApplicationController
  before_action :authenticate_user, only: [:create, :update, :destroy]

  def index
    contents = Content.all
    render json: contents, each_serializer: ContentSerializer
  end

  def create
    content = current_user.contents.build(content_params)

    if content.save
      render json: content, serializer: ContentSerializer
    else
      render_error("Could not create content", :unprocessable_entity)
    end
  end

  def show
    content = Content.find(params[:id])
    render json: content, serializer: ContentSerializer
  end

  def update
    content = Content.find(params[:id])

    if content.update(content_params)
      render json: content, serializer: ContentSerializer
    else
      render_error("Could not update content", :unprocessable_entity)
    end
  end

def destroy
    content = Content.find(params[:id])

    if content.destroy
      render json: {message: "Deleted"}
    else
      render_error("Could not delete content", :unprocessable_entity)
    end
  end

  private

  def content_params
    params.require(:content).permit(:title, :body)
  end

  def render_error(message, status)
    render json: { errors: message }, status: status
  end
end
