class BooksController < ApplicationController
before_filter :login_required, :except => [:index,:rss,:show]
before_filter :iphone_check, :only =>[:index]

  # GET /books
  # GET /books.xml
  def index
    @current   = Book.current
    @next      = Book.next
    @finished  = Book.finished
    
    respond_to do |format|
      if Book.all.size == 0
        format.html { render :partial => 'no_books', :layout => 'books'}      
      else
        format.html   # index.rhtml        
      end
      format.xml    { render :xml => @books.to_xml }
    end
  end

  # GET /books/1
  # GET /books/1.xml
  def show
    @book = Book.find(params[:id])

    respond_to do |format|
      format.html # show.rhtml
      format.xml  { render :xml => @book.to_xml }
    end
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1;edit
  def edit
    @book  = Book.find(params[:id])
    @books = Book.find(:all, :order => 'title ASC')
  end

  # POST /books
  # POST /books.xml
  def create
    @book = Book.new(params[:book])

    respond_to do |format|
      if @book.save 
        flash[:notice] = 'Book was successfully created.'
        format.html { redirect_to books_path }
        format.xml  { head :created, :location => book_url(@book) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @book.errors.to_xml }
      end
    end
  end

  # PUT /books/1
  # PUT /books/1.xml
  def update
    @book = Book.find(params[:id])
   @books = Book.find(:all, :order => 'title ASC')
   
     # If book is already rated and the POST try to zero it, override the parameter value
     if params[:book]['rate'] && params[:book]['rate'].strip.empty?
        params[:book].delete("rate")
   	 end

     respond_to do |format|
       if @book.update_attributes(params[:book])          
         flash[:notice] = 'Book was successfully updated.'
         format.html { redirect_to books_path }
         format.xml  { head :ok }
       else
         format.html { render :action => "edit" }
         format.xml  { render :xml => @book.errors.to_xml }
       end
     end
  end

  # DELETE /books/1
  # DELETE /books/1.xml
  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url }
      format.xml  { head :ok }
    end
  end

  
  def rss
    @posts = FeedItem.find(:all, :order => 'created_at DESC')
    render :layout => false
  end

  def relate
    book = Book.find(params[:id])
    related_book = Book.find(params[:related_id])
    if book && related_book
      book.related_books << related_book
      related_book.related_books << book
      flash[:notice] = 'Book relationship done.'
      redirect_to edit_book_path(book.id)
    end
  rescue
    flash[:notice] = 'There was an error relating these books. (Books already related)'
    redirect_to edit_book_path(book.id)
  end

  def remove_relationship
    book = Book.find(params[:id])
    related_book = Book.find(params[:related_id])
    if book && related_book
      book.related_books.delete(related_book)
      flash[:notice] = 'Book relationship removed.'
      redirect_to edit_book_path(book.id)
    end
  rescue
    flash[:notice] = 'There was an error removing the relationship between these books.'
    redirect_to edit_book_path(book.id)
  end

  def iphone_check
    redirect_to :controller => 'iphone' if iphone_user_agent?
  end
end
