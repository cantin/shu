require 'spec_helper'

describe HomesController do
  describe 'GET index' do
    before(:each) do
      user = FactoryGirl.create :user
      book = FactoryGirl.build :book, user: user
      sign_in user

      #Book.should_receive(:all).and_return([book])
      Book.should_receive(:most_commented_books).and_return([book])

      get :index
    end

    it { should respond_with :ok }
    it { should respond_with_content_type /html/ }
  end
end
