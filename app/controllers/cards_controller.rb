class CardsController < ApplicationController
  def index
    @cards = Card.all
    @cards.sample(5)

    if params[:query].present?
      @cards = Card.where('name ILIKE ?', "%#{params[:query]}%")
    end
  end
end
