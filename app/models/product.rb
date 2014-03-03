class Product < ActiveRecord::Base
	validates :name, presence: true
	validates :description, presence: true
	validates :manufacturer, presence: true
	validates :stock, presence: true
end
