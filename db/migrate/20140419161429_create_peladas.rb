class CreatePeladas < ActiveRecord::Migration
  def change
    create_table :peladas do |t|
      t.datetime :data
      t.string :local
      t.integer :minimo_pessoas
      t.float :custo
      t.string :responsavel

      t.timestamps
    end
  end
end
