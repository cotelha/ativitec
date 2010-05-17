class Cliente < ActiveRecord::Base
  validates_presence_of :nm_cliente, :email
  validates_uniqueness_of :email
end
