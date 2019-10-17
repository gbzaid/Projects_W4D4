require "rspec"
require "ourarray"

describe "#my_uniq" do

    it "works" do
        expect(my_uniq([1,2,2,3])).to eq([1,2,2,3].uniq)
    end

end

describe Array do
    describe "#two_sum" do
        it "should return pairs of indices in order" do
            expect([-1,1,4,5,-5].two_sum).to eq([[0,1], [3,4]])
        end
    
        it "returns an array of valid indices" do
            arr = [3,2,1,-2,-3]
            result = arr.two_sum
            result.each do |pair|
                pair.each do |num|
                    expect(num).to be_between(0, arr.length-1)
                end
            end
        end

        it "should return an empty array when there are no summing pairs" do
            expect([1,2,3,4,5,6,7,8].two_sum).to be_empty
        end
    end
end

describe "my_transpose" do
    let(:matrix) { [[1,2,3],[3,2,1], [1,2,3]] }
    it "should accept an array" do
        expect { my_transpose(matrix) }.not_to raise_error
    end

    it "should return an array" do
        expect(my_transpose(matrix)).to be_a(Array)
    end

    it "should return the matrix transpose" do
        expect(my_transpose(matrix)).to eq(matrix.transpose)
    end

    it "should not modify the original array" do 
        expect(my_transpose(matrix)).not_to be(matrix)
    end
end

describe "pick_stocks" do

    let(:stocks) { [23, 45, 21, 5, 96, 12, 66, 95]}

    it "should accept an array" do 
        expect { pick_stocks(stocks) }.not_to raise_error
    end

    it "should return a pair of elements" do
        expect( pick_stocks(stocks).length).to eq(2)
    end

    it "should return the best days to buy/sell" do
        expect(pick_stocks(stocks)).to eq([3,4])
    end

    it "should return an empty array if no profit is possible" do
        falling_stocks = stocks.sort.reverse
        expect(pick_stocks(falling_stocks)).to be_empty
    end    
end