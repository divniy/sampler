ActiveAdmin.register Post do
  # belongs_to :user
  # Specify parameters which should be permitted for assignment
  permit_params :title, :body
  # permit_params do
  # params = [:title, :body]
  # params
  # end
  controller do
    def create
      @post = Post.create_with(author: current_user).new(permitted_params[:post])
      create!
    end
  end

  # or consider:
  #
  # permit_params do
  #   permitted = [:title, :author_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  #

  # controller do
  #   before_action :set_author, only: :create
  #   def set_author
  #     resource = resource_class.create_with(author: Current.user)
  #   end
  # end

  # For security, limit the actions that should be available
  actions :all, except: []

  # Add or remove filters to toggle their visibility
  filter :id
  filter :title
  filter :author
  filter :created_at
  filter :updated_at

  # Add or remove columns to toggle their visibility in the index action
  index do
    selectable_column
    id_column
    column :title
    column :author
    column :created_at
    column :updated_at
    actions
  end

  # Add or remove rows to toggle their visibility in the show action
  show do
    attributes_table_for(resource) do
      row :id
      row :title
      row(:body) { resource.body.to_s }
      row :author
      row :created_at
      row :updated_at
    end
  end

  # Add or remove fields to toggle their visibility in the form
  form do |f|
    f.semantic_errors(*f.object.errors.attribute_names)
    f.inputs do
      f.input :title
      f.label :body
      f.rich_text_area :body
      # f.input :author
    end
    f.actions
  end
end
