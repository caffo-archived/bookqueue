require File.dirname(__FILE__) + '/../test_helper'
require 'books_controller'

# Re-raise errors caught by the controller.
class BooksController; def rescue_action(e) raise e end; end

class BooksControllerTest < Test::Unit::TestCase
  fixtures :books

  def setup
    @controller = BooksController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_get_index
    get :index
    assert_response :success
    assert assigns(:books)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end
  
  def test_should_create_book
    old_count = Book.count
    post :create, :book => { }
    assert_equal old_count+1, Book.count
    
    assert_redirected_to book_path(assigns(:book))
  end

  def test_should_show_book
    get :show, :id => 1
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => 1
    assert_response :success
  end
  
  def test_should_update_book
    put :update, :id => 1, :book => { }
    assert_redirected_to book_path(assigns(:book))
  end
  
  def test_should_destroy_book
    old_count = Book.count
    delete :destroy, :id => 1
    assert_equal old_count-1, Book.count
    
    assert_redirected_to books_path
  end
end
