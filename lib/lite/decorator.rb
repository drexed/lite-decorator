# frozen_string_literal: true

%w[version base].each do |name|
  require "lite/decorator/#{name}"
end
