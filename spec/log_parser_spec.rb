require "log_parser"

describe LogParser do
  describe "::parse" do
    subject { described_class.parse(path, stats_presenter) }
    let(:path) { "spec/support/test_data.log" }
    let(:stats_presenter) { double("StatsPresenter", print_page_views: nil, print_unique_page_views: nil) }

    it "reads the file from the given path" do
      expect(File).to receive(:read).with(path).and_return("")

      subject
    end

    it "uses the stats presenter to print the calculated values" do
      expected_page_views = [["/3", 1], ["/2", 2], ["/1", 3]]
      expected_unique_page_views = [["/3", 1], ["/2", 2], ["/1", 1]]

      expect(stats_presenter).to receive(:print_page_views).with(expected_page_views)
      expect(stats_presenter).to receive(:print_unique_page_views).with(expected_unique_page_views)

      subject
    end

    context "when path points to a nonexistent file" do
      let(:path) { "spec/support/nonexistent.log" }

      it "exits the script" do
        expect { subject }.to raise_error(SystemExit)
      end
    end
  end
end
