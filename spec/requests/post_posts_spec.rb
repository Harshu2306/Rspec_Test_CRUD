require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'POST /create' do
    before(:all) do
    @post = Post.create(title: "Rspec Testing-2", content: "This is testing content-2")
    end

    it 'checks that a Post can be created or not' do
    expect(@post).to be_valid
    end
  end
end 






# require 'rails_helper'

# describe 'POST /posts' do
#   # 'scenario' is similar to 'it', use which you see fit
  
#   scenario 'valid posts attributes' do
#     # send a POST request to /bookmarks, with these parameters
#     # The controller will treat them as JSON 
#     post '/posts', params: {
#       posts: {
#         content: 'https://rubyyagi.com',
#         title: 'RubyYagi blog'
#       }
#     }

#     # response should have HTTP Status 201 Created
#     expect(response.status).to eq(201)

#     json = JSON.parse(response.body).deep_symbolize_keys
    
#     # check the value of the returned response hash
#     expect(json[:content]).to eq('https://rubyyagi.com')
#     expect(json[:title]).to eq('RubyYagi blog')

#     # 1 new bookmark record is created
#     expect(Post.count).to eq(1)

#     # Optionally, you can check the latest record data
#     expect(Post.last.title).to eq('RubyYagi blog')
#   end

#   scenario 'invalid post attributes' do
#     post '/posts', params: {
#       posts: {
#         content: 'https://rubyyagi.com',
#         title: 'RubyYagi blog'
#       }
#     }

#     # response should have HTTP Status 201 Created
#     expect(response.status).to eq(422)

#     json = JSON.parse(response.body).deep_symbolize_keys
#     expect(json[:content]).to eq(["can't be blank"])

#     # no new bookmark record is created
#     expect(Post.count).to eq(0)
#   end
# end
