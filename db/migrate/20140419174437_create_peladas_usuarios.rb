class CreatePeladasUsuarios < ActiveRecord::Migration
  def change
    create_table :peladas_usuarios do |t|
      t.references :pelada, index: true
      t.references :usuario, index: true

      t.timestamps
    end
  end
end
