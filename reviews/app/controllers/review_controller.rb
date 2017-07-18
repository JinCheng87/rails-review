class ReviewController < ApplicationController
  def new
    review = Review.new
    render :new, locals: {review: review}
  end

  def review_form
    redirect_to '/login' unless current_user
    review = current_user.reviews.new(review_params)
    if review.save
      redirect_to "/review/#{review.id}"
    else
      render :new, locals: {review: review}
    end
  end

  def id
    review = Review.find_by(id: params[:id])
    render :id, locals: {review: review}
  end

  def review_all
    redirect_to '/login' unless current_user
    reviews = current_user.reviews.all
    render :all, locals: {reviews: reviews}
  end

  def edit_form
    redirect_to '/login' unless current_user
    review = Review.find_by(id: params[:id])
    render :edit, locals: {review: review}
  end

  def edit
    redirect_to '/login' unless current_user
    review = Review.find_by(id:params[:id])
    if review.update_attributes({title: params[:title], body: params[:body]})
      redirect_to "/review/#{review.id}"
    else
      render :edit, locals: {review:review}
    end
  end

  def delete
    redirect_to '/login' unless current_user
    review = Review.find_by(id: params[:id])
    review.destroy
    redirect_to '/review'
  end

  def review_params
    params.permit(:title, :body)
  end

end