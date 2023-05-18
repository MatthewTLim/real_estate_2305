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
    {"price" => price, "address" => address}
  end

  def price_per_square_foot
    (price.to_f / self.area).round(2)
  end

  def rooms_sorted_by_area
    sorted_rooms = @rooms.sort { |a, b| b.area <=> a.area}
    sorted_rooms
  end

  def rooms_by_category
    categorized_rooms = Hash.new { |categorized_rooms, key| categorized_rooms[key] = [] }
    @rooms.each do |room|
      categorized_rooms[room.category] << room
    end
    categorized_rooms
  end
end