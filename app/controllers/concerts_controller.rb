class ConcertsController < ApplicationController
  before_action :set_concert, only: %i[ show edit update destroy ]
  before_action :set_band #Visible para todos los metodos y vistas

  # GET /concerts or /concerts.json
  def index
    @concerts = @band.concerts #Obtener todos los conciertos de una banda
  end

  # GET /concerts/1 or /concerts/1.json
  def show
  end

  # GET /concerts/new
  def new
    @concert = @band.concerts.build #Construye el concierto asociado a una banda
  end

  # GET /concerts/1/edit
  def edit
  end

  # POST /concerts or /concerts.json
  def create
    @concert = @band.concerts.build(concert_params)

    respond_to do |format|
      if @concert.save
        format.html { redirect_to [@band, @concert], notice: "Concert was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /concerts/1 or /concerts/1.json
  def update
    respond_to do |format|
      if @concert.update(concert_params)
        format.html { redirect_to [@band, @concert], notice: "Concert was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /concerts/1 or /concerts/1.json
  def destroy
    @concert.destroy
    respond_to do |format|
      format.html { redirect_to band_concerts_url, notice: "Concert was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_concert
      @concert = Concert.find(params[:id])
    end

    def set_band
      @band = Band.find(params[:band_id])
    end

    # Only allow a list of trusted parameters through.
    def concert_params
      params.require(:concert).permit(:attendance, :duration, :date)
    end
end
