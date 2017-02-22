class PeopleController < ApplicationController
  include ControllersHelper
  before_action :authenticate_user!, except: [:show]
  before_action :verify_admin, except: [:show]
  before_action :find_person, only: [:edit, :update, :show]

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)
    if @person.save
      redirect_to person_path(@person)
    else
      redirect_to front_page_path
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  private
  def find_person
    @person = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(:name, :surname, :date_of_birth, :place_of_birth, :bio, :martial_status, :nicknames, :height)
  end

end
