class Pelada < ActiveRecord::Base
	has_and_belongs_to_many :usuario

	validates :minimo_pessoas, numericality: { :greater_than_or_equal_to => 1 }
	validates :maximo_pessoas, numericality: { :greater_than_or_equal_to => 1, :allow_nil => true, :greater_than_or_equal_to => :minimo_pessoas }
end
