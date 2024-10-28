desc 'Release all gems (native, binaries for JRuby and Windows)'
task :release do
  command = "gem push sbf-dm-validations-#{DataMapper::Validation::VERSION}.gem"
  puts "Executing #{command.inspect}:"
  sh command
end