class MessagesController < ApplicationController
  before_action :find_message, only: [:show, :edit, :update, :destroy]

  def index
    @messages = Message.all.order("created_at DESC")
  end

  def show
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.create(message_params)

    if @message.save
      redirect_to @message
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @message.update(message_params)
      redirect_to @message
    else
      render "edit"
    end
  end

  def destroy
    @message.destroy

    redirect_to root_path
  end

  private

  def find_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:title, :description)
  end

end