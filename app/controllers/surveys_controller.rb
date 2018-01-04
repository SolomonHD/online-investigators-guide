##
# This class controls CRUD operations on the Survey resource.
# * [Note:]
#   View is an alias for survey in all urls which contains survey.
class SurveysController < ApplicationController
  before_action :get_user
  before_action :get_survey_template
  before_action :set_survey, only: [:show, :edit, :update, :destroy]
  before_action :authorize, only: [:index, :show, :new, :edit, :create, :update, :destroy]

  ##
  #   Sets the user view to be the default view when the user first logs in.
  # * [URL]
  #   <i>/users/:user_id/views/:survey_id/toggle_default</i>
  # * [Method]
  #   GET
  # * [URL Params]
  #   [Required:]
  #   1. user_id=Integer
  #   2. survey_id=Integer
  # * [Data Params]
  #   None
  # * [Notes]
  #   None
  def toggle_default
    Survey.where("user_id = ?", params[:user_id]).update_all(:is_default => false)
    Survey.where("id = ? AND user_id = ?", params[:survey_id], params[:user_id]).update(:is_default => true)
    redirect_to user_surveys_path(:user_id => current_user.id)
  end

  ##
  #   Returns the list of user views by user_id
  # * [URL]
  #   <i>/users/:user_id/views</i>
  # * [Method]
  #   GET
  # * [URL Params]
  #   [Required:]
  #   1. user_id=Integer
  # * [Data Params]
  #   None
  # * [Notes]
  #   None
  def index
    @surveys = @user.surveys
  end

  ##
  #   Returns user view by id and user_id
  # * [URL]
  #   <i>/users/:user_id/views/:id</i>
  # * [Method]
  #   GET
  # * [URL Params]
  #   [Required:]
  #   1. user_id=Integer
  #   2. id=Integer
  # * [Data Params]
  #   None
  # * [Notes]
  #   None
  def show
  end

  ##
  #   Returns user survey form by user_id to create a new one.
  # * [URL]
  #   <i>/users/:user_id/views/new</i>
  # * [Method]
  #   GET
  # * [URL Params]
  #   [Required:]
  #   1. user_id=Integer
  # * [Data Params]
  #   None
  # * [Notes]
  #   This survey is pulled from the Survey Template resource by <i>is_default</i>
  def new
    @survey  = @user.surveys.build
  end

  ##
  #   Returns user survey form by user_id to edit.
  # * [URL]
  #   <i>/users/:user_id/views/edit</i>
  # * [Method]
  #   GET
  # * [URL Params]
  #   [Required:]
  #   1. user_id=Integer
  # * [Data Params]
  #   None
  # * [Notes]
  #   None
  def edit
  end

  ##
  #   Creates a new user view
  # * [URL]
  #   <i>/users/:user_id/views</i>
  # * [Method]
  #   POST
  # * [URL Params]
  #   [Required:]
  #   1. user_id=Integer
  # * [Data Params]
  #   None
  # * [Notes]
  #   None
  def create
    @survey = @user.surveys.build(survey_params)

    respond_to do |format|
      if @survey.save
        format.html { redirect_to user_surveys_url(@user), notice: 'Survey was successfully created.' }
        format.json { render :show, status: :created, location: @survey }
      else
        format.html { render :new }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  ##
  #   Updates a user view by id and user_id
  # * [URL]
  #   <i>/users/:user_id/views/:id</i>
  # * [Method]
  #   PATCH
  # * [URL Params]
  #   [Required:]
  #   1. user_id=Integer
  #   2. id=Integer
  # * [Data Params]
  #   None
  # * [Notes]
  #   None
  def update
    respond_to do |format|
      if @survey.update(survey_params)
        format.html { redirect_to user_surveys_url(@user), notice: 'Survey was successfully updated.' }
        format.json { render :show, status: :ok, location: @survey }
      else
        format.html { render :edit }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  ##
  #   Deletes a user view by id and user_id
  # * [URL]
  #   <i>/users/:user_id/views/:id</i>
  # * [Method]
  #   DELETE
  # * [URL Params]
  #   [Required:]
  #   1. user_id=Integer
  #   2. id=Integer
  # * [Data Params]
  #   None
  # * [Notes]
  #   None
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
