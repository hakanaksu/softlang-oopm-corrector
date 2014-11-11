Rails.application.routes.draw do
  devise_for :users
  root to: 'dashboards#show'

  resource :dashboards, only: [:show]
  resources :courses do
    resources :students, controller: 'courses/students' do
      resources :assignments, only: [:edit, :update], controller: 'courses/students/assignments'
    end
    resource :svn_students, only: [:create], controller: 'courses/svn_students'
    resource :svn_checkouts, only: [:update], controller: 'courses/svn_checkouts'
    resource :svn_updates, only: [:update], controller: 'courses/svn_updates'
    resources :assignments, only: [:new, :create], controller: 'courses/assignments'
  end

end
