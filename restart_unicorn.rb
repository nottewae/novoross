if File.exist?(File.join(File.dirname(__FILE__),"tmp","pids","unicorn.pid"))
  pid=File.open(File.join(File.dirname(__FILE__),"tmp","pids","unicorn.pid")).read
  system "kill "+pid if pid && pid.to_i!=0
end
Dir.chdir File.dirname(__FILE__)
system "rake assets:precompile"
system "rake db:migrate"




system "unicorn_rails -c config/unicorn.conf.rb -E production -D"
