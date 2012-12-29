module ActionNotFound
  class Railtie < Rails::Railtie
    rake_tasks do
      load "action_not_found/tasks.rake"
    end
  end
end

