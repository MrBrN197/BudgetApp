require 'rails_helper'

RSpec.describe Record, type: :model do
  subject do
    user = User.create! name: 'fred', email: 'fred@test.com', password: 'fred123'
    Record.create! name: 'La Ferrari', ammount: 1_300_000, user: user
  end

  it 'test a record is invalid without a name' do
    expect(subject).to be_valid
    subject.name = ''
    expect(subject).to be_invalid
  end

  it 'test a record is invalid without a user' do
    expect(subject).to be_valid
    subject.user = nil
    expect(subject).to be_invalid
  end

  it 'test a record has a valid ammount' do
    expect(subject).to be_valid
    subject.ammount = nil
    expect(subject).to be_invalid
    subject.ammount = -20
    expect(subject).to be_invalid
  end
end
