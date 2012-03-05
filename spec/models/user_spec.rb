require "spec_helper"

describe User do
  it { should have_many :books }
  it { should have_many :commets }
end
