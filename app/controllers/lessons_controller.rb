class LessonsController < ApplicationController
    before_action :authenticate_user!
    before_action :require_authorized_for_current_lesson, :only => [:show]

	def show
	end

	def create
  	@lesson = current_lesson.section.course(course_params)
    if current_user.enrolled_in?
  	  redirect_to lesson_path(@lesson)
    else
      redirect_to lesson_path, :alert => 'You Are Not Enrolled in this Course!'
    end
  end

  private

  def require_authorized_for_current_lesson
   if current_user.enrolled? 
   		redirect_to_
      render :text => "Unauthorized", :status => :Unauthorized
    end
  end


  helper_method :current_lesson
  def current_lesson
  	@current_lesson ||= Lesson.find(params[:id])
  end
end
