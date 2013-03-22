require 'test_helper'

class IndexlinksControllerTest < ActionController::TestCase
  setup do
    @indexlink = indexlinks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:indexlinks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create indexlink" do
    assert_difference('Indexlink.count') do
      post :create, indexlink: { image: @indexlink.image, link: @indexlink.link, title: @indexlink.title }
    end

    assert_redirected_to indexlink_path(assigns(:indexlink))
  end

  test "should show indexlink" do
    get :show, id: @indexlink
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @indexlink
    assert_response :success
  end

  test "should update indexlink" do
    put :update, id: @indexlink, indexlink: { image: @indexlink.image, link: @indexlink.link, title: @indexlink.title }
    assert_redirected_to indexlink_path(assigns(:indexlink))
  end

  test "should destroy indexlink" do
    assert_difference('Indexlink.count', -1) do
      delete :destroy, id: @indexlink
    end

    assert_redirected_to indexlinks_path
  end
end
