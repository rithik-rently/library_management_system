ActiveAdmin.register History do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :users_id, :books_id, :issue_date, :return_date
  #
  # or
  #
  # permit_params do
  #   permitted = [:users_id, :books_id, :issue_date, :return_date]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
