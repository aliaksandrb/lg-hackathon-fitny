module ApplicationHelper
  def categories_list
    Category.all.order(name: :asc)
  end
end
