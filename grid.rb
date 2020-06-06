class Grid
    def initialize(input)
        @grid = create_grid(input)
    end

    # attr_reader :grid

    def create_grid(input)
        if input.class == 'String'
            grid = input.chars.each_slice(9).to_a
        else 
            grid = input.each_slice(9).to_a
        end
        grid.map! {|r| r.map! {|c| c.to_i}}
        
        return grid
    end

    def to_s
        @grid.each do |r|
            p r
        end
    end

    def possible(y,x,n)
        # first check the row
        (0...9).each do |i|
            if @grid[y][i] == n
                return false
            end
        end
        # then check the column
        (0...9).each do |i|
            if @grid[i][x] == n
                return false
            end
        end
        # now check the square
        x0 = (x/3) * 3
        y0 = (y/3) * 3
        (0...3).each do |i|
            (0...3).each do |j|
                if @grid[y0+i][x0+j] == n
                    return false
                end
            end
        end
        return true
    end

    def solve
        #Loop through each row
        (0...9).each do |y|
            #Loop through each column
            (0...9).each do |x|
                #continue if the square is blank
                if @grid[y][x] == 0
                    #Try each number 0 to 9
                    (1..9).each do |n|
                        #check if the number would work in that box
                        if self.possible(y,x,n)
                            #Assign the tried number
                            @grid[y][x] = n
                            #call the solver again
                            self.solve
                            #
                            @grid[y][x] = 0

                        end
                    end
                    return
                end
            end
        end
        self.to_s
        puts "Find more solutions?"
        gets.chomp
    end
end