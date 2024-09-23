# frozen_string_literal: true

require "spec_helper"

RSpec.describe Lite::Decorator::Inference do
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

  describe ".decorator_class" do
    it "returns infered decorator name" do
      expect(poro.decorator_class).to eq(PoroDecorator)
      expect(user.decorator_class).to eq(UserDecorator)
    end
  end

  describe ".decorator" do
    it "returns infered decorator class" do
      expect(poro.decorator).to be_instance_of(PoroDecorator)
      expect(user.decorator).to be_instance_of(UserDecorator)
    end
  end

end
