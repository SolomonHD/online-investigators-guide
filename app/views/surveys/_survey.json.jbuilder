json.extract! survey, :id, :name, :description, :user_id, :survey_template_id, :created_at, :updated_at
json.url survey_url(survey, format: :json)
