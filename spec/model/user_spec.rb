require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Ezra', email: 'ezra@example.com') }
  before { subject.save }

  it 'Name should be set' do
    expect(subject.name).to eq('Ezra')
  end

  it 'Email should be set' do
    expect(subject.email).to eq('ezra@example.com')
  end
end
