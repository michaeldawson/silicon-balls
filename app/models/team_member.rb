class TeamMember < ApplicationRecord
  mount_uploader :picture, PictureUploader

  validates :name, presence: true
  validates :expertise, presence: true
  # validates :picture, presence: true
  validate :social_attributes_are_urls

  def social_attributes
    social_attribute_keys = %i(facebook twitter linkedin)
    attributes.symbolize_keys.slice(*social_attribute_keys).reject { |key, value| value.blank? }
  end

  def photo_path
    "team-members/#{name.parameterize}.jpg"
  end

  private

  def social_attributes_are_urls
    social_attributes.each do |key, value|
      errors.add(key, 'must be a valid URL') unless value =~ /\A#{URI::regexp}\z/
    end
  end
end
