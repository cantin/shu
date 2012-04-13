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
    it { should have_many :comments }
  end

  describe '.most_commented_books' do
    before do
      10.times.each do |i|
        b = FactoryGirl.create :book
        i.times.each do
          FactoryGirl.create :comment, commentable: b
        end
      end
    end

    let(:mb) { Book.most_commented_books 5 }

    it { mb.length.should == 5 }
    it { mb.first.comments.length.should == 9 }
  end
end
