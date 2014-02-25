namespace :annotate do
  task :is_dev do
    raise "You can only use this in dev!" unless Rails.env == 'development'
  end

  desc "annotate your models!"
  task :models => :is_dev do
    puts "Annotating models"
    exec "annotate --exclude tests,fixtures,factories -p before"
  end
end
