require "sinatra"
require "active_record"
require "pg"

ActiveRecord::Base.establish_connection(
  adapter: "postgresql",
  database: "photo_gallery"
  )

class Gallery < ActiveRecord::Base
end

class Image < ActiveRecord::Base
end

get "/" do
  @galleries = Gallery.all
  erb :index
end


get "/galleries/:id" do
  @gallery = Gallery.find(params[:id])
  @images = Image.where(gallery_id: @gallery.id)

  erb :show
end
