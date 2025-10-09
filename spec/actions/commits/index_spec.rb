# frozen_string_literal: true

RSpec.describe HanakaiContributors::Actions::Commits::Index do
  let(:params) { Hash[] }

  it "works" do
    response = subject.call(params)
    expect(response).to be_successful
  end
end
