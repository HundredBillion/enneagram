json.extract! response, :id, :answer, :user_id, :question_id, :created_at, :updated_at
json.url response_url(response, format: :json)
