ActiveAdmin.register BoardGame do

permit_params :name, :description, :min_players, :max_players, :min_age, :game_id

  controller do
    def create
      game_id = params[:board_game][:game_id]
      ret = CreateGameFromBoardgamesgeekApi.new(game_id).call
      if ret.error.present?
        flash[:error] = ret.error.to_s
        redirect_to admin_board_games_url
      else
        flash[:success] = "Game created"
        redirect_to admin_board_games_url
      end
    end
  end

  form do |f|
    f.inputs "Game_id" do
      f.input :game_id
    end

    f.actions
  end


end
