require File.dirname(__FILE__) + '/../test_helper'

class BookTest < Test::Unit::TestCase
  fixtures :books, :feed_items
  
  def test_initial_state_should_be_next
    book = create_book
    assert_equal 'next', book.state
  end
  
  def test_start_reading_should_fill_the_started_on_field
    books(:oldman).start_reading!  
    assert_not_nil books(:oldman).started_on
  end
  
  def test_start_reading_should_trigger_current_in_a_next_book
    books(:oldman).start_reading!
    assert_equal 'current', books(:oldman).state
  end
  
  def test_finish_a_current_book_should_trigger_finished_in_a_next_book
    books(:oldman).start_reading!
    books(:oldman).finish!
    assert_equal 'finished', books(:oldman).state
  end
  
  def test_finish_a_book_should_fill_the_finished_on_field
    books(:oldman).start_reading!  
    books(:oldman).finish!  
    assert_not_nil books(:oldman).finished_on
  end
  
  def test_a_next_book_cant_get_finished
    books(:oldman).finish!
    assert_equal 'next', books(:oldman).state
  end

  def test_days_taken_should_return_the_difference_between_started_and_finished_date
    books(:oldman).start_reading!
    books(:oldman).started_on = Date.yesterday
    books(:oldman).save!
    books(:oldman).finish!  
    assert_equal 1, books(:oldman).days_taken
  end
  
  def test_update_status
    books(:oldman).new_status = 'current'
    books(:oldman).update_status!
    assert_equal 'current', books(:oldman).state
  end

  protected
    def create_book(options = {})
      Book.create({ :title      => 'Conan', 
                    :url        => 'http://www.amazon.com/Coming-Conan-Cimmerian-Cimmeria-Book/dp/0345461517', 
                    :image      => 'http://www.timelineuniverse.net/images/ConanCimmerian.jpg', 
                    :author     => 'Robert E. Howard',
                    :created_at => '2008-01-01 17:26:40'
                    }.merge(options))
    end
end
