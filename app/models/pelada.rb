class Pelada < ActiveRecord::Base
	has_and_belongs_to_many :usuario

	validates :minimo_pessoas, numericality: { only_integer: true }
	validates :maximo_pessoas, numericality: { only_integer: true }
end
