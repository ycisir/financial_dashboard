class ApplicationController < ActionController::API
	rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

	def current_user
		User.first
	end

	def require_admin
		render json: { error: "Access denied" }, status: :forbidden unless current_user.admin?
	end

	def require_analyst_or_admin
		unless current_user.admin? || current_user.analyst?
			render json: { error: "Access denied" }, status: :forbidden
		end
	end

	def require_viewer
		unless current_user.viewer? || current_user.analyst? || current_user.admin?
			render json: { error: "Access denied" }, status: :forbidden
		end
	end

	def record_not_found
	  render json: { error: "Record not found" }, status: :not_found
	end
end
