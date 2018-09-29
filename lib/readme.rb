class Readme
  def self.update
    new.update
  end

  def update
    puts "Update readme project list"
    pp current_list

    start, finish = markers
    new_content = content
    new_content.slice!(start+1..finish-1)

    new_content[start+1, 0] = ["\n", current_list, "\n"]
    puts new_content
  end

  def current_list
    list = []
    Dir.glob("examples/*").each do |path|
      puts "path #{path}"
      name = path.sub('examples/','').gsub(/[-_]/,' ').split(' ').map(&:capitalize).join(' ')
      li = "* [#{name}](#{path})"
      list << li
    end
    list.sort
  end

  def content
    return @lines if @lines
    content = IO.read("./README.md")
    @lines = content.split("\n")
  end

  # Markers for beginning and ending line of the ## Examples section
  def markers
    return @markers if @markers
    @markers = []
    in_examples_section = false
    content.each_with_index do |line, n|
      # Above the "## Examples" detection becase it needs to happen after that has been deleted
      # in the next loop interation.
      if in_examples_section && line.strip =~ /^## /
        @markers << n
        in_examples_section = false
      end

      if line.strip == "## Examples"
        @markers << n
        in_examples_section = true
      end
    end
    @markers
  end
end