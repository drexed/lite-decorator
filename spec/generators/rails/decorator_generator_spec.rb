# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Rails::DecoratorGenerator, type: :generator do
  destination(File.expand_path('../../tmp', __FILE__))

  before do
    prepare_destination
    run_generator(%w[v1/users/age])
  end

  let(:decorator_path) { 'spec/generators/tmp/app/decorators/v1/users/age_decorator.rb' }

  describe '#generator' do
    context 'when generating app files' do
      it 'to be true when decorator file exists' do
        expect(File.exist?(decorator_path)).to eq(true)
      end

      it 'to include the proper markup' do
        decorator_file = File.read(decorator_path)
        text_snippet = 'class V1::Users::AgeDecorator < Lite::Decorator::Base'

        expect(decorator_file.include?(text_snippet)).to eq(true)
      end
    end
  end

end
