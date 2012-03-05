require "spec_helper"

describe Book do
  describe "db colunms" do
    %W{ name author author_abstract 
      content_abstract ISBN }.each do |i|
       it { should have_db_column i }
      end
  end

  describe "db index"

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :author }
  end

  describe "attributes" do
    it { should belong_to :user }
    it { should have_many :commets }
  end
end
