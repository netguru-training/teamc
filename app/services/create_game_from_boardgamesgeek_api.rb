class CreateGameFromBoardgamesgeekApi
  require 'net/http'
  require 'open-uri'

  attr_accessor :error

  def initialize(game_id)
    @game_id = game_id
  end

  def call
    url = "http://www.boardgamegeek.com/xmlapi/boardgame/#{@game_id}"
    dom = Nokogiri::XML(open(url))

    unless dom.nil?
      node = dom.xpath("//boardgames/boardgame").first

      hash = Hash[*node.element_children.map { |e| [e.name, e.content] }.flatten].with_indifferent_access

      unless hash["error"]
        game = BoardGame.new
        game.name = hash[:name]
        game.description = hash[:description]
        game.min_players = hash[:minplayers]
        game.max_players = hash[:maxplayers]
        game.min_age = hash[:age]
        game.img_small__url = hash[:thumbnail]
        game.img_full_url = hash[:image]
        game.game_id = @game_id

        unless game.save
          self.error = "Error during saving game"
        end
      else
        self.error = "No game with this id."
      end
    else
      self.error = "Error when connectin to API"
    end

    return self
  end
end