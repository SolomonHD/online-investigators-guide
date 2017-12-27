class Admin::SiteInformationsController < Admin::BaseController
  before_action :set_admin_site_information, only: [:show, :edit, :update, :destroy]

  # GET /admin/site_informations
  # GET /admin/site_informations.json
  def index
    @admin_site_informations = Admin::SiteInformation.all
    @contact_information = Admin::SiteInformation.where("name = 'contact_info'").first
    @branding_information = Admin::SiteInformation.where("name = 'branding'").first
  end

  # GET /admin/site_informations/1
  # GET /admin/site_informations/1.json
  def show
  end

  # GET /admin/site_informations/new
  def new
    @admin_site_information = Admin::SiteInformation.new
  end

  # GET /admin/site_informations/1/edit
  def edit
  end

  # POST /admin/site_informations
  # POST /admin/site_informations.json
  def create
    @admin_site_information = Admin::SiteInformation.new(admin_site_information_params)

    respond_to do |format|
      if @admin_site_information.save
        format.html { redirect_to @admin_site_information, notice: 'Site information was successfully created.' }
        format.json { render :show, status: :created, location: @admin_site_information }
      else
        format.html { render :new }
        format.json { render json: @admin_site_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/site_informations/1
  # PATCH/PUT /admin/site_informations/1.json
  def update
    respond_to do |format|
      if @admin_site_information.update(admin_site_information_params)
        format.html { redirect_to @admin_site_information, notice: 'Site information was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_site_information }
      else
        format.html { render :edit }
        format.json { render json: @admin_site_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/site_informations/1
  # DELETE /admin/site_informations/1.json
  def destroy
    @admin_site_information.destroy
    respond_to do |format|
      format.html { redirect_to admin_site_informations_url, notice: 'Site information was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_site_information
      @admin_site_information = Admin::SiteInformation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_site_information_params
      params.require(:admin_site_information).permit(:name, :text, :header, :url)
    end
end
