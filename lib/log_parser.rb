require_relative "stats_presenter"

class LogParser
  def self.parse(path, stats_presenter = StatsPresenter)
    new(path, stats_presenter).call
  end

  def initialize(path, stats_presenter)
    self.path = path
    self.stats_presenter = stats_presenter
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

    stats_presenter.print_page_views(page_views_counts)
    stats_presenter.print_unique_page_views(unique_page_views_counts)
  end

  private

  attr_accessor :path, :stats_presenter

  def parse_file(file)
    page_views = Hash.new { |hash, key| hash[key] = [] }

    file.each_line do |line|
      page, ip = line.strip.split(" ")
      page_views[page] = page_views[page].push(ip)
    end

    page_views
  end
end
