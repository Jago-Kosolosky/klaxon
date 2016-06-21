class SlackNotification
  def self.perform(url, payload)
    json = payload.to_json
    request = HTTParty.post(url, body: json)
    if request.code == 200
      request.body
    else
      puts "Fout met de verbinding via url=#{url} voor payload=#{payload.to_json}"
      return false
    end
  end
end
