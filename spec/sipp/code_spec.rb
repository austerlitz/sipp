require 'spec_helper'

RSpec.describe Sipp::Code do
  subject { described_class.new(code) }
  let(:code) { 'CCCC' }

  describe "#valid?" do
    it "returns true when valid" do
      subject.validate!
      expect(subject.valid?).to be true
    end

    context "when code is invalid" do
      let(:code) { "1234" }

      it "returns false" do
        expect(subject.valid?).to be false
      end
    end
  end
end