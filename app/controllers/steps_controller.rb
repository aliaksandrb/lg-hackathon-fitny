class StepsController < ApplicationController
  before_action :set_step, only: [
    :show, :edit, :update, :destroy, :play, :next_step
  ]

  def play
    @hidesidebar = true
  end

  def next_step
    guide = @step.guide
    steps = guide.steps.sort_by(&:line_number)

    next_step = steps.detect { |s| s.line_number > @step.line_number }

    if next_step
      render json: { step_id: next_step.id, url: step_url(next_step)}
    else
      render json: { step_id: 0 }
    end
  end

  # GET /steps
  # GET /steps.json
  def index
    @steps = Step.all
  end

  # GET /steps/1
  # GET /steps/1.json
  def show
  end

  # GET /steps/new
  def new
    @guide = Guide.find(params[:guide_id])
    @step = @guide.steps.build
  end

  # GET /steps/1/edit
  def edit
  end

  # POST /steps
  # POST /steps.json
  def create
    @guide = Guide.find(params[:guide_id])
    @step = @guide.steps.build(step_params)
    #@step = Step.new(step_params)

    respond_to do |format|
      if @step.save
        format.html { redirect_to @guide, notice: 'Step was successfully created.' }
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
      if @step.update(step_params)
        format.html { redirect_to @step, notice: 'Step was successfully updated.' }
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
    @step.destroy
    respond_to do |format|
      format.html { redirect_to steps_url, notice: 'Step was successfully destroyed.' }
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
      params.require(:step).permit(
        :name, :guide_id, :timer, :line_number, :layout_type_id, :description,
        :static_picture, :video
      )
    end
end
