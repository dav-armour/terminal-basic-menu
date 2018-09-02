require_relative 'menu.rb'

header_text = 'My App'
header = { text: header_text }
body_text = "This is a test\nLonger line to test it\n3rd line."
body_choices = ['item 1', 'item 2', 'item 3']
body = { text: body_text, choices: body_choices, align: 'ljust', choice_align: 'fail' }
footer_text = "Choose Option. Q to exit"
footer = { text: footer_text, align: 'rjust'}
menu1 = Menu.new(header: header, body: body, footer: footer)
system('clear')
menu1.display_menu

menu2 = Menu.new(width: 150)
body2_text = "abc123 " * 20
body2_text += "abc123" * 40
menu2.body = { text: body2_text }
menu2.display_menu
