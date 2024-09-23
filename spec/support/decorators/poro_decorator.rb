# frozen_string_literal: true

class PoroDecorator < Lite::Decorator::Base

  def full_name
    "#{first_name} #{last_name}"
  end

  def initials
    "#{first_name[0]}#{last_name[0]}"
  end

end
