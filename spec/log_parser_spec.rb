require "log_parser"

describe LogParser do
  describe "::parse" do
    subject { described_class.parse(path) }
    let(:path) { "spec/support/test_data.log" }

    it "reads the file from the given path" do
      expect(File).to receive(:read).with(path).and_return("")

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
