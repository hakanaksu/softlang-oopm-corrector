Rails.application.routes.draw do
  devise_for :users
  root to: 'dashboards#show'

  resource :dashboards, only: [:show]

  resource :comments, only: [:show]
  resources :courses do
    resources :students, controller: 'courses/students' do
      resources :assignments, only: [:edit, :update], controller: 'courses/students/assignments' do
      end
    end
    resources :assignments, only: :none do
      resources :tests, only: [:index], controller: 'courses/assignments/tests'
    end
    resource :svn_students, only: [:create], controller: 'courses/svn_students'
    resource :svn_checkouts, only: [:update], controller: 'courses/svn_checkouts'
    resource :svn_updates, only: [:update], controller: 'courses/svn_updates'
    resources :assignments, only: [:new, :create], controller: 'courses/assignments'
  end

end
