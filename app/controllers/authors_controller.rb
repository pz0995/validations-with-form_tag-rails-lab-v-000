class AuthorsController < ApplicationController

  attr_accessor :author
  
  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def edit
    @author = Author.find(params[:id])
  end

  def create
    @author = Author.new
    #if @author.update(author_params)
    if @author.update(author_params)
      @author.save
      redirect_to author_path(@author)
    else
      render :new
    end
  end

  def update
    @author = Author.find(params[:id])
    if @author.update(author_params)
      redirect_to author_path(@author)
    else
      render :edit
    end
  end

  private

  def author_params
    params.permit(:name, :email, :phone_number)
  end
end
