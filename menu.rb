# Basic menu class used to create an instance of a terminal menu
class Menu
  attr_accessor :name, :width, :header, :body, :footer
  def initialize(name, width = 50, header: nil, body: nil, footer: nil)
    @name = name
    @width = width - 4 # adjust to allow '| ' and ' |' on each side
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

  def print_text(text, align)
    # Default to center align
    align = 'center' if align.nil?
    lines = text.split("\n")
    # Wrap words or text that is too long
    lines.map! { |line| word_wrap(line) }
    lines.flatten!
    # Check for longest line to allow for grouped alignment
    max_length = lines.map(&:length).max
    lines.each do |line|
      puts '| ' + line.ljust(max_length).send(align, @width) + ' |'
    end
  end

  # def print_choices(choices, align = 'center')
  #   align = 'center' if align.nil?
  #   lines = text.split("\n")
  #   max_length = lines.map(&:length).max
  #   lines.each do |line|
  #     puts '| ' + line.ljust(max_length).send(align, @width) + ' |'
  #   end
  # end

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

end
