json.budgets @budgets do |budget|
  json.name budget.name

  json.categories budget.categories do |category|
    json.name category.name

    json.line_items category.line_items do |line_item|
      json.name line_item.name
    end
  end
end

