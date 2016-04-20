class RegistrationEmailsController < ApplicationController
  def new
    @registration_email = RegistrationEmail.new
  end

  def create
    @registration_email = RegistrationEmail.new(params[:registration_email])

    respond_to do |format|
      if @registration_email.deliver
        format.json { render json: @registration_email, status: :created }
      else
        format.json { render json: @registration_email.errors, status: :unprocessable_entity }
      end
    end

  end
end
