class EventsController < ApplicationController

	before_action :set_event, :only => [:show, :edit, :update, :destroy]

	def index
		@events = Event.page(params[:page]).per(10)

		respond_to do |format|
			format.html	#index.html.erb
			format.xml { render :xml => @events.to_xml }
			format.json { render :json => @events.to_json }
			format.atom { @feed_title = "My event list" } # index.atom.builder
		end
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_params)

		if @event.save

			flash[:notice] = "create success"

			redirect_to events_url
		else
			render 'new'
		end
	end

	def show
		#@page_title = @event.name
		@event = Event.find(params[:id])
		respond_to do |format|
			format.html { @page_title = @event.name } # show.html.erb
			format.xml # show.xml.builder
			format.json { render :json => { id: @event.id, name: @event.name }.to_json }
		end
	end

	def edit
		
	end

	def update
		if @event.update(event_params)

			flash[:notice] = "update success"

			redirect_to event_url(@event)
		else
			render 'edit'
		end

		
	end

	def destroy	
		@event.destroy
		
		flash[:alert] = "delete success"

		redirect_to events_url
	end

	private
	def set_event
		@event = Event.find(params[:id])
	end

	def event_params
		params.require(:event).permit(:name, :description)
	end
end