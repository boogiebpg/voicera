module ApplicationHelper
  def allowed_params(params)
    params.to_unsafe_h.slice(:page, :per_page, :sort, :order)
  end

  def sorting_url(field)
    sorting_params = allowed_params(params)
    invert_order = sorting_params['order']&.downcase == 'asc' ? 'desc' : 'asc'
    sorting_params['order'] = field == sorting_params['sort'] ? invert_order : 'asc'
    sorting_params['sort'] = field
    "?" + sorting_params.to_query
  end
end
