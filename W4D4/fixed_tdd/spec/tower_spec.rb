require "tower"

describe Tower do

    let (:tower) {Tower.new}

    describe "#intialize" do
        it "should set tower to an array" do
            expect(tower.instance_variable_get(:@tower)).to eq([[3, 2, 1], [], []])
        end
    end

    describe "#[]" do
        it "should have an index as an argument" do
            expect { tower[1] }.to_not raise_error
        end

        it "should return the subarr at the given index" do 
            expect(tower.[](1)).to eq(tower[1])
        end
    end


#     it "should return the element at the given index in @passengers" do
#       flight.instance_variable_set(:@passengers, [passenger_1, passenger_3])
#       expect(flight[0]).to be(passenger_1)
#       expect(flight[1]).to be(passenger_3)
#     end
#   end
    
    # describe "#won?" do
    #     it "should return false if the player starts the game" do
    #         expect(tower.won?).to eq(false) 
    #     end

    #     it "should return true if all the disks moved to Tower 1" do
            
    #         expect(tower.won?).to eq(true) 
    #     end
    # end

    # describe "#render" do 
    #     it "should print out the tower in Sting." do
    #         expect(tower.render).to eq("Tower 0: 3 2 1 \nTower 1:  \nTower 2: \n"
    #         )
    #     end
    # end

end