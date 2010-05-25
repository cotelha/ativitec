class CreateMotivoAtividades < ActiveRecord::Migration
  def self.up
    create_table :motivo_atividades do |t|
      t.string :nm_motivo, :size=>50
      #t.references :atividade

      t.timestamps
    end
  end

  def self.down
    drop_table :motivo_atividades
  end
end
