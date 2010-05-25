class AddAtividadesAndMotivoAtividades < ActiveRecord::Migration
  def self.up
    create_table :atividades_motivo_atividades, :id => false do |t|
      t.references :atividade, :motivo_atividade
    end
  end

  def self.down
     drop_table :atividades_motivo_atividades
  end
end
