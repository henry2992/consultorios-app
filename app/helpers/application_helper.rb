module ApplicationHelper
  def sortable title, columns
    direction = (columns.join(", ") == sort_column && sort_direction == "asc") ? "desc" : "asc"
    link_to title, {sort: columns.join(", "), direction: direction, page: nil}, {class: direction, id: "by_#{title.downcase}"}
  end
end
