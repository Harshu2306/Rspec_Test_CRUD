# require 'rails_helper'

# RSpec.describe 'Posts', type: :request do
#   describe 'POST /delete' do
#     it 'checks that a post can be destroyed' do
#       @post.destroy
#       expect(Post.find_by(title: "Rspec Testing", content:"This is testing content")).to be_nil
#     end
#   end
# end



require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'DELETE /posts/:id' do
    let!(:post) {FactoryBot.create(:post, title: 'Testing-123', content:'Delete this record')}
    it 'deletes a post' do
      expect{
        delete "/posts/#{post.id}"
      }.to change {Post.count}.from(1).to(0)

      expect(response).to have_http_status(204)
    end
  end
end