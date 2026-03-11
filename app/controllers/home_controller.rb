class HomeController < ApplicationController
  def index
    # Render default layout (application) so header/footer are consistent site-wide
    # HomeController#index view will use the shared application layout
    render
  end

  def about
    # simple static about page (vision & mission)
  end
end
