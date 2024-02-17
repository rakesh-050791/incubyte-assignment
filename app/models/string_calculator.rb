class StringCalculator < ApplicationRecord
    def self.add(numbers)
        delimiters = [',', '\n']
        numbers = numbers.gsub(/\/\/(.*)\n/, '')
        delimiters << $1 unless $1.nil?
        numbers = numbers.split(Regexp.union(delimiters)).map(&:to_i)
        negatives = numbers.select { |number| number < 0 }
        raise "negatives not allowed: #{negatives.join(', ')}" if negatives.any?
      
        numbers.reject { |number| number > 1000 }.sum
    end
end