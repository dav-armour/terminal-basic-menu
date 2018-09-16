Gem::Specification.new do |s|
  s.name        = 'terminal-basic-menu'
  s.version     = '1.0.0'
  s.date        = '2018-09-16'
  s.summary     = "A basic menu for terminal apps"
  s.description = "A simple gem used to create and display menus for terminal apps."
  s.authors     = ["David Armour"]
  s.email       = 'agrobmonkey@gmail.com'
  s.files       = ["lib/terminal-basic-menu.rb"]
  s.homepage    =
    'https://github.com/dav-armour/terminal-basic-menu'
  s.license       = 'MIT'

  s.add_runtime_dependency("rainbow","~> 3.0", ">=3.0.0")
end
