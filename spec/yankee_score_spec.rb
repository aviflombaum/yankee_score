require 'spec_helper'

describe YankeeScore do
  it "has a version number" do
    expect(YankeeScore::VERSION).not_to be nil
  end

  context YankeeScore::CLI do
    it "Welcomes user to YankeeScore" do
      cli = YankeeScore::CLI.new
      expect{cli.call}.to output("Welcome to Yankee Score!\n").to_stdout
    end
  end
end
