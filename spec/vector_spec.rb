require_relative '../vector'

describe Vector do
  describe "new" do
    it "creates a blank vector" do
      vector = Vector.new
      vector.should be_empty
    end
    it "Creates a size one vector" do
      vector = Vector.new(1)
      vector.size.should eq 1
    end
    it "creates a vector" do
      vector = Vector.new(1,2,3,4,5,6,7,8,9,10)
      vector.size.should eq 10
      vector[1].should eq 2
    end
    it "should" do
    end
  end
  describe "" do
    
end