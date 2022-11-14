class StatpagesController < ApplicationController

  def home

  end

  def about

  end

  def contacts

  end

  def animal_list
   @animals = ['dog', 'cat', 'cow', 'rabbit', 'haze', 'wolf', 'fox']
  end

end
