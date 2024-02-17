class StringCalculator < ApplicationRecord
    def self.add(numbers)
        numbers.split(',').map(&:to_i).sum
    end
end