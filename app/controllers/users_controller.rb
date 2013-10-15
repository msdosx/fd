class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    #render :file => "public/401.html", :status => :unauthorized unless cannot :view, User
    redirect_to user_path(current_user), :alert => "access denied" if cannot? :view, User
    @users = User.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @tags= Tag.all
  end

  # GET /users/1/edit
  def edit
    redirect_to user_path(current_user), :alert => "access denied" if cannot? :edit, User
  end

  # POST /users
  # POST /users.json

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    redirect_to user_path(current_user), :alert => "access denied" if cannot? :delete, User
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:nickname, :name, :soname, :lastname, :bday, :hobby, :enabled)
    end
end
