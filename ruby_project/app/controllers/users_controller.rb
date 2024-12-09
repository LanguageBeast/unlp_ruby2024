class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :check_accounts_show, only: %i[ show ]
  before_action :check_accounts_update, only: %i[ destroy ]
  before_action :check_accounts_destroy, only: %i[ destroy ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    user = User.find(params[:id])
    user.deactivate

    respond_to do |format|
      format.html { redirect_to users_path, status: :see_other, notice: "This user was successfully deactivated." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.expect(user: [:username, :email, :phone, :password, :role, :entry_date])
  end

  def check_accounts_destroy
    user = User.find(params[:id])
    if !current_user.admin?
      redirect_to users_path, notice: "You are not authorized to deactivate an account."
    end
    if current_user.id == user.id
      redirect_to users_path, notice: "You cannot deactivate your own account."
    end
  end

  def check_accounts_update
    user = User.find(params[:id])
    if current_user.manager? and user.admin?
      redirect_to users_path, notice: "You are not authorized to update an admin account."
    end
    if !current_user.admin? and !current_user.manager?
      redirect_to users_path, notice: "You are not authorized to update an account."
    end
  end

  def check_accounts_show
    user = User.find(params[:id])
    if user.admin? and !current_user.admin?
      redirect_to users_path, notice: "You are not authorized to access nor perform actions on an admin account."
    end
    if !current_user.manager? and !current_user.admin?
      redirect_to users_path, notice: "You are not authorized to view other accounts."
    end
  end
end
