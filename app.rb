require_relative 'menu.rb'

header_text = 'My App'
header = { text: header_text, color: :red }
body_text = "Welcome to my super awesome menu!\nThis menu has word and text wrapping so that really long sentences like this one don't mess up your menu size."
body_choices = ['Menu Choice 1', 'Menu Choice 2', 'Menu Choice 3']
body = {text: body_text, choices: body_choices, align: 'ljust', color: :white }
footer_text = "Each section can be aligned\nAnd have different colors"
footer = { text: footer_text, align: 'rjust', color: :blue }
menu1 = Menu.new(header: header, body: body, footer: footer)
menu1.border_color = :green
system('clear')
menu1.display_menu
