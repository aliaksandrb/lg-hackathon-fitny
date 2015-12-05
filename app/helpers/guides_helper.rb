module GuidesHelper
  def guides_title
    content_for(:guides_title) || (params[:filter] == 'all' ? 'All Guides' : "Promoted Guides")
  end
end
