class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_lesson, :only => [:show]

	def show
	end

	def require_authorized_for_current_lesson
    if current_user.lessons != current_user
      return render :text => 'Unauthorized', :status => :Unauthorized
    else
      redirect_to course_path
    end
  end

  private

  helper_method :current_lesson

  def current_lesson
  	@current_lesson ||= Lesson.find(params[:id])
  end
end
