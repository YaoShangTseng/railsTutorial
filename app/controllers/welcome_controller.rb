class WelcomeController < ApplicationController

	def index

	end

	#GET /welcome/say_hello
	def say

		# say.html.erb
	end

  def something
    render :text => "<h3>AWESOME!!! #{Time.now}</h3>"
  end

end
