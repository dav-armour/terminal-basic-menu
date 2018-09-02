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
    # Return if nothing to display
    return unless @header || @body || @footer
    print_line_break
    if @header
      display_header
      print_line_break
    end
    if @body
      display_body
      print_line_break
    end
    if @footer
      display_footer
      print_line_break
    end
  end

  def display_header
    print_text(@header[:text], @header[:align])
  end

  def display_body
    print_text(@body[:text], @body[:align])
  end

  def display_footer
    print_text(@footer[:text], @footer[:align])
  end

  private

  def print_text(text, align = 'center')
    align = 'center' if align == nil
    lines = text.split("\n")
    max_length = lines.map(&:length).max
    lines.each do |line|
      puts '| ' + line.ljust(max_length).send(align, @width - 4) + ' |'
    end
  end

  def print_line_break
    puts '+' + '-' * (@width - 2) + '+'
  end

  def word_wrap
  end
end
