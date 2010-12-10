Rails.application.routes.draw do
  match '/auth/:provider/callback', :to => 'omni#callback'
end
