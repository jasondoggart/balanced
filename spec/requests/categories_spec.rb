require 'rails_helper'

RSpec.describe 'Category', type: :request do
  it 'creates a category' do
    budget = FactoryBot.create(:budget, name: "Doggart Budget")
    name = "New Category"

    post api_v1_budget_categories_path(budget), params: { name: name }

    expect(response).to have_http_status(201)
    expect(budget.reload.categories.last.name).to eq(name)

  end

  it 'responds with a 422 if created with invalid params' do
    budget = FactoryBot.create(:budget, name: "Doggart Budget")
    name = ""

    post api_v1_budget_categories_path(budget), params: { name: name }

    expect(response).to have_http_status(422)
  end

  it 'can be updated' do
    budget = FactoryBot.create(:budget, name: "Doggart Budget")
    category = FactoryBot.create(:category,
                                   name: "Income",
                                   budget: budget)
    name = "new name"

    patch api_v1_budget_category_path(budget, category), params: { name: name }

    expect(response).to have_http_status(202)
    expect(category.reload.name).to eq(name)
  end

  it 'sends a 422 when updated with invalid params' do
    budget = FactoryBot.create(:budget, name: "Doggart Budget")
    category = FactoryBot.create(:category,
                                   name: "Income",
                                   budget: budget)
    name = ""

    patch api_v1_budget_category_path(budget, category), params: { name: name }

    expect(response).to have_http_status(422)
    expect(category.reload.name).to eq("Income")
  end

  it 'deletes a budget' do
    budget = FactoryBot.create(:budget, name: "Doggart Budget")
    category = FactoryBot.create(:category,
                                   name: "Income",
                                   budget: budget)

    delete api_v1_budget_category_path(budget, category)

    expect(response).to have_http_status(204)
  end
end
