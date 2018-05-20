require 'rails_helper'

RSpec.describe 'Line Item', type: :request do
  it 'creates a new line item' do
    budget = FactoryBot.create(:budget, name: "Doggart Budget")
    category = FactoryBot.create(:category,
                                   name: "Income",
                                   budget: budget)
    name = "New Line"

    post api_v1_budget_category_line_items_path(budget, category), params: {
      name: name
    }

    expect(response).to have_http_status(201)
    expect(category.reload.line_items.last.name).to eq(name)
  end

  it 'responds with a 422 if created with invalid params' do
    budget = FactoryBot.create(:budget, name: "Doggart Budget")
    category = FactoryBot.create(:category,
                                   name: "Income",
                                   budget: budget)
    name = ""

    post api_v1_budget_category_line_items_path(budget, category), params: {
      name: name
    }

    expect(response).to have_http_status(422)
  end

  it 'can be updated' do
    budget = FactoryBot.create(:budget, name: "Doggart Budget")
    category = FactoryBot.create(:category,
                                   name: "Income",
                                   budget: budget)
    line_item = FactoryBot.create(:line_item,
                                  name: "Paycheck",
                                  category: category)
    name = "new name"

    patch api_v1_budget_category_line_item_path(budget, category, line_item),
      params: {
      name: name
    }

    expect(response).to have_http_status(202)
    expect(line_item.reload.name).to eq(name)
  end

  it 'sends a 422 when updated with invvalid params' do
    budget = FactoryBot.create(:budget, name: "Doggart Budget")
    category = FactoryBot.create(:category,
                                   name: "Income",
                                   budget: budget)
    line_item = FactoryBot.create(:line_item,
                                  name: "Paycheck",
                                  category: category)
    name = ""

    patch api_v1_budget_category_line_item_path(budget, category, line_item),
      params: {
      name: name
    }

    expect(response).to have_http_status(422)
    expect(line_item.reload.name).to eq("Paycheck")
  end

  it 'deletes a line_item' do
    budget = FactoryBot.create(:budget, name: "Doggart Budget")
    category = FactoryBot.create(:category,
                                   name: "Income",
                                   budget: budget)
    line_item = FactoryBot.create(:line_item,
                                  name: "Paycheck",
                                  category: category)

    delete api_v1_budget_category_line_item_path(budget, category, line_item)

    expect(response).to have_http_status(204)
  end
end
