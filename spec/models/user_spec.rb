require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create! name: 'fred', email: 'fred@test.com', password: 'fred123' }
  it 'test a user is invalid without a name' do
    expect(subject).to be_valid
    subject.name = ''
    expect(subject).to be_invalid
  end
end
