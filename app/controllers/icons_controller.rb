class IconsController < ApplicationController
  def index
  end

  def show
    icon = IconMaker.new(params[:key], params[:size], params[:color]).generate

    respond_to do |format|
      format.svg { render inline: icon }
    end
  end

  def paths
    @paths = []
    Dir.glob(Rails.root.join("app/icons/*.rb")) do |path_file|
      icon_name = get_icon_name(path_file)
      @paths << { icon: icon_name, path: File.read(path_file).to_s }
    end

    render json: @paths.to_json, status: :ok
  end

  private

    def get_icon_name(path_file)
      s = path_file.split("/").last
      s.gsub(".rb", "")

    end

end
