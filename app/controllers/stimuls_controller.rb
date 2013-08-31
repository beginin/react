class StimulsController < ApplicationController
  before_action :set_stimul, only: [:show, :edit, :update, :destroy]

  # GET /stimuls
  # GET /stimuls.json
  def index
    @stimuls = Stimul.all
  end

  def search
    @stimuls = Stimul.order(:stimul).where("stimul like ?", '%' + search_params['term'] + '%' )
    render json: @stimuls.map(&:stimul)
  end

  # GET /stimuls/1
  # GET /stimuls/1.json
  def show
  end

  # GET /stimuls/new
  def new
    @stimul = Stimul.new
  end

  # GET /stimuls/1/edit
  def edit
  end

  # POST /stimuls
  # POST /stimuls.json
  def create
    @stimul = Stimul.new(stimul_params)

    respond_to do |format|
      if @stimul.save
        format.html { redirect_to @stimul, notice: 'Stimul was successfully created.' }
        format.json { render action: 'show', status: :created, location: @stimul }
      else
        format.html { render action: 'new' }
        format.json { render json: @stimul.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stimuls/1
  # PATCH/PUT /stimuls/1.json
  def update
    respond_to do |format|
      if @stimul.update(stimul_params)
        format.html { redirect_to @stimul, notice: 'Stimul was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @stimul.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stimuls/1
  # DELETE /stimuls/1.json
  def destroy
    @stimul.destroy
    respond_to do |format|
      format.html { redirect_to stimuls_url }
      format.json { head :no_content }
    end
  end

  def upload
    
  end

  def uploadcsv
     Stimul.uploadcsv(upload_params)
     respond_to do |format|
      format.html { redirect_to stimuls_url }
      format.json { head :no_content }
     end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stimul
      @stimul = Stimul.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stimul_params
      params.require(:stimul).permit(:stimul)
    end

    def upload_params
      params.require(:upload).permit!
    end

    def search_params
      params.permit(:term)
    end
end
