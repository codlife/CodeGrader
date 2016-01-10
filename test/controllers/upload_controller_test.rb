require 'test_helper'

class UploadControllerTest < ActionController::TestCase
  # test "should get index" do
  #   get :index
  #   assert_response :success
  # end
  test "should get supload" do
  	get :supload
    	assert_response :success
  end
  test "should get tupload" do
  	get :tupload
  	assert_response :success
  end

  test "should post uploadFile"  do
  	post :uploadFile
  	assert_response :success	
  end
 
end
 