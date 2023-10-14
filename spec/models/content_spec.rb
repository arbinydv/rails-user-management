require 'rails_helper'

RSpec.describe Content, type: :model do
  let(:user) { User.create(first_name: 'Dummy', last_name: 'User', email: 'dummy@example.com', country: 'NP', password: 'password') }

  it "is valid with valid attributes" do
    content = Content.new(title: 'Sample Title', body: 'Sample Body', user: user)
    expect(content).to be_valid
  end

  it "is not valid without a title" do
    content = Content.new(title: nil, body: 'Sample Body', user: user)
    expect(content).not_to be_valid
  end

  it "is not valid with an empty body" do
    content = Content.new(title: 'Sample Title', body: '', user: user)
    expect(content).not_to be_valid
  end
end
