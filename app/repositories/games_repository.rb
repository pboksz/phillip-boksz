class GamesRepository
  BGG_COLLECTION_URL = "https://www.boardgamegeek.com/xmlapi2/collection?username=pboksz&own=1&stats=1&excludesubtype=boardgameexpansion"
  BGG_GAME_URL = "https://boardgamegeek.com/boardgame/"

  def all
    parsed_games
  end

  def write_to_yaml
    File.write(File.join(Rails.root, "config", "games_bgg.yml"), all.to_yaml)
  end

  private

  def response
    @response ||= Net::HTTP.get(URI.parse(BGG_COLLECTION_URL))
  end

  def bgg_games
    @bgg_games ||= Hash.from_xml(response).try(:[], "items").try(:[], "item")
  end

  def parsed_games
    @parsed_games ||= bgg_games.map { |item| game_object(item) }.compact
  end

  def all_data_present?(item)
    item["objectid"] && item["name"] && item["yearpublished"] &&
      item["stats"] && item["stats"]["rating"] && item["stats"]["rating"]["value"]
  end

  def game_object(item)
    return unless all_data_present?(item)

    {
      "link" => File.join(BGG_GAME_URL, item["objectid"]),
      "name" => "#{item["name"]} (#{item["yearpublished"]})",
      "stars" => item["stats"]["rating"]["value"].to_i / 2.0
    }
  end
end
