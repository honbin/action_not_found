desc "Show all not actions"
task :action_not_found => :environment do
  all_routes = Rails.application.routes.routes
  base_path = Rails.root.join('app').join('controllers')
  not_defined_acitons = ActionNotFound.process(all_routes, base_path)
  puts not_defined_acitons
end
