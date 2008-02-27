require File.dirname(__FILE__) + '/../test_helper'

class FeedItemTest < Test::Unit::TestCase
  fixtures :feed_items, :books
  
  def test_new_feed_item_should_be_created_when_a_book_reading_is_started
     books(:oldman).start_reading!
     assert_equal 3, FeedItem.count
     assert_equal "Started reading 'Old Man Wars', by John Scalzi", FeedItem.find(:all).last.body
  end
  
  def test_new_feed_item_should_be_created_when_a_book_is_finished
      books(:oldman).start_reading!
      books(:oldman).finish!
      assert_equal 4, FeedItem.count
      assert_equal "'Old Man Wars', by John Scalzi - finished in 102 days", FeedItem.find(:all).last.body
  end
end
