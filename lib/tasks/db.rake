namespace :db do
  task :is_dev do
    raise "You can only use this in dev!" unless Rails.env == 'development'
  end

  desc "Migrate the database and annotate models"
  task :migrate => :is_dev do
    Rake::Task['annotate:models'].invoke
  end
end
