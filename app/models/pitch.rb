class Pitch < ApplicationRecord
  validates :company_name, presence: true
  validates :contact_details, presence: true, length: { maximum: 250 }
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
    blank_attributes = custom_attributes.select { |attribute_name, value| value.blank? }
    return if blank_attributes.length.to_f / custom_attributes.length < 0.5

    blank_attributes.each do |attribute_name, value|
      errors.add(attribute_name, 'You need to answer at least half of these questions.')
    end
  end

  def custom_attributes
    attributes.except('id', 'company_name', 'other', 'contact_details', 'created_at', 'updated_at')
  end
end
