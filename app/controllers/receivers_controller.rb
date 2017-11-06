class ReceiversController < ApplicationController
  before_action :member_required
  before_action :set_user
  before_action :set_receiver, only: [:show, :edit, :update, :destroy]

  # GET /receivers
  # GET /receivers.json
  def index
    @receivers = Receiver.all
  end

  # GET /receivers/1
  # GET /receivers/1.json
  def show
  end

  # GET /receivers/new
  def new
    @receiver = Receiver.new
  end

  # GET /receivers/1/edit
  def edit
  end

  # POST /receivers
  # POST /receivers.json
  def create
    @receiver = current_user.receivers.new(receiver_params)

    respond_to do |format|
      if @receiver.save
        format.html { redirect_to @user, notice: 'Receiver was successfully created.' }
        format.json { render :show, status: :created, location: @receiver }
      else
        format.html { render :new }
        format.json { render json: @receiver.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /receivers/1
  # PATCH/PUT /receivers/1.json
  def update
    respond_to do |format|
      if @receiver.update(receiver_params)
        format.html { redirect_to @user, notice: 'Receiver was successfully updated.' }
        format.json { render :show, status: :ok, location: @receiver }
      else
        format.html { render :edit }
        format.json { render json: @receiver.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receivers/1
  # DELETE /receivers/1.json
  def destroy
    if not is_self?
      return
    end

    @receiver.destroy
    respond_to do |format|
      format.html { redirect_to @user, notice: 'Receiver was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receiver
      @receiver = current_user.receivers.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def is_self?
      current_user.id == @user.id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def receiver_params
      params.require(:receiver).permit(:name, :phone, :address)
    end
end
