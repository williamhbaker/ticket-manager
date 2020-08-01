class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :destroy, :edit, :update]
  before_action :set_projects, only: [:new, :create, :edit]
  before_action :set_tags, only: [:new, :create, :edit]
  before_action :set_users, only: [:new, :create, :edit]
  before_action :require_user, except: [:show, :index]

  def index
    @tickets = Ticket.all
  end

  def edit
  end 

  def show
  end

  def update
    if @ticket.update(ticket_params)
      flash[:notice] = "The ticket was updated."
      redirect_to tickets_path
    else
      render :edit
    end
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.creator = current_user

    if @ticket.save
      flash[:notice] = 'Created new ticket.'
      redirect_to tickets_path
    else
      render :new
    end
  end

  def destroy
    @ticket.delete
    flash[:notice] = 'Ticket deleted.'
    redirect_to tickets_path
  end

  private

  def ticket_params
    params.require(:ticket).permit(:project_id, :name, :body, :status, :assigned_to_id, tag_ids: [])
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def set_projects
    @projects = Project.all
  end

  def set_tags
    @tags = Tag.all
  end

  def set_users
    @users = User.all
  end
end
