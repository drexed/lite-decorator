# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Rails::DecoratorGenerator, type: :generator do
  destination(File.expand_path('../../tmp', __FILE__))

  before do
    prepare_destination
    run_generator(%w[v1/users/age])
  end

  let(:decorator_path) { 'spec/generators/tmp/app/decorators/v1/users/age_decorator.rb' }
  let(:rspec_path) { 'spec/generators/tmp/spec/decorators/v1/users/age_decorator_spec.rb' }

  describe '#generator' do
    context 'when generating app files' do
      it 'to be true when decorator file exists' do
        expect(File.exist?(decorator_path)).to eq(true)
      end

      it 'to include the proper markup' do
        decorator_file = File.read(decorator_path)
        text_snippet = 'class V1::Users::AgeDecorator < ApplicationDecorator'

        expect(decorator_file.include?(text_snippet)).to eq(true)
      end
    end

    context 'when generating spec files' do
      it 'to be true when decorator file exists' do
        expect(File.exist?(rspec_path)).to eq(true)
      end

      it 'to include the proper markup' do
        rspec_file = File.read(rspec_path)
        text_snippet = 'V1::Users::AgeDecorator, type: :decorator'

        expect(rspec_file.include?(text_snippet)).to eq(true)
      end
    end
  end

end
