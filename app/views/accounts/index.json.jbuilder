json.array!(@accounts) do |account|
  json.extract! account, :id, :acc_id, :date, :type_name_id
  json.url account_url(account, format: :json)
end
