class Application < ApplicationRecord
  validate :all_fields_less_than_or_equal_to_100_words

  def all_fields_less_than_or_equal_to_100_words
    attributes.each do |attribute_name, value|
      if value.to_s.split(' ').length > 100
        errors.add(attribute_name, "must be 100 words or less")
      end
    end
  end
end
