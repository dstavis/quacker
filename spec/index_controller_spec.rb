require 'spec_helper'

describe "IndexController (this is a skeleton controller test!)" do

  describe 'get all bands' do
    it 'should see all bands' do
      get "/bands"
      expect(last_response).to be_ok
    end
  end

  describe 'create a new band' do
    band_name = 'chromatics'
    new_params = {
        name: band_name
      }
    new_session = {
      'rack.session' => {
        # Could preload stuff into the session here...
      }
    }
    it 'should add a new band' do
      expect{
        post('/bands', new_params, new_session)
      }.to change(Band, :count).by(1)
      last_response.should be_redirect
    end
  end
end

describe User do
  it { should have_many(:followers).through(:flockings) }
  it { should have_many(:followees).through(:flockings) }
  # it { should have_many(:followers) }
  # it { should have_many(:followees) }
  # it { should have_many(:followers).through(:flockings).source(:follower) }
  # it { should have_many(:followees).through(:flockings).source(:followee) }

  # it { should have_many(:followees).class_name('User') }
  # it { should have_many(:followers).with_foreign_key('follower_id') }

end


