class OpinionsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_opinion, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource  #TODO: fix cancan in opinion

  # GET /opinions
  # GET /opinions.json
  def index
    @opinions = Opinion.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /opinions/1
  # GET /opinions/1.json
  def show
  end

  # GET /opinions/new
  def new
    #@opinion = Opinion.new
    @opinion = Opinion.new
  end

  # GET /opinions/1/edit
  def edit
  end

  # POST /opinions
  # POST /opinions.json
  def create
    @opinion = Opinion.new(opinion_params)

    respond_to do |format|
      if @opinion.save
        format.html { redirect_to @opinion, notice: 'Opinion was successfully created.' }
        format.json { render action: 'show', status: :created, location: @opinion }
      else
        format.html { render action: 'new' }
        format.json { render json: @opinion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /opinions/1
  # PATCH/PUT /opinions/1.json
  def update
    respond_to do |format|
      if @opinion.update(opinion_params)
        format.html { redirect_to @opinion, notice: 'Opinion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @opinion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /opinions/1
  # DELETE /opinions/1.json
  def destroy
    @opinion.destroy
    respond_to do |format|
      format.html { redirect_to opinions_url }
      format.json { head :no_content }
    end
  end

  private

    #def new_opinion
    #  @user = Opinion.new(safe_params)
    #end
    # Use callbacks to share common setup or constraints between actions.
    def set_opinion
      @opinion = Opinion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def opinion_params
      params.require(:opinion).permit(:nickname, :about, :tag_id)
    end
end
