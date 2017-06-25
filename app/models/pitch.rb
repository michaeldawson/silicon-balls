class Pitch < ApplicationRecord
  validates :company_name, presence: true
  validate :all_fields_less_than_or_equal_to_100_words
  validate :at_least_half_of_all_fields_completed

  def all_fields_less_than_or_equal_to_100_words
    attributes.each do |attribute_name, value|
      if value.to_s.split(' ').length > 100
        errors.add(attribute_name, "must be 100 words or less")
      end
    end
  end

  def at_least_half_of_all_fields_completed
    custom_attributes = attributes.except('id', 'company_name', 'other', 'created_at', 'updated_at')
    blank_attributes = custom_attributes.select { |attribute_name, value| value.blank? }
    return if blank_attributes.length.to_f / custom_attributes.length < 0.5

    blank_attributes.each do |attribute_name, value|
      errors.add(attribute_name, 'You need to answer at least half of these questions.')
    end
  end
end
