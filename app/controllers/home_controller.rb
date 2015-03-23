class HomeController < ApplicationController
  def index
    @title = t('travels.title')
    render :travels
  end

  def projects

  end

  def games
    @title = t('games.title')
  end

  def travels
    @title = t('travels.title')
  end
end
