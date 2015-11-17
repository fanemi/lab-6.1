require 'rails_helper'

RSpec.describe Post, type: :model do

	before(:all) do
		@post = Post.new(title: 'My Title', content: 'My Content')
	end

	it 'should have a matching content' do
		expect(@post.content).to eq('My Content')
	end
	it "should have a matching title" do
		expect(@post.title).to eq('My Title')
	end

end