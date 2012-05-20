require File.dirname(__FILE__) + '/../lib/r_validator'

describe RValidator::StringValidator do
  
  describe ".valid_length?" do

    context "when the min and the max are default value" do
      it "should return true for the 2 length string" do
        RValidator::StringValidator.should be_valid_length("ss")
      end

      it "should return true for the 1 length" do
        RValidator::StringValidator.should be_valid_length("s")
      end

      it "should return true for the 65535 length" do
        RValidator::StringValidator.should be_valid_length("s"*65535)
      end

      it "should return false for the empty string" do
        RValidator::StringValidator.should_not be_valid_length("")
      end

      it "should return false for the string whose length more than 65535" do
        RValidator::StringValidator.should_not be_valid_length("s"*65536)
      end
    end

    context "when the min and the max value are 5 and 8" do
      it "should return true for the 7 length string" do
        RValidator::StringValidator.should be_valid_length("s"*7, 5, 8)
      end

      it "should return true for the 5 length string" do
        RValidator::StringValidator.should be_valid_length("s"*5, 5, 8)
      end

      it "should return true for the 8 length string" do
        RValidator::StringValidator.should be_valid_length("s"*8, 5, 8)
      end

      it "should return false for the 9 length string" do
        RValidator::StringValidator.should_not be_valid_length("s"*9, 5, 8)
      end


      it "should return false for the 4 length string" do
        RValidator::StringValidator.should_not be_valid_length("s"*4, 5, 8)
      end
    end
    
  end

  describe ".contain_invalid_chars?" do
    context "when the value is '' " do
      it "should return false" do
        RValidator::StringValidator.should_not be_contain_invalid_chars("", "acsdc")
      end
    end

    context "when the value is 'acsn' " do
      it "should return false if no a,c,s,n are nots valid chars" do
        RValidator::StringValidator.should_not be_contain_invalid_chars("acsn", "vqe")
      end
      
      it "should return ture if any a,c,s,n are invalid chars" do
        RValidator::StringValidator.should be_contain_invalid_chars("acsn", "qers")
      end
    end
  end
end
