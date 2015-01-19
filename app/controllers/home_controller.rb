class HomeController < ApplicationController
  def index
    render :index, :locals => {
      :name => 'Phillip Boksz',
      :gravatar_url => "http://www.gravatar.com/avatar/#{Digest::MD5::hexdigest('pboksz@gmail.com')}?s=200",
      :github_url => 'http://www.github.com/pboksz',
      :linkedin_url => 'http://www.linkedin.com/in/pboksz',
      :email => 'pboksz@gmail.com',
      :lunar_logic_url => 'http://www.lunarlogic.io'
    }
  end
end
