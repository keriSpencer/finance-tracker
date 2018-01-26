class StocksController < ApplicationController
  def search
    if params[:stock].blank?
      flash.now[:danger] = "You have entered an empty string"
    else
      @stock = Stock.new_from_lookup(params[:stock])
      flash.now[:danger] = "You have entered an incorrect symbol" unless @stock
    end
    respond_to do |format|
      format.js { render 'stocks/search' }
    end
  end

  # Alex's refact
  # def search
  #   if params[:stock].present?
  #     @stock = Stock.new_from_lookup(params[:stock])
  #     if !@stock.present?
  #       flash[:danger] = "You have entered an incorrect symbol"
  #     end
  #   else
  #     flash[:danger] = "You have entered an empty string"
  #   end
  #   respond_to do |format|
  #     format.js
  #   end
  # end
end
