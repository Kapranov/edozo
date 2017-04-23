class MembersController < ApplicationController

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)

    if !verify_recaptcha(model: @member) || !@member.save
      flash[:notice] = "Successfully created member."
      render "new"
    end
  end

  private

  def member_params
    params.require(:member).permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
