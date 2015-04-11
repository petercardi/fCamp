class QuotesController < ApplicationController

  before_action :current_user

  def index
    @quotes = Quote.all.order('LOWER(author)')
  end

  # def show
  #   @quote = Quote.find(params[:id])
  # end

  def new
    @quote = Quote.new
  end

  def edit
  end

  def create
    @quote = Quote.new(quote_params)
    @quote.user_id = current_user.id

    if @quote.save
      redirect_to quotes_path, notice: 'Quote was successfully created.'
    else
      render :new
    end

  end

  def update
    @quote = Quote.find(params[:id])
    if @quote.update(quote_params)
      redirect_to quotes_path, notice: 'Quote was successfully updated.'
    else
      render :edit
    end
  end


  def destroy
    @quote.destroy
    redirect_to quotes_url, notice: 'Quote was successfully destroyed.'
  end

private

  def set_quote
    @quote = Quote.find(params[:quote_id])
  end

  def quote_params
    params.require(:quote).permit(:quotation, :author, :user_id)
  end

end
