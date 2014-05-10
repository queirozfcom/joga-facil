class Usuario < ActiveRecord::Base
	has_and_belongs_to_many :pelada

	validates :nome, :email, presence: true
end