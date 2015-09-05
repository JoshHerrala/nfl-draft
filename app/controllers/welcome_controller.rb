class WelcomeController < ApplicationController
 
  
  
  def index
  end
  
  def contact
  end

  def lastthree
    @ownerships = Ownership.all 
  end
end
