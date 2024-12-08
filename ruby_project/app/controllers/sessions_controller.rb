# app/controllers/sessions_controller.rb
class SessionsController < Devise::SessionsController
  # GET /login
  def new
    super
  end

  # POST /login
  def create
    super
  end

  # DELETE /logout
  def destroy
    super
  end
end
