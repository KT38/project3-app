Rails.application.routes.draw do
  get 'home/top'
  post "home/result" => "home#result"
end
