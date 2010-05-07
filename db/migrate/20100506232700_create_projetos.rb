class CreateProjetos < ActiveRecord::Migration
  def self.up
    create_table :projetos do |t|
      t.string :nm_projeto, :size=>50

      t.timestamps
    end
  end

  def self.down
    drop_table :projetos
  end
end
