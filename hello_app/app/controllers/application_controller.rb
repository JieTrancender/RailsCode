class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def hello
  	render html: "¡Hello, World!"
  end

  def goodbye
  	render html: "Goodbye!"
  end
end
