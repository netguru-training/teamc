ActiveAdmin.register Event do

permit_params :name, :description, :room_id, :datetime, board_game_ids: []
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  form do |f|
    f.inputs "Event" do
      f.input :name
      f.input :description
      f.input :room, collection: (Room.all)
      f.input :datetime
    end

    f.inputs "Games" do
      f.input :board_game_ids, :as => :select, :input_html => {:multiple => true}, collection: (BoardGame.all)
    end

    f.actions
  end


end
