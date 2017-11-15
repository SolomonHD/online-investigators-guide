class Admin::SupportingUnitsController < Admin::BaseController
  before_action :set_admin_supporting_unit, only: [:show, :edit, :update, :destroy]

  # GET /admin/supporting_units
  # GET /admin/supporting_units.json
  def index
    @admin_supporting_units = Admin::SupportingUnit.all
  end

  # GET /admin/supporting_units/1
  # GET /admin/supporting_units/1.json
  def show
  end

  # GET /admin/supporting_units/new
  def new
    @admin_supporting_unit = Admin::SupportingUnit.new
  end

  # GET /admin/supporting_units/1/edit
  def edit
  end

  # POST /admin/supporting_units
  # POST /admin/supporting_units.json
  def create
    @admin_supporting_unit = Admin::SupportingUnit.new(admin_supporting_unit_params)

    respond_to do |format|
      if @admin_supporting_unit.save
        format.html { redirect_to admin_supporting_units_path, notice: 'Supporting unit was successfully created.', target: "_blank" }
        format.json { render :show, status: :created, location: @admin_supporting_unit }
      else
        format.html { render :new }
        format.json { render json: @admin_supporting_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/supporting_units/1
  # PATCH/PUT /admin/supporting_units/1.json
  def update
    respond_to do |format|
      if @admin_supporting_unit.update(admin_supporting_unit_params)
        format.html { redirect_to @admin_supporting_unit, notice: 'Supporting unit was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_supporting_unit }
      else
        format.html { render :edit }
        format.json { render json: @admin_supporting_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/supporting_units/1
  # DELETE /admin/supporting_units/1.json
  def destroy
    @admin_supporting_unit.destroy
    respond_to do |format|
      format.html { redirect_to admin_supporting_units_url, notice: 'Supporting unit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_supporting_unit
      @admin_supporting_unit = Admin::SupportingUnit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_supporting_unit_params
      params.require(:admin_supporting_unit).permit(:unit, :title, :url)
    end
end
