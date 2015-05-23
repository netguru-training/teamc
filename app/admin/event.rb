ActiveAdmin.register Event do

permit_params :name, :description, :room_id, :datetime
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
      f.input :room_id, collection: (Room.all)
      f.input :datetime
    end
    f.actions
  end


end
