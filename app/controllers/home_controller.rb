class HomeController < ApplicationController
  def index
		@store = Store.new
  end
end
