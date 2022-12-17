require_relative '../rails_helper'

RSpec.describe Post, type: :model do
  let(:user) do
    User.new(
      name: 'Eva',
      photo: 'https://postimg.cc/VrLnSv8t',
      bio: 'I am in love with chess and programming',
      posts_counter: 6
    )
  end

  let(:post) do
    Post.new(
      author: user,
      title: 'This is my first post',
      text: 'Here is my first article. I hope it will be well received by critiques.',
      comments_counter: 2,
      likes_counter: 16
    )
  end

  it 'is not valid without a title' do
    post.title = nil
    expect(post).to_not be_valid
  end

  it 'is not valid without a text' do
    post.text = nil
    expect(post).to_not be_valid
  end

  it 'is only valid with a user' do
    post.author = nil
    expect(post).to_not be_valid
  end

  it 'is not valid if comment counter is less than 0' do
    post.comments_counter = -12
    expect(post).to_not be_valid
  end

  it 'is valid if likes counter is 8' do
    post.likes_counter = 8
    expect(post).to be_valid
  end

  it 'updates posts counter after save' do
    post.save
    expect(user.posts_counter).to eq(7)
  end
end
