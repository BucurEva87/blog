require_relative '../rails_helper'

RSpec.describe Like, type: :model do
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

  let(:like) do
    Like.new(
      author: user,
      post:
    )
  end

  it 'is only valid with a user' do
    like.author = nil
    expect(like).to_not be_valid
  end

  it 'is valid with a post' do
    like.post = nil
    expect(like).to_not be_valid
  end

  it 'updates likes counter after save' do
    like.save
    expect(post.likes_counter).to eq(17)
  end
end
