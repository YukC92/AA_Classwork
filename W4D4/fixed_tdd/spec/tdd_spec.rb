require "tdd"


describe "my_uniq" do
    let (:array) {[1,2,3,1,3,3]}

    it "should accept an array of numbers as an argument" do
        my_uniq([1,2,1,3,3])
    end

    it "should return an array containing only the unique elements" do
        expect(my_uniq([1,2,1,3,3])).to eq([1,2,3])
        expect(my_uniq([1,4,1,4,4])).to eq([1,4])
        expect(my_uniq([8,9,7,8,9])).to eq([8,9,7])
    end

    it "returns a new array" do 
        expect(my_uniq(array)).to_not be(array)
    end

    # it "should return a new array containing the elements that return true for exactly one of the procs" do
    #     expect(
    #         prizz_proc(
    #             [10, 9, 3, 45, 12, 15, 7],
    #             div_3,
    #             div_5
    #         )
    #     ).to match_array([10, 9, 3, 12])
    ## .to_not be()

end

describe Array do
    describe "#two_sum" do
        it "should return positions of pairs which sum to be zero" do
            expect([1,5,7,-5,3].two_sum).to eq([[1,3]])
        end

        it "returns [] when there are no pairs" do
            expect([1,2,3,4,5].two_sum).to eq([])
        end

        it "should find multiple pairs with the smaller first element" do
            expect([1,5,7,-5,-1].two_sum).to eq([[0,4], [1,3]])
            expect([1,5,7,-1,-1].two_sum).to eq([[0,3], [0,4]])
        end

    end
end

describe "my_transpose" do 
    it "should accept a matrix as an argument" do
        my_transpose([[1,2], [3, 4]])
    end

    it "should transpose the input array" do
        expect(my_transpose([[0,1,2],[3,4,5], [6,7,8]])).to eq([[0,3,6], [1,4,7], [2,5,8]])
    end

end

describe "stock_picker" do

    it "should accept an array of numbers as an argument" do
        stock_picker([1,2,1,3,3])
    end

    context "when days are profitable and one pair is the max" do
        it "should return the first pair with greatest difference" do
            expect(stock_picker([2,3,1,5,3,9])).to eq([2,5])
            expect(stock_picker([1,4,5,4,3])).to eq([0,2])
        end
    end

    context "when multiple pairs have the same difference" do
        it "should return the first pair" do
            expect(stock_picker([1,2,9,9])).to eq([0,2])
            expect(stock_picker([1,4,3,4,3])).to eq([0,1])
        end
    end

    it "should return nil if doesn't have any profit" do 
        expect(stock_picker([5,4,3,2,1])).to eq(nil)
    end
end

