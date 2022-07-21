require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let!(:posts) { create_list(:post, 10) }
  let!(:post_id) { posts.first.id }
  describe 'GET /posts' do
    before { get '/posts' }
    it 'returns posts' do
     expect(json).not_to be_empty
     expect(json.size).to eq(10)
    end
    it 'returns status code 200' do
     expect(response).to have_http_status(200)
    end
  end
end



# require 'rails_helper'

# RSpec.describe 'Posts', type: :request do
#   describe 'GET /posts' do
#     before do
#       FactoryBot.create_list(:post,1)
#       get '/posts'
#     end
    
#     it 'returns all posts' do
#       expect(json.size).to eq(2)
#     end

#     it 'returns status code 200' do
#       expect(response).to have_http_status(:success)
#     end
#   end
# end
