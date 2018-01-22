class Admin::PagesController < Admin::BaseController
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  before_action :is_admin?, only: [:new, :edit, :update, :destroy]

  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.all
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
  end

  # GET /pages/new
  def new
    @page = Page.new
    @page.parent_id= params[:parent_id]
    @label = Label.new
  end

  # GET /pages/1/edit
  def edit
    @label = Label.new
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to action: "index", notice: 'Page was successfully created. ' }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to admin_pages_path, notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to action: "index", notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # MOVE Pages /pages/1/move

  def move
    if ["move_lower", "move_higher", "move_to_top", "move_to_bottom"].include?(params[:method]) and params[:page_id] =~ /^\d+$/
      method = ""
      if (params[:method] == "move_lower")
          method = "move_lower"
      elsif (params[:method] == "move_higher")
          method = "move_higher"
      elsif (params[:method] == "move_to_top")
          method = "move_to_top"
      elsif (params[:method] == "move_to_bottom")
          method = "move_to_bottom"
      end
      Page.find(params[:page_id]).send(method)
    end
    redirect_to :action => :index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:title, :header, :body, :parent_id, :is_numbered, :alwaysShow, label_ids: [] )
    end
end
