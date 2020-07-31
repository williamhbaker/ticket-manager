class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :destroy, :edit, :update]
  before_action :require_user, except: [:show, :index]

  def index
    @tags = Tag.all
  end

  def edit
  end

  def update
    if @tag.update(tag_params)
      flash[:notice] = "The tag was updated."
      redirect_to tags_path
    else
      render :edit
    end
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      flash[:notice] = 'Created new tag.'
      redirect_to tags_path
    else
      render :new
    end
  end

  def destroy
    @tag.delete
    flash[:notice] = 'Tag deleted.'
    redirect_to tags_path
  end

  private

  def tag_params
    params.require(:tag).permit(:project_id, :name, :body, :status)
  end

  def set_tag
    @tag = Tag.find(params[:id])
  end
end
