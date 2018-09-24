class StudentsController < ApplicationController
  before_action :find_student, only: %i[edit update show destroy]
  before_action :find_course, only: %i[new create edit update show]
  def index; end

  def show; end

  def new
    @page_title = 'New Student | PS 118 Admin Panel'
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    @student.course_id = @course.id
    @student.generate_school_id
    @student.address = Faker::Address.full_address
    if @student.save
      flash[:notice] = 'Student created successfully.'
      redirect_to course_path(@course.id)
    else
      p @student.errors.full_messages
      render 'new'
    end
  end

  def edit
    @page_title = "Editing #{@student.full_name} | PS 118 Admin Panel"
    @cohort = Cohort.all
  end

  def update
    if @student.update(student_params)
      flash[:notice] = "#{@student.full_name} updated successfully."
      redirect_to @student
    else
      render 'edit'
    end
  end

  def destroy; end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :education, :birthday, :cohort_id)
  end

  def find_course
    @course = Course.find(params[:course_id])
   end

  def find_student
    @student = Student.find(params[:id])
  end
end
