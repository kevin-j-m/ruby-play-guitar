# frozen_string_literal: true
require "timecop"

module Blues
  RSpec.describe TubeAmplifier do
    describe "#turn_on" do
      it "sets the amplifier on when it is off" do
        amp = TubeAmplifier.new

        expect { amp.turn_on }
          .to change { amp.on? }
          .from(false)
          .to(true)
      end

      it "stores the time the amplifier was turned on" do
        amp = TubeAmplifier.new

        Timecop.freeze do
          expect { amp.turn_on }
            .to change { amp.instance_variable_get("@time_turned_on") }
            .from(nil)
            .to(Time.now)
        end
      end

      it "does not update the time turned on when it's already on" do
        amp = TubeAmplifier.new

        Timecop.freeze do
          amp.turn_on
          original_time_turned_on = Time.now

          Timecop.freeze(Time.now + 500) do
            expect { amp.turn_on }
              .not_to change { amp.instance_variable_get("@time_turned_on") }
              .from(original_time_turned_on)
          end
        end
      end
    end

    describe "#turn_off" do
      it "sets the amplifier off when it is on" do
        amp = TubeAmplifier.new
        amp.turn_on

        expect { amp.turn_off }
          .to change { amp.on? }
          .from(true)
          .to(false)
      end

      it "resets the time turned on to nil" do
        amp = TubeAmplifier.new
        amp.turn_on

        Timecop.freeze do
          expect { amp.turn_off }
            .to change { amp.instance_variable_get("@time_turned_on") }
            .to(nil)
        end
      end
    end

    describe "#warm_up_complete?" do
      it "is false when the amp has not been turned on" do
        amp = TubeAmplifier.new

        expect(amp.warm_up_complete?).to eq false
      end

      it "is false when the warm up time has not passed" do
        amp = TubeAmplifier.new

        Timecop.freeze do
          amp.turn_on

          expect(amp.warm_up_complete?).to eq false
        end
      end

      it "is true when the warm up time is met" do
        amp = TubeAmplifier.new

        Timecop.freeze do
          amp.turn_on

          Timecop.freeze(Time.now + TubeAmplifier::SECONDS_TO_WARM_UP) do
            expect(amp.warm_up_complete?).to eq true
          end
        end
      end

      it "is true when the warm up time is exceeded" do
        amp = TubeAmplifier.new

        Timecop.freeze do
          amp.turn_on

          Timecop.freeze(Time.now + TubeAmplifier::SECONDS_TO_WARM_UP + 2) do
            expect(amp.warm_up_complete?).to eq true
          end
        end
      end
    end

    describe "#volume" do
      it "is the specified volume when the warm up time is complete" do
        amp = TubeAmplifier.new(volume: 10)

        Timecop.freeze do
          amp.turn_on

          Timecop.freeze(Time.now + TubeAmplifier::SECONDS_TO_WARM_UP + 2) do
            expect(amp.volume).to eq 10
          end
        end
      end

      it "is 0 when the amp has not been turned on" do
        amp = TubeAmplifier.new(volume: 10)

        expect(amp.volume).to eq 0
      end

      it "is 0 directly after the amp is turned on" do
        amp = TubeAmplifier.new(volume: 10)

        Timecop.freeze do
          amp.turn_on

          expect(amp.volume).to eq 0
        end
      end

      it "decreases the volume by the percentage of warm up that's been done" do
        amp = TubeAmplifier.new(volume: 10)

        Timecop.freeze do
          amp.turn_on

          Timecop.freeze(Time.now + (TubeAmplifier::SECONDS_TO_WARM_UP - 7)) do
            expect(amp.volume).to eq 3
          end
        end
      end

      it "is less than the specified volume directly before the amp is warmed up" do
        amp = TubeAmplifier.new(volume: 9)

        Timecop.freeze do
          amp.turn_on

          Timecop.freeze(Time.now + (TubeAmplifier::SECONDS_TO_WARM_UP - 1)) do
            expect(amp.volume).to eq 8
          end
        end
      end
    end

    describe "#amplify" do
      it "provides the sound value at the volume specified when fully warmed up" do
        amp = TubeAmplifier.new(volume: 10)

        note = Note.new(root_note: :c, root_octave: 1, offset: 0)

        Timecop.freeze do
          amp.turn_on

          Timecop.freeze(Time.now + (TubeAmplifier::SECONDS_TO_WARM_UP + 2)) do
            expect(amp.amplify(note)).to eq "C1🔥🔊[10]"
          end
        end
      end

      it "provides the sound value at a fraction of the volume specified when not warmed up" do
        amp = TubeAmplifier.new(volume: 10)

        note = Note.new(root_note: :c, root_octave: 1, offset: 0)

        Timecop.freeze do
          amp.turn_on

          Timecop.freeze(Time.now + (TubeAmplifier::SECONDS_TO_WARM_UP - 7)) do
            expect(amp.amplify(note)).to eq "C1💡🔈[3]"
          end
        end
      end
    end
  end
end
