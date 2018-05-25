class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(reviews_params)
 
    if @review.save
      redirect_to reviews_path
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
  
    if @review.update(reviews_params)
      redirect_to review_path
    else
      render :edit
    end
  end

  def destroy
    Review.find(params[:id]).destroy
    redirect_to reviews_path
  end
 
  private
 
    def reviews_params
      params.require(:review).permit(:name, :entry)
    end

end
