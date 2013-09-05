class WorksheetsController < ApplicationController
  before_action :set_worksheet, only: [:show, :edit, :update, :destroy]

  # GET /worksheets
  # GET /worksheets.json
  def index
    @worksheets = Worksheet.all
  end

  # GET /worksheets/1
  # GET /worksheets/1.json
  def show
  end

  # GET /worksheets/new
  def new
    @worksheet = Worksheet.new
    100.times {@worksheet.stimulreaction.build}
  end

  # GET /worksheets/1/edit
  def edit
  end

  # POST /worksheets
  # POST /worksheets.json
  def create
    @worksheet = Worksheet.new(worksheet_params)

    respond_to do |format|
      if @worksheet.save
        format.html { redirect_to @worksheet, notice: 'Worksheet was successfully created.' }
        format.json { render action: 'show', status: :created, location: @worksheet }
      else
        format.html { render action: 'new' }
        format.json { render json: @worksheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /worksheets/1
  # PATCH/PUT /worksheets/1.json
  def update
    respond_to do |format|
      if @worksheet.update(worksheet_params)
        format.html { redirect_to @worksheet, notice: 'Worksheet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @worksheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /worksheets/1
  # DELETE /worksheets/1.json
  def destroy
    @worksheet.destroy
    respond_to do |format|
      format.html { redirect_to worksheets_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_worksheet
      @worksheet = Worksheet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def worksheet_params
#      params.require(:worksheet).permit(:sex, :age, :language_name, :specialty_name, :dateinput,
#	 :city_name, :language_id, :specialty_id, :dateinput, :city_id , :stimulreactions => [:id, :stimul_id, :reaction_id])
      params.require(:worksheet).permit(:sex, :age, :language_name, :specialty_name, :dateinput,
	 :city_name, :language_id, :specialty_id, :dateinput, :city_id , stimulreaction_attributes:  [:id,:stimul_name , :stimul_id, :reaction_name, :_destroy])

    end
end
