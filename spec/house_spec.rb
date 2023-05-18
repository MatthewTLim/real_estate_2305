require './lib/room'
require './lib/house'

RSpec.describe "House" do
  describe "#exists" do
    it "exists" do
      house = House.new("$400000", "123 sugar lane")
      expect(house).to be_a(House)
    end

    it "has readable attributes" do
      house = House.new("$400000", "123 sugar lane")

      expect(house.price).to eq(400000)
      expect(house.address).to eq("123 sugar lane")
      expect(house.rooms).to eq([])
    end
  end

  describe "#add_room" do
    it " can add rooms to a house" do
      house = House.new("$400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:bedroom, 11, '15')

      house.add_room(room_1)
      house.add_room(room_2)

      expect(house.rooms).to eq([room_1, room_2])
    end
  end

  describe "#above_market_average?" do
    it "can tell if the house is above the market average" do
      house = House.new("$400000", "123 sugar lane")

      expect(house.above_market_average?).to eq(false)
    end
  end

  describe "#rooms_from_category" do
    it "can sort rooms by category" do
      house = House.new("$400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:bedroom, 11, '15')
      room_3 = Room.new(:living_room, 25, '15')
      room_4 = Room.new(:basement, 30, '41')

      house.add_room(room_1)
      house.add_room(room_2)
      house.add_room(room_3)
      house.add_room(room_4)

      expect(house.rooms_from_category(:bedroom)).to eq([room_1, room_2])
      expect(house.rooms_from_category(:basement)).to eq([room_4])
    end
  end

  describe "#area" do
    it "can calculate its area by adding together the areas of its rooms." do
      house = House.new("$400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:bedroom, 11, '15')
      room_3 = Room.new(:living_room, 25, '15')
      room_4 = Room.new(:basement, 30, '41')

      house.add_room(room_1)
      house.add_room(room_2)
      house.add_room(room_3)
      house.add_room(room_4)

      expect(house.area).to eq(1900)
    end

  end

  describe "#details" do
    it "can return a Hash of its attributes (price and address)." do
      house = House.new("$400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:bedroom, 11, '15')
      room_3 = Room.new(:living_room, 25, '15')
      room_4 = Room.new(:basement, 30, '41')

      house.add_room(room_1)
      house.add_room(room_2)
      house.add_room(room_3)
      house.add_room(room_4)

      expect(house.details).to eq({"price" => 400000, "address" => "123 sugar lane"})
    end
  end
end