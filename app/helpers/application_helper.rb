module ApplicationHelper

  def set_active_if(name)
    request.url.match(/\/#{name}/i) ? 'active' : nil
  end

  def select_options_for_vat
    [
        ['8 %', 1.08],
        ['5 %', 1.05],
        ['23 %', 1.23],
        ['zwolniony', 1.00],
    ]
  end
end
