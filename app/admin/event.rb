ActiveAdmin.register Event do

permit_params :name, :description, :room_id, :datetime, board_game_ids: [], user_ids: []

  form do |f|
    f.inputs "Event" do
      f.input :name
      f.input :description
      f.input :room, collection: ( Room.all )
      f.input :datetime
    end

    f.inputs "Games" do
      f.input :board_game_ids, as: :select, input_html: { multiple: true }, collection: ( BoardGame.all )
    end

    f.inputs "Participants" do
      f.input :user_ids, as: :select, input_html: { multiple: true }, collection: ( User.all )
    end

    f.actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :room
      row :datetime
      row :board_game_list do
        event.board_games.each do |game|
          div do
            simple_format game.name
          end
        end
      end
      row :user_list do
        event.users.each do |user|
          div do
            simple_format user.name
          end
        end
      end
    end
    active_admin_comments
  end
end
