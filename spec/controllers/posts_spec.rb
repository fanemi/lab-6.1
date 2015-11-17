require 'rails_helper'

RSpec.describe PostsController, :type => :controller do

	context '#index' do
		it 'should renders index template and show all posts' do
			post1, post2 = Post.create!, Post.create!
			get :index
			expect(response).to render_template("index")
			expect(assigns(:posts)).to match_array([post1, post2])
		end
	end
	context '#new' do
		it 'should create new post and renders new template' do
			get :new
			expect(response).to render_template("new")
			expect(assigns(:post)).to be_a_new(Post)
		end
	end
	context '#create' do
		it 'should save valid new post and redirects to show' do
			expect{
				post :create, post = Post.new
			}.to change(Post, :count).by(1)
			expect(response).to redirect_to post_path(assigns[:post])
		end
	end
	context '#destroy' do
		it 'should destroy post and redirects to show' do
			post1 = Post.create!
			expect{
				delete :destroy, id: post1
			}.to change(Post, :count).by(-1)
			expect(response).to redirect_to posts_path
		end
	end
end