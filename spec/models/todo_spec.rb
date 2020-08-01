require 'rails_helper'

RSpec.describe Todo, type: :model do

  it "is invalid empty" do
    expect(Todo.new).to_not be_valid
  end

  it "is valid with title" do
    expect(Todo.new(title: "test title")).to be_valid
  end

end
