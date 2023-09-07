require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:user1) { User.first }

  subject do
    Recipe.new(
      name: 'my recipe',
      preparation_time: 60,
      cooking_time: 40,
      public: false,
      description: 'text',
      user: user1
    )
  end

  before { subject.save }

  it 'Makes sure name is present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Makes sure to convert the preparation time to int type' do
    subject.preparation_time = '8'
    expect(subject.preparation_time).to be_a(Integer)
  end

  it 'Makes sure to convert the preparation time to int type' do
    subject.cooking_time = '60'
    expect(subject.cooking_time).to be_a(Integer)
  end
end
