class LandmarksController < ApplicationController

 	get '/landmarks' do
 		@landmarks = Landmark.all
		erb :'/landmarks/index'
	end

	get '/landmarks/new' do
		erb :'/landmarks/new'
	end

	get '/landmarks/:id/edit' do
		@landmark = Landmark.find(params["id"])
		erb :'/landmarks/edit'
	end

	get '/landmarks/:id' do
		@landmark = Landmark.find(params["id"])
		erb :'/landmarks/show'
	end	

	post '/landmarks' do
		@landmark = Landmark.create(name: params["landmark"]["name"], year_completed: params["landmark"]["year_completed"])
		redirect "/landmarks/#{@landmark.id}"
	end

	post '/landmarks/:id' do
		@landmark = Landmark.find(params["id"])
		@landmark.update(name: params["landmark"]["name"], year_completed: params["landmark"]["year_completed"])
		
		redirect "/landmarks/#{@landmark.id}"
	end

end
