class GamesRepository
  BGG_URL = "https://www.boardgamegeek.com/xmlapi2/collection?username=pboksz&own=1&stats=1&excludesubtype=boardgameexpansion"

  def all
    parse_games
  end

  def write_to_yaml
    File.write(File.join(Rails.root, "config", "games_bgg.yml"), all.to_yaml)
  end

  private

  def response
    @response ||= Net::HTTP.get(URI.parse(BGG_URL))
  end

  def games_hash
    @games_hash ||= Hash.from_xml(response)
  end

  def parse_games
    games_hash["items"]["item"].map { |item| game_object(item) }.compact if games_hash["items"] && games_hash["items"]["item"]
  end

  def game_object(item)
    return unless item["name"] && item["yearpublished"] && item["stats"] && item["stats"]["rating"] && item["stats"]["rating"]["value"]
    { "name" => "#{item["name"]} (#{item["yearpublished"]})", "stars" => (item["stats"]["rating"]["value"].to_i / 2) }
  end
end
