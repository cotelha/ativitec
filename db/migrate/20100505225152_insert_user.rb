class InsertUser < ActiveRecord::Migration
  def self.up
    #User.create(:id=>1, :login=>'rafael', :tp_user=>'A', :name=>'rafael', :email=>'rafae.cote@gmail.com', :crypted_password=>'636c50b97f6cf278a0779f0cf48f2fd076534463', :salt=>'8a1284fc603d8cf14b51465aa408e37e9a317b49', :created_at=>nil, :updated_at=>nil, :remember_token_expires_at=>nil)
    execute("insert into users(login,tp_user,name,email,crypted_password,salt) values('rafael','A','rafael','rafael.cote@gmail.com','636c50b97f6cf278a0779f0cf48f2fd076534463','8a1284fc603d8cf14b51465aa408e37e9a317b49');")
  end

  def self.down
    User.delete_all("login='rafael'")
  end
end
