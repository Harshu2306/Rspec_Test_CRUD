# require 'rails_helper'
# RSpec.describe 'Posts', type: :request do
#   describe 'PUT /posts/:id' do
#    let(:valid_attributes) { { title: 'Saffron Swords' } }
#    before { upadate "/posts/#{post}", params: valid_attributes}
#    context 'when post exists' do
#      it 'returns status code 204' do
#        expect(response).to have_http_status(204)
#      end
#      it 'updates the post' do
#        updated_item = Post.find(post.id)
#        expect(updated_item.title).to match(/Saffron Swords/)
#      end
#    end
#    context 'when the post does not exist' do
#      let(:post_id) { 0 }
#      it 'returns status code 404' do
#        expect(response).to have_http_status(404)
#      end
#      it 'returns a not found message' do
#        expect(response.body).to include("Couldn't find Post with 'id'=0")
#      end
#    end
#   end
#  end





# require 'rails_helper'
# RSpec.describe 'Posts', type: :request do
#   describe 'PUT /posts/:id' do
#     it 'checks that a post can be updated' do
#       @post = Post.create(title: "Rspec Testing-2", content: "This is testing conten-2")
#       h = @post.update(title: "Rspec_Testing123")
#       expect(h).to eq(@post)
#     end
#   end
# end
















# require 'rails_helper'

# describe 'PUT /posts' do
#   # this will create a 'post' method, which return the created post object, 
#   # before each scenario is ran
#   let!(:post) { Post.create(content: 'https://rubyyagi.com', title: 'Ruby Yagi') }

#   scenario 'valid post attributes' do
#     # send put request to /posts/:id
#     put "/posts/#{post.id}", params: {
#       post: {
#         content: 'https://fluffy.es',
#         title: 'Fluffy'
#       }
#     }

#     # response should have HTTP Status 200 OK
#     expect(response.status).to eq(200)

#     # response should contain JSON of the updated object
#     # json = JSON.parse(response.body).deep_symbolize_keys
#     expect(json[:content]).to eq('https://fluffy.es')
#     expect(json[:title]).to eq('Fluffy')

#     # The post title and content should be updated
#     expect(post.reload.title).to eq('Fluffy')
#     expect(post.reload.content).to eq('https://fluffy.es')
#   end

#   scenario 'invalid post attributes' do
#     # send put request to /post/:id
#     put "/posts/#{post.id}", params: {
#       post: {
#         content: '',
#         title: 'Fluffy'
#       }
#     }

#     # response should have HTTP Status 422 Unprocessable entity
#     expect(response.status).to eq(422)

#     # response should contain error message
#     #json = JSON.parse(response.body).deep_symbolize_keys
#     expect(json[:content]).to eq(["can't be blank"])

#     # The post title and content remain unchanged
#     expect(post.reload.title).to eq('Ruby Yagi')
#     expect(post.reload.content).to eq('https://rubyyagi.com')
#   end
# end



















require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'PUT /posts/:id' do
    let!(:post) {FactoryBot.create(:post, title: 'Testing-123', content:'Update this record')}
    it 'updates a post' do
    post.update(title:"Updated_Title")
    updated_item = Post.find(post.id)
    expect(updated_item.title).to match(/Updated_Title/)
    end
  end
end