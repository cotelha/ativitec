class CreateOrdenServicos < ActiveRecord::Migration
  def self.up
    create_table :orden_servicos do |t|
      t.timestamp :dt_inicio
      t.timestamp :dt_termino
      t.references :cliente
      t.references :user
      t.references :atividade
      t.text :txt_descricao
      t.text :txt_descricao_tecnica
      t.string :ind_cancelado, :string=>1
      t.integer :nro_prioridade, :limit=>2
      t.decimal :hrs_previsao_termino, :precision=>5, :scale=>2
      t.string :nm_contato, :string=>70
      t.string :ind_status, :string=>1
      t.references :motivo_atividades
      t.references :projeto

      t.timestamps
    end
  end

  def self.down
    drop_table :orden_servicos
  end
end
