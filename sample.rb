require_relative 'lib/terminal-basic-menu'

header_text = 'My App'
header = { text: header_text, color: :red }
body_text = "\nWelcome to my super awesome menu!\n\nThis menu has word and text \
              wrapping so that really long sentences like this one don't mess up your menu size."
body_choices = ['Menu Choice 1', 'Menu Choice 2', 'Menu Choice 3']
body = {text: body_text, choices: body_choices, align: 'center', color: :white }
footer_text = "Each section can be aligned\nAnd have different colors"
footer = { text: footer_text, align: 'rjust', color: :blue }
menu1 = Menu.new(header: header, body: body, footer: footer)
menu1.border_color = :green
system('clear')
# menu1.word_wrap = false;
# menu1.block_align = false;
menu1.display_menu

# Can specify width on creation
menu2 = Menu.new(width: 20)
# Can pass in data after creation
menu2.body = { text: 'Each section is optional and can be left out' }
# Defaults to center align and default color

menu2.display_menu
