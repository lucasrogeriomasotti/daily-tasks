module ApplicationHelper
  def nav_sidebar_item_class item, controller
    if item.to_s == controller
      return "active"
    end
    return ""
  end
end
