task :load_controllers => :environment do
  Rails.application.reload_routes!
end

desc "Show all not actions"
task :action_not_found, [ :path ] => :load_controllers do |task, args|
  all_routes = Rails.application.routes.routes
  base_path = Rails.root.join('app').join('controllers')
  not_defined_acitons = ActionNotFound.process(all_routes, base_path)
  puts not_defined_acitons
end
