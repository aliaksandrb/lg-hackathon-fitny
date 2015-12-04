class LayoutTypesController < ApplicationController
  before_action :set_layout_type, only: [:show, :edit, :update, :destroy]

  # GET /layout_types
  # GET /layout_types.json
  def index
    @layout_types = LayoutType.all
  end

  # GET /layout_types/1
  # GET /layout_types/1.json
  def show
  end

  # GET /layout_types/new
  def new
    @layout_type = LayoutType.new
  end

  # GET /layout_types/1/edit
  def edit
  end

  # POST /layout_types
  # POST /layout_types.json
  def create
    @layout_type = LayoutType.new(layout_type_params)

    respond_to do |format|
      if @layout_type.save
        format.html { redirect_to @layout_type, notice: 'Layout type was successfully created.' }
        format.json { render :show, status: :created, location: @layout_type }
      else
        format.html { render :new }
        format.json { render json: @layout_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /layout_types/1
  # PATCH/PUT /layout_types/1.json
  def update
    respond_to do |format|
      if @layout_type.update(layout_type_params)
        format.html { redirect_to @layout_type, notice: 'Layout type was successfully updated.' }
        format.json { render :show, status: :ok, location: @layout_type }
      else
        format.html { render :edit }
        format.json { render json: @layout_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /layout_types/1
  # DELETE /layout_types/1.json
  def destroy
    @layout_type.destroy
    respond_to do |format|
      format.html { redirect_to layout_types_url, notice: 'Layout type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_layout_type
      @layout_type = LayoutType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def layout_type_params
      params.require(:layout_type).permit(:name)
    end
end
