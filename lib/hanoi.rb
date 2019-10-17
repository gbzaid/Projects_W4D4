class Hanoi
    attr_reader :discs, :piles
    def initialize(discs)
        @discs = discs
        @piles = Array.new(3){[]}
        setup_pile
    end

    def move(idx1, idx2)
        pile1 = self.piles[idx1]
        pile2 = self.piles[idx2]
        raise if pile1.empty?
        raise if !pile2.empty? && (pile1[-1] > pile2[-1])
        pile2.push(pile1.pop)
    end

    def won?
       piles[1].length == discs || piles[2].length == discs 
    end

    def play
        until won?
            p piles
            puts "Enter from/to piles (ex: 0,2)"
            begin
                input = gets.chomp
                pile1, pile2 = input.split(",").map(&:to_i)
                move(pile1, pile2)
            rescue
                puts "Invalid move, try again, press q to quit"
            end
        end
        puts "You've WON!"
    end

    private

    def setup_pile
        discs.downto(1).each do |disc|
            @piles[0] << disc
        end
    end
    
end