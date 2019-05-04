require_relative "room"

class Hotel
  attr_reader :rooms

  def initialize(name, rooms)
    @name = name
    @rooms = {}
    rooms.each do |k,v|
      @rooms[k] = Room.new(v)
    end
  end

  def name
    @name.split(' ').map(&:capitalize).join(' ')
  end

  def room_exists?(room)
    if @rooms.has_key?(room)
      return true
    else
      return false
    end
  end

  def check_in(person, room_name)
    if self.room_exists?(room_name)
      if @rooms[room_name].full?
        p 'sorry, room is full'
      else
        @rooms[room_name].add_occupant(person)
        p 'check in successful'
      end
    else
      p 'sorry, room does not exist'
    end
  end

  def has_vacancy?
    all_full = @rooms.all? do |k,v|
      v.full?
    end

    if all_full
      return false
    else
      return true
    end
  end

  def list_rooms
    @rooms.each do |k,v|
      print "#{k} #{v.available_space}\n"
    end
  end
end
