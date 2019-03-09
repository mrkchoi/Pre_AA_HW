require_relative "room"

class Hotel
    def initialize(name, hash_rooms)
        @name = name
        @rooms = {}
        hash_rooms.each {|k, v| @rooms[k] = Room.new(v)}
    end

    def name
        @name.split.map(&:capitalize).join(' ')
    end

    def rooms
        @rooms
    end

    def room_exists?(room_name)
        @rooms.has_key?(room_name)
    end

    def check_in(person, room_name)
        if self.room_exists?(room_name)
            if @rooms[room_name].add_occupant(person)
                p 'check in successful'
            else
                p 'sorry, room is full'
            end
        else
            p 'sorry, room does not exist'
        end
    end

    def has_vacancy?
        @rooms.any? {|k,v| !v.full?}
    end

    def list_rooms
        @rooms.each {|k, v| puts "#{k} : #{@rooms[k].available_space}"}
    end
end

