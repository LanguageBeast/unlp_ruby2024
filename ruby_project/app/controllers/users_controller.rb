class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :check_admin_accounts_accesss, only: %i[ update destroy show ]
  before_action :check_other_accounts_accesss, only: %i[ update destroy ]
  before_action :check_role_for_show, only: %i[ show ]

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
    @user.destroy!

    respond_to do |format|
      format.html { redirect_to users_path, status: :see_other, notice: "User was successfully destroyed." }
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

  def check_admin_accounts_accesss
    user = User.find(params[:id])
    if user.admin? and !current_user.admin?
      redirect_to users_path, notice: "You are not authorized to access nor perform actions on an admin account."
    end
  end

  def check_other_accounts_accesss
    user = User.find(params[:id])
    if !user.admin? and (!current_user.manager? || !current_user.admin?)
      redirect_to users_path, notice: "You are not authorized to perform actions on other accounts."
    end
  end

  def check_role_for_show
    puts current_user.manager?, current_user.admin?
    if !current_user.manager? and !current_user.admin?
      redirect_to users_path, notice: "You are not authorized to view other accounts."
    end
  end
end
