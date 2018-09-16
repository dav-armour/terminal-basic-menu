Gem::Specification.new do |s|
  s.name        = 'Terminal Basic Menu'
  s.version     = '0.1.0'
  s.date        = '2018-09-16'
  s.summary     = "A basic menu for terminal apps"
  s.description = "A simple gem used to create and display menus for terminal apps. Uses Rainbow gem to add color."
  s.authors     = ["David Armour"]
  s.email       = 'agrobmonkey@gmail.com'
  s.files       = ["lib/menu.rb"]
  s.homepage    =
    'https://github.com/dav-armour/terminal-basic-menu'
  s.license       = 'MIT'

  s.add_runtime_dependency("rainbow","~> 3.0.0")
end
