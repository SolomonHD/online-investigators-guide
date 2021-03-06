class SurveysController < ApplicationController
  before_action :get_user
  before_action :get_survey_template
  before_action :set_survey, only: [:show, :edit, :update, :destroy]
  before_action :authorize, only: [:index, :show, :new, :edit, :create, :update, :destroy]
  before_action :maintenance_mode

  def toggle_default
    Survey.where("user_id = ?", params[:user_id]).update_all(:is_default => false)
    Survey.where("id = ? AND user_id = ?", params[:survey_id], params[:user_id]).update(:is_default => true)
    redirect_to user_surveys_path(:user_id => current_user.id)
  end

  # GET /surveys
  # GET /surveys.json
  def index
    @surveys = @user.surveys
  end

  # GET /surveys/1
  # GET /surveys/1.json
  def show
  end

  # GET /surveys/new
  def new
    @survey  = @user.surveys.build
  end

  # GET /surveys/1/edit
  def edit
  end

  # POST /surveys
  # POST /surveys.json
  def create
    @survey = @user.surveys.build(survey_params)

    respond_to do |format|
      if @survey.save
        # If the Survey that we are saving is the defualt,
        # then we need to change the others Survey not to be the default.
        if @survey.is_default
          Survey.where("id != ? AND user_id = ?", @survey.id, @survey.user_id).update_all(:is_default => false)
        end

        format.html { redirect_to user_surveys_url(@user), notice: 'Survey was successfully created.' }
        format.json { render :show, status: :created, location: @survey }
      else
        format.html { render :new }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /surveys/1
  # PATCH/PUT /surveys/1.json
  def update
    respond_to do |format|
      # If THIS survey is the default and the user is trying to change it,
      # we can not allow this operation.
      if @survey.is_default && survey_params[:is_default] == "0"
        redirect_to edit_user_survey_path(@user, @survey),
          :notice=> 'There must be one default view at all times.' and return
      end

      if @survey.update(survey_params)
        # If we are going to update THIS view as the default,
        # then we need to set the others Surveys is_default column to false.
        if @survey.is_default
          Survey.where("id != ? AND user_id = ?", @survey.id, @survey.user_id).update_all(:is_default => false)
        end

        format.html { redirect_to user_surveys_url(@user), notice: 'Survey was successfully updated.' }
        format.json { render :show, status: :ok, location: @survey }
      else
        format.html { render :edit }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.json
  def destroy
    @survey.destroy
    respond_to do |format|
      format.html { redirect_to user_surveys_path(@user), notice: 'Survey was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # get_user converts the user_id given by the routing
    # into an @user object, for use here and in the view
    def get_user
      @user = User.find(params[:user_id])
    end

    def get_survey_template
      # TODO: Need to figure out how to handle if there is no default survey template.
      @survey_template = SurveyTemplate.where(["is_default = ?", true]).first
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = @user.surveys.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_params
      params.require(:survey).permit(:name, :description, :is_default, :user_id, :survey_template_id, answer_ids:[])
    end
end
