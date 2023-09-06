require 'rails_helper'

RSpec.describe Food, type: :model do
  let(:user1) { User.create(name: 'Marianela', email: 'abc@abc.com') }

  subject do
    Food.new(
      name: 'Apple Pie',
      measurement_unit: 'g',
      price: 3.5,
      quantity: 10,
      user_id: user1.id
    )
  end

  before { subject.save }

  it 'validates presence of name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'validates that measurement unit is a string' do
    expect(subject.measurement_unit).to be_a(String)
  end

  it 'validates quantity to be 10' do
    expect(subject.quantity).to eq(10)
  end

  it 'validates that food price is a float' do
    expect(subject.price).to be_a(Float)
  end
end
