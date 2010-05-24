class CreateOsHistoricos < ActiveRecord::Migration
  def self.up
    create_table :os_historicos, :id=>false, :primary_key => [:user_id, :dt_inicio] do |t|
      t.references :orden_servico
      t.timestamp :dt_inicio
      t.timestamp :dt_termino
      t.references :atividade
      t.references :user

      #t.timestamps
    end
  end

  def self.down
    drop_table :os_historicos
  end
end
