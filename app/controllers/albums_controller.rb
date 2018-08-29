class AlbumsController < ApplicationController
	def index
		@albums = current_user.albums.all
	end

	def show
		@album = current_user.albums.find(params[:id])
	end

	def new
		@album = current_user.albums.build
		@photo = @album.photos.build
		@photo.tags.build
	end

	def edit
		@album = current_user.albums.find(params[:id])
	end

	def create
		debugger
		@album = current_user.albums.build(albums_params)
		if @album.save
			redirect_to album_path(@album)
		else
			render 'new'
		end
	end

	def update
		@album = current_user.albums.find(params[:id])
		if @album.update(albums_params)
			redirect_to albums_path(@album)
		else
			render 'edit'
		end
	end

	def destroy
		@album = current_user.albums.find(params[:id])
		@album.destroy
		redirect_to albums_path
	end

	private
		def albums_params
			params.require(:album).permit(:name, :description, photos_attributes: [:name, :image, tags_attributes: [:name]])
			# params.require(:album).permit(:name, :description, photos_attributes: Photo.attribute_names.map(&:to_sym))
		end
end
