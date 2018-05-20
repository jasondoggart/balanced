require 'rails_helper'

RSpec.describe 'Budget', type: :request do
  it 'returns a list of budgets' do
    budget = FactoryBot.create(:budget, name: "Doggart Budget")
    category_1 = FactoryBot.create(:category, name: "Income", budget: budget)
    category_2 = FactoryBot.create(:category, name: "Expenses", budget: budget)
    FactoryBot.create(:line_item,
                                    name: "Paycheque",
                                    category: category_1)
    FactoryBot.create(:line_item,
                                    name: "Grocery",
                                    category: category_2)


    get api_v1_budgets_path, as: :json
    parsed_response = JSON.parse(response.body)

    expect(parsed_response['budgets'].length).to eq(1)
    expect(parsed_response['budgets'][0]['categories'].length).to eq(2)
    expect(parsed_response['budgets'][0]['categories'][0]['line_items'].length).to eq(1)
    expect(response).to have_http_status(200)
  end

  it 'creates a budget' do
    name = 'Doggart Budget'
    post api_v1_budgets_path, params: { name: name }

    expect(response).to have_http_status(201)
    expect(Budget.last.name).to eq(name)
  end

  it 'sends a 422 when the params are not valid' do
    name =''
    post api_v1_budgets_path, params: { name: name }
    expect(response).to have_http_status(422)

  end

  it 'gets a budget' do
    budget = FactoryBot.create(:budget, name: "Doggart Budget")

    get api_v1_budget_path(budget), as: :json
    
    expect(response).to have_http_status(200)
  end

  it 'updates a budget' do 
    budget = FactoryBot.create(:budget, name: "Doggart Budget")
    new_name = "Doggart Budget 2"

    patch api_v1_budget_path(budget), params: { name: new_name }

    expect(response).to have_http_status(202)
    expect(budget.reload.name).to eq("Doggart Budget 2")
  end

  it 'sends a 422 when the params are not valid' do
    budget = FactoryBot.create(:budget, name: "Doggart Budget")
    new_name = ""

    patch api_v1_budget_path(budget), params: { name: new_name }

    expect(response).to have_http_status(422)
    expect(budget.reload.name).to eq("Doggart Budget")
  end

  it 'deletes a budget' do
    budget = FactoryBot.create(:budget, name: "Doggart Budget")

    delete api_v1_budget_path(budget)

    expect(response).to have_http_status(204)
  end
end
