require "spec_helper"

describe Commet do
  describe "db columns" do
    it { should have_db_column :commet }
  end

  describe "db index"

  describe "validations" do
    it { should validate_presence_of :commet }
  end

  describe "attributes" do
    it { should belong_to :user }
    it { should belong_to :book }
  end
end
