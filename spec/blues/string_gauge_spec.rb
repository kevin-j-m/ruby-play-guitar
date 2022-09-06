# frozen_string_literal: true

module Blues
  RSpec.describe StringGauge do
    describe "#[]" do
      it "provides the gauge size for the string requested" do
        gauge = StringGauge.new(:nine)

        expect(gauge[1]).to eq(9)
      end

      it "raises an exception for an unknown set" do
        gauge = StringGauge.new(:seven)

        expect { gauge[1] }.to raise_error "unknown string gauge set"
      end
    end
  end
end
