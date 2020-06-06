class String
    def digits
        self.chars.map {|i| i.to_i}
    end
end

def get_an_input
    result = Array.new
    puts "Enter each row, separating each box by a space."
    puts "Example: 1 5 2 0 9 0 0 4 0"
    puts "Begin now-"
    until result.count == 81
        input = get_row
        input.split(" ").each do |i|
            result << i.to_i
        end 
    end
    return result
end

def get_row
    finished = false
    failed = false
    until finished
        input = gets.chomp
        # puts "checking input"
        if input.split(" ").count != 9
            puts "Wrong number of boxes"
            puts "Try same row-"
            redo
        end
        input.split(" ").each do |i|
            if i.to_i > 9 || i.to_i < 0
                puts "One of those is too high"
                puts "Try same row-"
                failed = true
                break
            end
        end
        redo if failed
        return input
    end
end