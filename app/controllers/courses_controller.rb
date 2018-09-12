class CoursesController < ApplicationController
  before_action :find_course, only: %i[show edit update destroy]
  def index
    @page_title = 'All Courses | PS 113 Admin Panel'
    @courses = Course.where(user_id: current_user.id)
  end

  def show
    @page_title = "#{@course.name} | PS 113 Admin Panel"
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    @course.user_id = current_user.id
    @course.description = Faker::Hipster.paragraph
    if @course.save
      redirect_to current_user
    else
      p @course.errors.full_messages
      render 'new'
    end
  end

  def update
    if @course.update(course_params)
      p 'Course Updated'
      redirect_to @course
    else
      render 'edit'
    end
  end

  def destroy
    p "Terminating #{course.name} from PS 113 Admin Panel"
    course.destroy
    respond_to do |format|
      format.js
      format.html { p 'html response'; redirect_to courses_path }
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :hours)
  end

  def find_course
    @course = Course.find(params[:id])
  end
end
