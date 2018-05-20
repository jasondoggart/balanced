Rails.application.routes.draw do
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
