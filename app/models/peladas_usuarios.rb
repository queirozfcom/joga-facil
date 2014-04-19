class PeladasUsuarios < ActiveRecord::Base
  belongs_to :pelada
  belongs_to :usuario
end
