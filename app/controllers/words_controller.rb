class WordsController < ApplicationController

  before_action :put_word, only: [:show, :edit, :update, :destroy]

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

  end


  def edit

  end

  def update
    
    if @word.update_attributes(word_params)
      flash[:success] = "Word update"
      redirect_to words_path
    else
      render "edit"
    end
  end

  def destroy

    @word.destroy
    redirect_to words_path
  end

  private
  def word_params
    params.require(:word).permit(:eng_word, :ua_word)
  end

  def put_word
    @word = Word.find(params[:id])
  end


end
