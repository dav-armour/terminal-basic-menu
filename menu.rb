# Basic menu class used to create an instance of a terminal menu
class Menu
  def initialize(name, width = 50, header: nil, body: nil, footer: nil)
    @name = name
    @width = width
    @header = header
    @body = body
    @footer = footer
  end

  def display_menu
    display_header if @header
    display_body if @body
    display_footer if @footer
  end

  def display_header
    puts '+' + '-' * (@width - 2) + '+'
    puts '|' + ''.center(@width - 2) + '|'
    puts '+' + '-' * (@width - 2) + '+'
  end
end

def display_body
  puts '-' * @width
  puts '|' + ''.center(@width - 2) + '|'
  puts '-' * @width
end

def display_footer
  puts '-' * @width
  puts '|' + ''.center(@width - 2) + '|'
  puts '-' * @width
end
