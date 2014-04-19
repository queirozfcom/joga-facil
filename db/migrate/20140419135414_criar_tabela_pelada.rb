class CriarTabelaPelada < ActiveRecord::Migration
  def change
    create_table :peladas do |t| 
      t.datetime :data
      t.string :local
      t.integer :minimo_pessoas
    end
 end
end
