class StepsController < ApplicationController
  before_action :set_step, only: [:show, :edit, :update, :destroy]

  # GET /steps
  # GET /steps.json
  def index
    @list = List.find(params[:list_id])
    redirect_to @list
  end

  # GET /steps/1
  # GET /steps/1.json
  def show
  end

  # GET /steps/new
  def new
    @step = Step.new
    @list = List.find(params[:list_id])
  end

  # GET /steps/1/edit
  def edit
    @list = List.find(params[:list_id])
  end

  # POST /steps
  # POST /steps.json
  def create
#    @step = Step.new(step_params, params[:list_id])
    @list = List.find(params[:list_id])
    @step = @list.steps.build(step_params)
    respond_to do |format|
      if @step.save
        format.html { redirect_to @list, notice: 'Step was successfully created.' }
        format.json { render :show, status: :created, location: @step }
      else
        format.html { render :new }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /steps/1
  # PATCH/PUT /steps/1.json
  def update
    respond_to do |format|
        @list = List.find(params[:list_id])
      if @step.update(step_params)
        format.html { redirect_to @list, notice: 'Step was successfully updated.' }
        format.json { render :show, status: :ok, location: @step }
      else
        format.html { render :edit }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /steps/1
  # DELETE /steps/1.json
  def destroy
    @list = List.find(params[:list_id])
    @step.destroy
    respond_to do |format|
      format.html { redirect_to list_steps_url(@list), notice: 'Step was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_step
      @step = Step.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def step_params
      params.require(:step).permit(:content)
    end
end
