class AuthorsController < ApplicationController
  def show
    @author = author_finder
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.valid?
    #@author = Author.create(author_params)
    @author.save
    redirect_to author_path(@author)
    else
      render :new 
    end

  end

  def edit
    @author = author_finder
  end

  def update
    @author = Author.update(author_params)
    redirect_to author_path(@author)
  end


  private

  def author_finder
    @author = Author.find(params[:id])
  end

  def author_params
    params.permit(:name, :email, :phone_number)
  end
end
