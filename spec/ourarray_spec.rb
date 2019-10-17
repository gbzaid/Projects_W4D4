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