class HomeController < ApplicationController
  def index
    # @thing = File.read("public/samples/PLATES.EDL")
  end

  def show
    @device = "others"
    respond_to do |format|
      format.html.phone do
        # add code here for phones
      end

      format.html.tablet do
        # add code here for tablets
      end

      format.html.desktop do
        # add code here for desktops and other devices
      end
    end
  end

end
