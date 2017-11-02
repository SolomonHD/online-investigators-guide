class SurveyTemplatesController < ApplicationController
  before_action :set_survey_template, only: [:show, :edit, :update, :destroy]
  before_action :is_admin?, only: [:index, :show, :new, :edit, :create, :update, :destroy]

  # GET /survey_templates
  # GET /survey_templates.json
  def index
    @survey_templates = SurveyTemplate.all
  end

  # GET /survey_templates/1
  # GET /survey_templates/1.json
  def show
  end

  # GET /survey_templates/new
  def new
    @survey_template = SurveyTemplate.new
  end

  # GET /survey_templates/1/edit
  def edit
  end

  # POST /survey_templates
  # POST /survey_templates.json
  def create
    @survey_template = SurveyTemplate.new(survey_template_params)

    respond_to do |format|
      if @survey_template.save
        # If the Survey Template that we are saving is the defualt,
        # then we need to change the others Survey Templates not to be the default.
        if @survey_template.is_default
          SurveyTemplate.where.not(id: @survey_template.id).update_all(:is_default => false)
        end

        format.html { redirect_to @survey_template, notice: 'Survey template was successfully created.' }
        format.json { render :show, status: :created, location: @survey_template }
      else
        format.html { render :new }
        format.json { render json: @survey_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /survey_templates/1
  # PATCH/PUT /survey_templates/1.json
  def update
    respond_to do |format|
      if @survey_template.update(survey_template_params)
        # If the Survey Template that we are editing is the defualt,
        # then we need to change the others Survey Templates not to be the default.
        if @survey_template.is_default
          SurveyTemplate.where.not(id: @survey_template.id).update_all(:is_default => false)
        end

        format.html { redirect_to @survey_template, notice: 'Survey template was successfully updated.' }
        format.json { render :show, status: :ok, location: @survey_template }
      else
        format.html { render :edit }
        format.json { render json: @survey_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /survey_templates/1
  # DELETE /survey_templates/1.json
  def destroy
    @survey_template.destroy
    respond_to do |format|
      format.html { redirect_to survey_templates_url, notice: 'Survey template was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey_template
      @survey_template = SurveyTemplate.find(params[:id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_survey_template
      @survey_template = SurveyTemplate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_template_params
      params.require(:survey_template).permit(:name, :is_default,
        questions_attributes: [:id, :survey_template_id, :content, :question_type_id, :_destroy,
          answers_attributes: [:id, :question_id, :content, :_destroy]])
    end
end