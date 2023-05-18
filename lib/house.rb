class House
  attr_reader :address, :rooms

  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def price
    @price.slice!(0)
    @price.to_i
  end

  def above_market_average?
    if self.price > 500000
      true
    else
      false
    end
  end

  def rooms_from_category(category)
    searched_rooms = []
    @rooms.each do |room|
      if room.category == category
        searched_rooms << room
      end
    end
    searched_rooms
  end

  def area
    total_area = []
    @rooms.each do |room|
      total_area << room.area
    end
    total_area.sum
  end

  def details
    { "price" => price, "address" => address }
  end
end