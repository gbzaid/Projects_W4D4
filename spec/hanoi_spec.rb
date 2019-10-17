require "rspec"
require "hanoi"

describe Hanoi do
    subject(:game) {Hanoi.new(5)}
    describe "#initialize" do
        
        it "should accept a number of discs to start the game with" do
            expect { game }.not_to raise_error
        end

        it "should store the number of discs passed into it" do
            expect(game.discs).to eq(5)
        end

        it "should have an array representing the piles of discs" do
            expect(game.piles).to be_a(Array)
        end

        it "should set up the first pile with the discs" do
            expect(game.piles[0]).to eq([5,4,3,2,1])
        end
    end

    describe "#move" do
        it "should accept two args for piles" do
            expect { game.move(0,1) }.not_to raise_error
        end

        it "should move a disc from the top of one given pile to the top of the other" do
            game.move(0,1)
            expect(game.piles).to eq([[5,4,3,2], [1], []])
        end

        it "should raise an error if you try to place a bigger disc on a smaller one" do 
            game.move(0,1)
            expect { game.move(0,1)}.to raise_error(StandardError)
        end

        it "should raise an error if you try to remove a disc from an empty pile" do
            expect { game.move(1,2) }.to raise_error(StandardError)
        end
    end

    describe "#won?" do 
        context "when either pile2 or pile3 is fully stacked" do
            it "should return true" do
                game.piles[1] = game.piles[0]
                game.piles[0] = []
                expect(game.won?).to be true
            end
        end 
        context "when neither pile2 or pile3 is fully stacked" do
            it "should return false" do
                expect(game.won?).to be false
            end
        end
        
    end
end
