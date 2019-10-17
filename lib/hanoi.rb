class Hanoi
    attr_reader :discs, :piles
    def initialize(discs)
        @discs = discs
        @piles = Array.new(3){[]}
        setup_pile
    end

    def move(pile1, pile2)
        raise if piles[pile1].empty?
        piles[pile2].push(piles[pile1].pop)
    end

    private

    def setup_pile
        discs.downto(1).each do |disc|
            @piles[0] << disc
        end
    end
end