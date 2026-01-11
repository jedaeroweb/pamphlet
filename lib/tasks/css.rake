Rake::Task["assets:precompile"].enhance do
  system("yarn build:css") || abort("CSS build failed")
end