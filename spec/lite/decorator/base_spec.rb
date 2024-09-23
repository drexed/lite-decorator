# frozen_string_literal: true

require "spec_helper"

RSpec.describe Lite::Decorator::Base do
  let(:user) { User.new(first_name: "John", last_name: "Doe") }
  let(:decorator) { UserDecorator.new(user) }

  describe "#delegation" do
    it 'returns "John Doe"' do
      expect(decorator.full_name).to eq("John Doe")
    end
  end

  describe "#decorate" do
    it "to be a Decorator object for ARs" do
      decorated_user = UserDecorator.decorate(user)

      expect(decorated_user.full_name).to eq("John Doe")
    end

    it "decorators multiple objects" do
      other_user = User.new(first_name: "Jane", last_name: "Doe")
      decorated_users = UserDecorator.decorate([user, other_user])

      expect(decorated_users.map(&:full_name)).to eq(["John Doe", "Jane Doe"])
    end
  end

  describe ".class" do
    it "returns a User class object" do
      expect(decorator.class).to eq(User)
    end
  end

  describe ".object" do
    it "returns a User instance object" do
      expect(decorator.object).to be_a(User)
    end
  end

  describe ".to_model" do
    it "returns User object" do
      expect(decorator.to_model).to be_a(User)
    end
  end

end
