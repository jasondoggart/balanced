Rails.application.routes.draw do
  namespace :admin do
      resources :budgets
      resources :categories
      resources :line_items

      root to: "budgets#index"
    end
  namespace :api do
    namespace :v1 do
      resources :budgets do
        resources :categories do
          resources :line_items
        end
      end
    end
  end
end
