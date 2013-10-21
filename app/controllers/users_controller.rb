class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # gem 'inherited_resources'
  def index
    @users = User.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @tags= Tag.all
    params[:current_tag_id] ||= Tag.first[:id]
    @post = Post
      .uniq.joins(:opinion)
      .where('"opinions"."tag_id" = ?', params[:current_tag_id])
      .paginate(:page => params[:page], :per_page => 6)
      #.where('"post"."message" IS NOT NULL')
  end

  def edit ; end

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

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:nickname, :name, :soname, :lastname, :bday, :hobby, :enabled)
    end
end
