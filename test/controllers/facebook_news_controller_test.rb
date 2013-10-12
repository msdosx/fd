require 'test_helper'

class FacebookNewsControllerTest < ActionController::TestCase
  setup do
    @facebook_news = facebook_news(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:facebook_news)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create facebook_news" do
    assert_difference('FacebookNews.count') do
      post :create, facebook_news: { about: @facebook_news.about, nickname: @facebook_news.nickname, tag_id: @facebook_news.tag_id }
    end

    assert_redirected_to facebook_news_path(assigns(:facebook_news))
  end

  test "should show facebook_news" do
    get :show, id: @facebook_news
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @facebook_news
    assert_response :success
  end

  test "should update facebook_news" do
    patch :update, id: @facebook_news, facebook_news: { about: @facebook_news.about, nickname: @facebook_news.nickname, tag_id: @facebook_news.tag_id }
    assert_redirected_to facebook_news_path(assigns(:facebook_news))
  end

  test "should destroy facebook_news" do
    assert_difference('FacebookNews.count', -1) do
      delete :destroy, id: @facebook_news
    end

    assert_redirected_to facebook_news_index_path
  end
end
