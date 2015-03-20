class HomeController < ApplicationController
  def index
    render :travels
  end

  def projects

  end

  def games

  end

  def travels
    @title = t('travels.title')
  end
end
