require 'test_helper'

class ListingTasksControllerTest < ActionController::TestCase
  setup do
    @listing_task = listing_tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:listing_tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create listing_task" do
    assert_difference('ListingTask.count') do
      post :create, listing_task: { description: @listing_task.description }
    end

    assert_redirected_to listing_task_path(assigns(:listing_task))
  end

  test "should show listing_task" do
    get :show, id: @listing_task
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @listing_task
    assert_response :success
  end

  test "should update listing_task" do
    patch :update, id: @listing_task, listing_task: { description: @listing_task.description }
    assert_redirected_to listing_task_path(assigns(:listing_task))
  end

  test "should destroy listing_task" do
    assert_difference('ListingTask.count', -1) do
      delete :destroy, id: @listing_task
    end

    assert_redirected_to listing_tasks_path
  end
end
