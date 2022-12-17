require_relative '../rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(
      name: 'Eva',
      photo: 'https://postimg.cc/VrLnSv8t',
      bio: 'I am in love with chess and programming',
      posts_counter: 6
    )
  end

  before { subject.save }

  it 'is valid with valid attributes' do
    subject.name = 'Eva'
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a name below three characters' do
    subject.name = 'Lu'
    expect(subject).to_not be_valid
  end

  it 'returns photo if valid' do
    subject.photo = 'https://postimg.cc/VrLnSv8t'
    expect(subject).to be_valid
  end

  it 'is valid with a bio' do
    subject.bio = 'I am in love with chess and programming'
    expect(subject).to be_valid
  end

  it 'returns posts_counter as an integer' do
    subject.posts_counter = 6
    expect(subject).to be_valid
  end

  it 'is not valid if posts_counter is a string' do
    subject.posts_counter = 'six'
    expect(subject).to_not be_valid
  end

  it 'is not valid if posts_counter is nil' do
    subject.posts_counter = nil
    expect(subject).to_not be_valid
  end
end
