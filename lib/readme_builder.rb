class ReadmeBuilder
  def self.update
    new.update
  end

  def initialize
    @readme_path = "./README.md"
  end

  def update
    puts "Update readme project list"
    start, finish = markers
    new_content = content
    new_content.slice!(start+1..finish-1)

    new_content[start+1, 0] = ["", current_list, ""]
    puts new_content
    IO.write(@readme_path, new_content.join("\n") + "\n")
  end

  def current_list
    pp gitmodules_repos

    list = []
    Dir.glob("examples/*").each do |path|
      li = li_item(path)
      list << li
    end
    list.sort
  end

  def li_item(path)
    name = path.sub('examples/','').gsub(/[-_]/,' ').split(' ').map(&:capitalize).join(' ')

    if submodule?(path)
      # sha = all_submodules[path]
      url = gitmodules_repos[path]
      "* [#{name}](#{url})"
    else
      "* [#{name}](#{path})"
    end
  end

  def gitmodules_repos
    return @gitmodules_repos if @gitmodules_repos
    lines = IO.readlines("./.gitmodules")
    data = {}
    capture, path, url = nil, nil, nil
    lines.each do |line|
      if capture == true
        path = line.split(' = ').last.strip if line =~ /path = /
        if line =~ /url = /
          url = line.split(' = ').last.strip
          url = url.sub(/\.git$/,'')
        end
        if url
          data[path] = url
        end
      end

      if capture != nil && line =~ /^\[/
        capture = path, url = false, nil, nil
      end

      if line =~ /^\[/
        capture = true
      end
    end
    @gitmodules_repos = data # hash structure
  end

  def submodule?(path)
    all_submodules.keys.include?(path)
  end

  def all_submodules
    return @all_submodules if @all_submodules
    out = `git submodule`
    submodules = out.split("\n").map(&:strip)
    # 12dfa10acaffe7117790dd6e8bbc7d4bcf97f245 examples/config-rules (heads/master)
    # 3b88932e5dce4b789fba866711e934e0228cd1de examples/crud-api (heads/master)
    # 5cf0d3d4958bacfc678258fa957e64c4041b7ff9 examples/crud-html (heads/master)
    @all_submodules = submodules.inject({}) do |h, line|
      name = line.split(' ')[1] # examples/crud-api
      sha = line.split(' ')[0]
      h.merge(name => sha)
    end
    @all_submodules # hash structure
 end

  def content
    return @lines if @lines
    content = IO.read(@readme_path)
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