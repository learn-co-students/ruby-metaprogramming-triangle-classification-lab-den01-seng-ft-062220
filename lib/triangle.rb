require 'pry'

class Triangle

  attr_reader :length1, :length2, :length3 

  def initialize length1, length2, length3
    @length1 = length1
    @length2 = length2
    @length3 = length3
  end

  def kind
    # binding.pry
    raise TriangleError if !is_a_triangle?
      if length1 == length2 && length1 == length3
        :equilateral
      elsif (length1 == length2) || (length1 == length3) || (length2 == length3)
        :isosceles
      else
        :scalene
      end
  end

  def is_a_triangle?
    if length1 + length2 <= length3
      false
    elsif length2 + length3 <= length1
      false
    elsif length1 + length3 <= length2
      false
    elsif (length1 + length2 + length3).zero?
      false
    else
      true
    end
  end

  class TriangleError < StandardError
    def message
      "That is not a triangle!"
    end
  end
end
