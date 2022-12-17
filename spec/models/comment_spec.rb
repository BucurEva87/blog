require_relative '../rails_helper'

RSpec.describe Comment, type: :model do
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

  let(:comment) do
    Comment.new(
      author: user,
      post:,
      text: 'I hope everything is ok there. Nice post, anyway!'
    )
  end

  it 'is valid with a text' do
    comment.text = 'I hope everything is ok there. Nice post, anyway!'
    expect(comment).to be_valid
  end

  it 'is only valid with a user' do
    comment.author = nil
    expect(comment).to_not be_valid
  end

  it 'is valid with a post' do
    comment.post = nil
    expect(comment).to_not be_valid
  end

  it 'updates comments counter after save' do
    comment.save
    expect(post.comments_counter).to eq(3)
  end
end
