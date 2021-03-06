class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  impressionist actions: [:show], unique: [:session_hash]
  
  def index
    if params[:tag]

       @pins = Pin.order("created_at DESC").paginate(:page => params[:page], :per_page => 15).tagged_with(params[:tag])
    else
       @pins = Pin.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 15)
    end
  end

  def show
    commontator_thread_show(@pin)
    @pin = Pin.find(params[:id])
   impressionist(@pin)
  end

  def new
    @pin = current_user.pins.build
  end

  def edit
  end
  
 def create
    @pin = current_user.pins.build(pin_params)
    if @pin.save
      redirect_to @pin, notice: 'Pin was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: 'Pin was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @pin.destroy
    redirect_to pins_url
  end
  
  private
    
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def correct_user
      @pin = current_user.pins.find_by(id: params[:id] )
      redirect_to pins_path, notice: "Not authorized to edit this Pin" if @pin.nil?
    end

    
    def pin_params
      params.require(:pin).permit(:description, :image, :document, :description_text, :paper, :tag_list, :duedate )
    end
end
