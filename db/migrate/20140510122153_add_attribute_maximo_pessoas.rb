class AddAttributeMaximoPessoas < ActiveRecord::Migration
  def up
    add_column :peladas, :maximo_pessoas, :integer
  end
  def down
    remove_column :peladas, :maximo_pessoas, :integer
  end
end
