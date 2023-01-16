class WordsController < ApplicationController

   def index
     @word = Word.all
   end

   def new
     @word = Word.new
   end

  def create
    @word = Word.new(word_params)
    if @word.save
    flash[:success] = "You add a new word!"
    redirect_to words_path
    else
    render 'new'
    end
  end

  def show
   @word = Word.find(params[:id])
  end

  def destroy
    @word = Word.find(paramas[:id])
  end

  private
  def word_params
    params.require(:word).permit(:eng_word, :ua_word)
  end

end
