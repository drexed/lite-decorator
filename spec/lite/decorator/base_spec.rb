# frozen_string_literal: true

require "spec_helper"

class Decorator < Lite::Decorator::Base

  def full_name
    "#{first_name} #{last_name}"
  end

end

RSpec.describe Lite::Decorator::Base do
  let(:fake) { Fake.new }
  let(:user) { User.new(first_name: "John", last_name: "Doe") }

  let(:fake_decorator) { Decorator.new(fake) }
  let(:user_decorator) { Decorator.new(user) }

  describe "#delegation" do
    it 'to be "John Doe"' do
      expect(fake_decorator.full_name).to eq("John Doe")
      expect(user_decorator.full_name).to eq("John Doe")
    end
  end

  describe "#decorate" do
    it "to be a Decorator object for POROs" do
      result = Decorator.decorate(fake)

      expect(result.full_name).to eq("John Doe")
    end

    it "to be a Decorator object for ARs" do
      result = Decorator.decorate(user)

      expect(result.full_name).to eq("John Doe")
    end

    it "to be Decorator objects for PORO collections" do
      result = Decorator.decorate([fake])

      expect(result.map(&:full_name)).to eq(["John Doe"])
    end

    it "to be Decorator objects for AR collections" do
      user.save!

      result = Decorator.decorate(User.all)

      expect(result.map(&:full_name)).to eq(["John Doe"])
    end
  end

  describe ".class" do
    it "to be a Decorator class object" do
      expect(fake_decorator.class).to eq(Decorator)
    end

    it "to be a User class object" do
      expect(user_decorator.class).to eq(User)
    end
  end

  describe ".object" do
    it "to be a Fake instance object" do
      expect(fake_decorator.object.is_a?(Fake)).to be(true)
    end

    it "to be a User instance object" do
      expect(user_decorator.object.is_a?(User)).to be(true)
    end
  end

  describe ".to_model" do
    it "to be a Fake object" do
      expect(fake_decorator.to_model.is_a?(Fake)).to be(true)
    end

    it "to be a User object" do
      expect(user_decorator.to_model.is_a?(User)).to be(true)
    end
  end

end
