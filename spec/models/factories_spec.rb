require 'rails_helper'

FactoryGirl.factories.each do |factory|
  describe "The #{factory.name} factory" do
    it 'is valid' do
      factory_instance = FactoryGirl.build(factory.name)
      factory_instance.valid?
      expect(factory_instance.errors).to be_empty
    end
  end
end
