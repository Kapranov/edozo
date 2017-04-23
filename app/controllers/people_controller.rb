class PeopleController < ApplicationController
  def new
    @person = Person.new
  end

  def create
    @person = Person.new(allowed_params)

    if @person.save
      flash[:notice] = "Successfully created person."
      redirect_to root_url
    else
      render :new
    end
  end

  private

  def allowed_params
    params.require(:person).permit!
  end
end
