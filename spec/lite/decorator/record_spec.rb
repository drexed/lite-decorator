# frozen_string_literal: true

require "spec_helper"

RSpec.describe Lite::Decorator::Record do
  let(:user) do
    User
      .include(described_class)
      .new(first_name: "John", last_name: "Doe")
  end

  describe ".decorator" do
    context "when method in model" do
      it "doesnt delegate to decorator" do
        expect(user.first_name).to eq("John")
      end
    end

    context "when method in decorator" do
      it "calls delegated method" do
        expect(user.initials).to eq("JD")
      end
    end

    context "when method missing in model and decorator" do
      it "raises NoMethodError" do
        expect { user.womp }.to raise_error(NoMethodError)
      end
    end
  end

end
