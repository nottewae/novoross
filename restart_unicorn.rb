
Dir.chdir File.dirname(__FILE__)
p "assets precompile"
system "rake assets:precompile"
p "database prepare"
system "rake db:migrate"
if File.exist?(File.join(File.dirname(__FILE__),"tmp","pids","unicorn.pid"))
  pid=File.open(File.join(File.dirname(__FILE__),"tmp","pids","unicorn.pid")).read
  p "found pid:#{pid.to_i}"
  system "kill "+pid if pid && pid.to_i!=0
  p "kill it"
end
p "start unicorn"
system "unicorn -c config/unicorn.conf.rb -E production -D"
p "exit"