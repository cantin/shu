namespace :db do
  desc <<-EOF
    Prepare DB base on your config/database.yml, include creating the db_user and db, granting db_user all db's privileges.

    Your need to input DB root password to make sure the permission to configure your DB in server.

    DB environment is depend on rails_env which in your deploy.rb file.
    if set :rails_env, 'production',
    then run `cap db:perpare` will prepare production DB base on database.yml
  EOF

  task :prepare do
    set :env, YAML.load(capture(%Q(cd #{deploy_to}/current/ && cat config/database.yml)))[rails_env]
    set :db_name, env['database']
    set :db_user, env['username']
    set :db_password, (env['password'] || "")

    puts '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
    puts 'db_name is: ' + db_name
    puts 'db_user is: ' + db_user
    puts 'user_password is: ' + db_password
    puts '<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<'

    set :continue, Capistrano::CLI.ui.ask('Do you want to go on:(y/n): ')

    if db_user == 'root'
      puts "Your are using root account in your database.yml !!!"
      set :continue, 'n'
    end


    if continue.downcase == 'y'
      set :db_root_password, Capistrano::CLI.password_prompt("Enter MySQL database root password: ")
      puts capture(%Q(mysql -u root --password='#{db_root_password}' -e "
                    create database #{db_name} default character set utf8;
                    create user #{db_user} identified by '#{db_password}';
                    grant all privileges on #{db_name}.* to #{db_user};
                    show grants for #{db_user};").gsub("\n",""))
      puts 'DB prepare finished......'
    else
      puts 'DB prepare Exit......'
    end
  end
end
