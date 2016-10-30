class IconMaker
  def initialize(key, size, color)
    @key = key
    @size = size || 16
    @color = color || "currentColor"
  end

  def generate
    "<?xml version='1.0'?>
    <!DOCTYPE svg PUBLIC '-//W3C//DTD SVG 1.1//EN' 'http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd'>
    <svg xmlns='http://www.w3.org/2000/svg' width='#{@size}' height='#{@size}' fill='#{color_code}'
      data-id='geomicon-user' viewBox='0 0 32 32'>
      <path d='#{path}' />
    </svg>"
  end

  private

    def color_code
      @color[0] == "#" ? @color : "##{@color}"
    end

    def path
      if File.exists?(Rails.root.join("app/icons/#{@key}.svg"))
        File.read(Rails.root.join("app/icons/#{@key}.svg"))
      else
        ""
      end
    end

end
