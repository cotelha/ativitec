class InsertUser < ActiveRecord::Migration
  def self.up
    Users.create :login=>"rafae", :name=>"rafae", :email=>"rafae.cote@gmail.com", :crypted_password=>"636c50b97f6cf278a0779f0cf48f2fd076534463", :salt=>"8a1284fc603d8cf14b51465aa408e37e9a317b49"
  end

  def self.down
    Users.delete_all("login='rafael'")
  end
end
