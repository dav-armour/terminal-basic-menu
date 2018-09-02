# Basic menu class used to create an instance of a terminal menu
class Menu
  attr_accessor :width, :header, :body, :footer
  def initialize(width: 50, header: nil, body: nil, footer: nil)
    @width = width - 4 # adjust to allow '| ' and ' |' on each side
    @header = header
    @body = body
    @footer = footer
  end

  def display_menu
    # Return if nothing to display
    return unless @header || @body || @footer
    # Change left to ljust etc.
    align_to_method!
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
    print_choices(@body[:choices], @body[:choice_align])
  end

  def display_footer
    print_text(@footer[:text], @footer[:align])
  end

  private

  def print_text(text, align, choices: false)
    # Default to center align
    align = 'center' if align.nil?
    # Split for normal text not for choices
    lines = choices ? text : text.split("\n")
    # Wrap words or text that is too long
    lines.map! { |line| word_wrap(line) }
    lines.flatten!
    # Check for longest line to allow for grouped alignment
    max_length = lines.map(&:length).max
    lines.each_with_index do |line, i|
      line.prepend("#{i}) ") if choices
      puts '| ' + line.ljust(max_length).send(align, @width) + ' |'
    end
  end

  def print_choices(choices, align)
    print_text(choices, align, choices: true) unless choices.nil?
  end

  def print_line_break
    puts '+' + '-' * (@width + 2) + '+'
  end

  def word_wrap(text)
    lines = text.split("\n")
    string = ''
    lines.each do |line|
      space_left = @width
      line.split.each do |word|
        if word.length + 1 > space_left
          string += "\n"
          if word.length > @width
            # Use regex to split word with newline when reaching max width
            word = word.scan(/.{1,#{@width}}/).join("\n")
          end
          string += word
          space_left = @width - word.length
        else
          string += " #{word}"
          space_left -= word.length + 1
        end
      end
      string += "\n"
    end
    string.strip.split("\n")
  end

  def align_to_method!
    @header[:align] = method_name(@header[:align]) if @header
    if @body
      @body[:align] = method_name(@body[:align])
      @body[:choice_align] = method_name(@body[:choice_align])
    end
    @footer[:align] = method_name(@footer[:align]) if @footer
  end

  def method_name(input = nil)
    return if input.nil?
    case input
    when 'left', 'ljust'
      'ljust'
    when 'right', 'rjust'
      'rjust'
    when 'center', 'middle'
      'center'
    end
  end

end
