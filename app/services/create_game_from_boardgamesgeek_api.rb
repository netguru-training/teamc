class CreateGameFromBoardgamesgeekApi
  require 'net/http'
  require 'open-uri'

  def initialize(object_id)
    @object_id = object_id
  end

  def call
    url = "http://www.boardgamegeek.com/xmlapi/boardgame/#{@object_id}"
    #resp = Net::HTTP.get_response(URI.parse(url))
    #xml_doc  = Nokogiri::XML(resp)
    doc = Nokogiri::XML(open(url))

    node = doc.xpath("//boardgames/boardgame").first

    hash = node.element_children.each_with_object(Hash.new) do |e, h|
      h[e.name.to_sym] = e.content
    end

    game = BoardGame.new
    game.name = hash[:name]
    game.description = hash[:description]
    game.min_players = hash[:minplayers]
    game.max_players = hash[:maxplayers]
    game.min_age = hash[:age]
    game.img_small__url = hash[:thumbnail]
    game.img_full_url = hash[:image]
    game.object_id = @object_id

    if game.save
      return true
    else
      return false
    end
  end
end