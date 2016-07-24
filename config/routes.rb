# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

get  'tms/enumerations/:type', :to => 'rest_api#enumarations_api'
get  'tms/custom_fields/', :to => 'rest_api#custom_fields_api'
get  'tms/issue_history/:id', :to => 'rest_api#issue_history_api'
