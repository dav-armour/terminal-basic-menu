require_relative 'menu.rb'

header_text = 'My App'
header = { text: header_text }
body_text = "This is a test\n2nd line of test that is a bit longer\n3rd line."
body_choices = ['item 1', 'item 2', 'item 3']
body = { text: body_text, choices: body_choices }
menu = Menu.new('test', 5, header: header, body: body, footer: true)
menu.display_menu
