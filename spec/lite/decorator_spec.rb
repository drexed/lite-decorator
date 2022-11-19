# frozen_string_literal: true

RSpec.describe Lite::Decorator do
  it "to be a version number" do
    expect(Lite::Decorator::VERSION).not_to be_nil
  end
end
