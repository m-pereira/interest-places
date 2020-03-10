class PlacePicker
  def initialize(search_params)
    @x = search_params[:x].to_i
    @y = search_params[:y].to_i
    @mts = search_params[:mts].to_i
    @hr = search_params[:hr]
  end

  def self.call(*args)
    new(*args).call
  end

  def call
    places = InterestPlace.where('x >= ? AND x <= ?', coord_min(x), coord_max(x))
      .where('y >= ? AND y <= ?', coord_min(y), coord_max(y))

    places.map do |place|
      { name: place.name, status: place_opened_or_closed(place) }
    end
  end

  private

  attr_reader :x, :y, :mts, :hr

  def place_opened_or_closed(place)
    return 'opened' if place.opened == 'always'
    return 'opened' if hr >= place.opened && hr <= place.closed

    'closed'
  end

  def coord_min(coord)
    coord - mts
  end

  def coord_max(coord)
    coord + mts
  end
end
