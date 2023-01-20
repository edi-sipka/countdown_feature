class CountdownsController < ApplicationController
  before_action :set_countdown, only: %i[show edit update destroy]

  # GET /countdowns or /countdowns.json
  def index
    @countdowns = Countdown.all
  end

  # GET /countdowns/1 or /countdowns/1.json
  def show; end

  # GET /countdowns/new
  def new
    @countdown = Countdown.new
  end

  # GET /countdowns/1/edit
  def edit; end

  # POST /countdowns or /countdowns.json
  def create
    @countdown = Countdown.new(countdown_params)

    respond_to do |format|
      if @countdown.save
        format.html { redirect_to countdown_url(@countdown), notice: 'Countdown was successfully created.' }
        format.json { render :show, status: :created, location: @countdown }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @countdown.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /countdowns/1 or /countdowns/1.json
  def update
    respond_to do |format|
      if @countdown.update(countdown_params)
        format.html { redirect_to countdown_url(@countdown), notice: 'Countdown was successfully updated.' }
        format.json { render :show, status: :ok, location: @countdown }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @countdown.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /countdowns/1 or /countdowns/1.json
  def destroy
    @countdown.destroy

    respond_to do |format|
      format.html { redirect_to countdowns_url, notice: 'Countdown was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_countdown
    @countdown = Countdown.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def countdown_params
    params.require(:countdown).permit(:name, :description, :target)
  end
end
