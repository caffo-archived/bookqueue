class BooksController < ApplicationController
before_filter :login_required, :except => [:index,:rss]

  # GET /books
  # GET /books.xml
  def index
    @current   = Book.find_all_by_state("current")
    @next      = Book.find_all_by_state("next")
    @finished  = Book.find(:all, :conditions => ["state = 'finished'"], :order => "finished_on")
    
    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @books.to_xml }
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
    @book = Book.find(params[:id])
  end

  # POST /books
  # POST /books.xml
  def create
    @book = Book.new(params[:book])

    if params[:cover][:uploaded_data].class.to_s == "ActionController::UploadedStringIO"
      @book.cover = Cover.new(params[:cover]) 
      @book.cover.save
    end

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

    if params[:cover][:uploaded_data].class.to_s == "ActionController::UploadedStringIO"
      @book.cover = Cover.new(params[:cover]) 
      @book.cover.save
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

end
