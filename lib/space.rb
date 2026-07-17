# frozen_string_literal: true

class Space
  def initialize(name)
    @name = name
    @connected_spaces = []
  end
end
