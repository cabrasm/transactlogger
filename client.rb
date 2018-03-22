require 'faraday'

class Client
  URL = 'http://localhost'

  def self.gossip(port, peers, blockchain)
    begin
      Faraday.post("#{URL}:#{port}/gossip", peers: peers, blockchain: blockchain).body
    rescue Faraday::ConnectionFailed => e
      raise
    end
  end

  def self.get_pub_key(port)
    Faraday.get("#{URL}:#{port}/pub_key").body
  end

  def self.add_transaction(port, instance, database, query, user)
    Faraday.post("#{URL}:#{port}/add_transaction", instance: instance, database: database, query: query,  user: user).body
  end
end
