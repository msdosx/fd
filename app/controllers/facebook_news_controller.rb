class FacebookNewsController < ApplicationController
  before_action :set_facebook_news, only: [:show, :edit, :update, :destroy]

  # GET /facebook_news
  # GET /facebook_news.json
  def index
    @facebook_news = FacebookNews.all
  end

  # GET /facebook_news/1
  # GET /facebook_news/1.json
  def show
  end

  # GET /facebook_news/new
  def new
    @facebook_news = FacebookNews.new
  end

  # GET /facebook_news/1/edit
  def edit
  end

  # POST /facebook_news
  # POST /facebook_news.json
  def create
    @facebook_news = FacebookNews.new(facebook_news_params)

    respond_to do |format|
      if @facebook_news.save
        format.html { redirect_to @facebook_news, notice: 'Facebook news was successfully created.' }
        format.json { render action: 'show', status: :created, location: @facebook_news }
      else
        format.html { render action: 'new' }
        format.json { render json: @facebook_news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /facebook_news/1
  # PATCH/PUT /facebook_news/1.json
  def update
    respond_to do |format|
      if @facebook_news.update(facebook_news_params)
        format.html { redirect_to @facebook_news, notice: 'Facebook news was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @facebook_news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facebook_news/1
  # DELETE /facebook_news/1.json
  def destroy
    @facebook_news.destroy
    respond_to do |format|
      format.html { redirect_to facebook_news_index_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_facebook_news
      @facebook_news = FacebookNews.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def facebook_news_params
      params.require(:facebook_news).permit(:nickname, :about, :tag_id)
    end
end
