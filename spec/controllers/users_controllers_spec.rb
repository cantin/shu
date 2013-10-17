require 'spec_helper'

describe UsersController do
  describe "GET show" do
    before do
      @u = FactoryGirl.create :user
      @u.confirm!

      @book = FactoryGirl.create :book, user: @u

      User.should_receive(:find).and_return(@u)
      #@u.should_receive(:follows_by_type).with("Book").and_return([@book])
      #@u.should_receive(:books).and_return([@book])

      get :show, id: @u.id
    end

    it { should respond_with :ok }
  end
end
