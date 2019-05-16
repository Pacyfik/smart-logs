require "stats_presenter"

describe StatsPresenter do
  describe "::print_page_views" do
    subject { described_class.print_page_views(stats) }
    let(:stats) { [["/1", 1], ["/2", 2]] }

    it "prints total page view stats to STDOUT" do
      expect(STDOUT).to receive(:puts).with("Total page views")
      expect(STDOUT).to receive(:puts).with("/2 -> 2 page views.")
      expect(STDOUT).to receive(:puts).with("/1 -> 1 page views.")
      expect(STDOUT).to receive(:puts).with("\n")

      subject
    end
  end

  describe "::print_unique_page_views" do
    subject { described_class.print_unique_page_views(stats) }
    let(:stats) { [["/1", 1], ["/2", 2]] }

    it "prints unique page view stats to STDOUT" do
      expect(STDOUT).to receive(:puts).with("Unique page views")
      expect(STDOUT).to receive(:puts).with("/2 -> 2 page views.")
      expect(STDOUT).to receive(:puts).with("/1 -> 1 page views.")
      expect(STDOUT).to receive(:puts).with("\n")

      subject
    end
  end
end
