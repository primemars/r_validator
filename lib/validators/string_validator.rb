module RValidator
  module StringValidator
    extend self
    def valid_length?(value, min = 1, max = 65535)
      return value.length >= min && value.length <= max
    end

    def contain_invalid_chars?(value, invalidChars)
      invalidChars.chars.to_a.any? {|c| value.include? c}
    end
  end
end
