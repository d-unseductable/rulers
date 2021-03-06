require 'spec_helper'

describe Rulers::Application do
  subject { last_response }

  describe 'GET /test/index' do
    before { get '/test/index' }

    it { should be_ok }
    its(:body) { should include('Index text') }
  end

  describe 'GET /test/exception' do
    before { get '/test/exception' }

    its(:status) { should eq(500) }
  end

  describe 'GET /' do
    before do
      File.stub(:read).with('public/index.html')
        .and_return('public/index.html contents')
      get '/'
    end

    it { should be_ok }
    its(:body) { should include('public/index.html contents') }
  end

  describe 'GET /favicon.ico' do
    before { get '/favicon.ico' }

    it { should be_not_found }
  end
end
