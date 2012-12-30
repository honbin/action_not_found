require 'action_not_found/railtie.rb'

module ActionNotFound
  extend self

  def process(all_routes, base_path)
    formatted = case Rails.version
      when /^3\.2/
        process_rails_3_2(all_routes)
      else
        process_rails_4(all_routes)
    end
    formatted_action_not_found(formatted, base_path)
  end

  def formatted_action_not_found(formatted, base_path)
    not_found_controller_count = 0
    not_found_action_count = 0
    formatted_action_not_found = formatted.each do |route|
      route =~ /\/(.*?)\s+(.*?)#(.*?)$/
      controller_path = base_path.join("#{$2}_controller.rb")
      begin
        unless File.readlines(controller_path).grep(/def\s#{$3}/).size > 0
          route << " #=> not found action"
          not_found_action_count += 1
        end
      rescue
        route << " #=> not found controller file"
        not_found_controller_count += 1
      end
    end
    formatted_action_not_found.push("\n#{formatted.size} routes, #{not_found_action_count} not found actions, #{not_found_controller_count} not controller files")
  end

  def process_rails_3_2(all_routes)
    require 'rails/application/route_inspector'
    Rails::Application::RouteInspector.new.format(all_routes)
  end

  def process_rails_4(all_routes)
    require 'action_dispatch/routing/inspector'
    ActionDispatch::Routing::RoutesInspector.new.format(all_routes)
  end
end
