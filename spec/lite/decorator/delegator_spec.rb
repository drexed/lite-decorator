# frozen_string_literal: true

require "spec_helper"

RSpec.describe Lite::Decorator::Delegator do
  let(:poro) do
    Poro
      .include(described_class)
      .new
  end
  let(:user) do
    User
      .include(described_class)
      .new(first_name: "John", last_name: "Doe")
  end

  describe ".decorator" do
    context "when method in object" do
      it "doesnt delegate to decorator" do
        expect(poro.first_name).to eq("Foo")
        expect(user.first_name).to eq("John")
      end
    end

    context "when method in decorator" do
      it "calls delegated method" do
        expect(poro.initials).to eq("FB")
        expect(user.initials).to eq("JD")
      end
    end

    context "when method missing in object and decorator" do
      it "raises NoMethodError" do
        expect { poro.womp }.to raise_error(NoMethodError)
        expect { user.womp }.to raise_error(NoMethodError)
      end
    end
  end

end
