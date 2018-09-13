class CohortsController < ApplicationController
  before_action :find_cohort, only: %i[show edit update]
  before_action :find_course, only: %i[new create show edit update]
  before_action :find_instructor, only: %i[new create edit]

  def index; end

  def show
    @page_title = "#{@cohort.name} | PS 118 Admin Panel"
  end

  def new
    @page_title = 'New Cohort | PS 118 Admin Panel'
    @cohort = Cohort.new
  end

  def create
    @cohort = Cohort.new(cohort_params)
    @cohort.description = Faker::TheFreshPrinceOfBelAir.quote
    @cohort.course_id = @course.id
    if @cohort.save
      redirect_to course_path(@cohort.course_id)
    else
      render 'new'
    end
  end

  def edit
    @page_title = "Editing #{@cohort.name} | PS 118 Admin Panel"
  end

  def update
    if @cohort.update(cohort_params)
      p 'Cohort Updated'
      redirect_to @cohort
    else
      render 'edit'
    end
  end

  def destroy
    p "Terminating #{cohort.name} from PS 118 Admin Panel"
    cohort.destroy
    respond_to do |format|
      format.js
      format.html { p 'html response'; redirect_to course_cohorts_path }
    end
  end

  private

  def cohort_params
    params.require(:cohort).permit(:name, :start, :end, :instructor)
  end

  def find_course
    @course = Course.find(params[:course_id])
  end

  def find_cohort
    @cohort = Cohort.find(params[:id])
  end

  def find_instructor
    @instructor = Instructor.all
  end
end
