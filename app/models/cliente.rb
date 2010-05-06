class Cliente < ActiveRecord::Base
  validates_presence_of :nm_cliente, :status, :email
end
