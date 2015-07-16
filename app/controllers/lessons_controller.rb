class LessonsController < ApplicationController
    before_action :authenticate_user!
    before_action :require_authorized_for_current_lesson, :only => [:show]

	def show
	end

	def require_authorized_for_current_lesson
      course = section.course
  	  @lesson = current_lesson.section.course(course)
      section = @lesson.section
    if current_user.enrolled_in?(course)
  	  redirect_to course_path(course)
    else
      redirect_to course_path, :alert => 'You Are Not Enrolled in this Course!'
    end
  end

  private


  helper_method :current_lesson
  def current_lesson
  	@current_lesson ||= Lesson.find(params[:id])
  end
end
