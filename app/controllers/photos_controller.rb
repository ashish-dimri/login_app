class PhotosController < ApplicationController
	# def index
	# 	@photos = current_album.photos.all
	# end

	def create
		@album = current_user.albums.find(params[:album_id])
	    @photo = @album.photos.create(photo_params)
	    if @photo.save
	    	flash[:notice] = "Successfully added new photo!"
	    	redirect_to album_path(@album)
		else
			flash[:alert] = "Error adding new photo!"
			render 'albums/show'
		end
	    
	end

	def destroy
		@album = current_user.albums.find(params[:album_id])
	    @photo = @album.photos.find(params[:id])	
	    if @photo.destroy
	    	flash[:notice] = "Successfully added new photo!"
	    	redirect_to album_path(@album)
		else
			flash[:alert] = "Error deleting photo!"
			render 'albums/show'
		end
	end

	private
		def photo_params
			params.require(:photo).permit(:name, :image)
		end
end
