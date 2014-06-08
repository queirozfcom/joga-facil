class ChangeColumnResponsavel < ActiveRecord::Migration
  def change
  	remove_column :peladas, :responsavel, :string
		add_column :peladas, :nome_responsavel, :string
		add_column :peladas, :email_responsavel, :string
	end
end
