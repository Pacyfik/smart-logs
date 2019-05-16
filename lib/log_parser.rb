class LogParser
  def self.parse(path)
    new(path).call
  end

  def initialize(path)
    self.path = path
  end

  def call
    begin
      file = File.read(path)
    rescue Errno::ENOENT
      abort("Log file not found")
    end

    page_views = parse_file(file)

    page_views_counts = page_views.map { |path, ips| [path, ips.count] }
    unique_page_views_counts = page_views.map { |path, ips| [path, ips.uniq.count] }

    puts page_views_counts
    puts "\n"
    puts unique_page_views_counts
  end

  private

  attr_accessor :path

  def parse_file(file)
    page_views = Hash.new { |hash, key| hash[key] = [] }

    file.each_line do |line|
      page, ip = line.strip.split(" ")
      page_views[page] = page_views[page].push(ip)
    end

    page_views
  end
end
