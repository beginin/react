class StimulreactionsController < ApplicationController
  before_action :set_stimulreaction, only: [:show, :edit, :update, :destroy]

  # GET /stimulreactions
  # GET /stimulreactions.json
  def index
    @stimulreactions = Stimulreaction.all
  end

  # GET /stimulreactions/1
  # GET /stimulreactions/1.json
  def show
  end

  # GET /stimulreactions/new
  def new
    @stimulreaction = Stimulreaction.new
  end

  # GET /stimulreactions/1/edit
  def edit
  end

  # POST /stimulreactions
  # POST /stimulreactions.json
  def create
    @stimulreaction = Stimulreaction.new(stimulreaction_params)

    respond_to do |format|
      if @stimulreaction.save
        format.html { redirect_to @stimulreaction, notice: 'Stimulreaction was successfully created.' }
        format.json { render action: 'show', status: :created, location: @stimulreaction }
      else
        format.html { render action: 'new' }
        format.json { render json: @stimulreaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stimulreactions/1
  # PATCH/PUT /stimulreactions/1.json
  def update
    respond_to do |format|
      if @stimulreaction.update(stimulreaction_params)
        format.html { redirect_to @stimulreaction, notice: 'Stimulreaction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @stimulreaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stimulreactions/1
  # DELETE /stimulreactions/1.json
  def destroy
    @stimulreaction.destroy
    respond_to do |format|
      format.html { redirect_to stimulreactions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stimulreaction
      @stimulreaction = Stimulreaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stimulreaction_params
      params.require(:stimulreaction).permit(:worksheet_id, :reaction_id, :stimul_id)
    end
end
