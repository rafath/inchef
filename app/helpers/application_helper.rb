module ApplicationHelper

  def set_active_if(name)
    request.url.match(/\/#{name}/i) ? 'active' : nil
  end
end
