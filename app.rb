require_relative 'menu.rb'

header_text = 'My App'
header = { text: header_text, align: 'ljust'}
body_text = "This is a test\n2nd line of test that is a bit longer\n3rd line."
body_choices = ['item 1', 'item 2', 'item 3']
body = { text: body_text, choices: body_choices, align: 'rjust' }
footer_text = 'Choose shit. Q to exit'
footer = { text: footer_text, align: 'ljust'}
menu = Menu.new('test', header: header, body: body, footer: footer)
menu2 = Menu.new('test2', 20)
# text = "abc123" * 100
system('clear')
menu.display_menu
menu2.display_menu