class StatsPresenter
  def self.print_page_views(stats)
    new(stats, "Total page views").call
  end

  def self.print_unique_page_views(stats)
    new(stats, "Unique page views").call
  end

  def initialize(stats, header)
    self.stats = stats
    self.header = header
  end

  def call
    puts header
    stats.sort_by { |_path, count| count }.reverse.each do |path, count|
      puts "#{path} -> #{count} page views."
    end
    puts "\n"
  end

  private

  attr_accessor :stats, :header
end
