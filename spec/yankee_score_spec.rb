require 'spec_helper'

describe YankeeScore do
  it 'has a version number' do
    expect(YankeeScore::VERSION).not_to be nil
  end

  context 'YankeeScore::CLI' do
    it 'is defined' do
      expect(YankeeScore::CLI).to be_a(Class)
    end
  end
end
