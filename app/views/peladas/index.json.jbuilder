json.array!(@peladas) do |pelada|
  json.extract! pelada, :id, :data, :local, :minimo_pessoas, :custo, :responsavel
  json.url pelada_url(pelada, format: :json)
end
