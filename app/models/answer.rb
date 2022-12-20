class Answer < ApplicationRecord
  before_create :set_params

  def calc
    @arr = []
    index = 0
    (10**(@num - 1)...(10**@num)).step(1) do |number|
      if food(number) == number
        @arr.push([index, number]) 
        index += 1
      end
    end
    @arr
  end

   def food(number)
    summa = 0
    @num.times do
      tri = number % 10
      number /= 10
      summa += tri**@num
    end
    summa
  end

  def set_params
    @num = numbers.to_i
    self.right_numbers = encode_output
  end

  def decode_array
    ActiveSupport::JSON.decode(right_numbers)
  end

  def encode_output
    ActiveSupport::JSON.encode(calc)
  end


end
