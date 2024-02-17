class StringCalculator < ApplicationRecord
    def self.add(numbers)
        return 0 if numbers.empty?

        if numbers.start_with?("//")
          delimiter_section, number_string = numbers.split("\n", 2)
          delimiters = extract_delimiters(delimiter_section)
          numbers = number_string
        else
          delimiters = [",", "\n"]
        end
    
        numbers_array = split_numbers(numbers, delimiters)
        negatives = numbers_array.select { |n| n < 0 }
    
        raise "negatives not allowed: #{negatives.join(", ")}" if negatives.any?
    
        numbers_array.reject { |n| n > 1000 }.sum
    end

    private

    def self.extract_delimiters(delimiter_section)
        delimiter_section[2..-1].scan(/\[?(.*?)\]?/).flatten
    end

    def self.split_numbers(numbers, delimiters)
        regexp = Regexp.union(delimiters)
        numbers.split(regexp).map(&:to_i)
    end
end