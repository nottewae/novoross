pid=File.open(File.join(File.dirname(__FILE__),"tmp","pids","unicorn.pid")).read
Dir.chdir File.dirname(__FILE__)
system "rake assets:precompile"
system "rake db:migrate"

system "kill "+pid if pid && pid.to_i!=0


system "unicorn_rails -c config/unicorn.conf.rb -E production -D"
