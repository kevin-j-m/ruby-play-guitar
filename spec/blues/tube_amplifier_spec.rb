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

      it "starts the warm up" do
        amp = TubeAmplifier.new

        Timecop.freeze do
          expect { amp.turn_on }
            .to change { amp.instance_variable_get("@warm_up") }
            .from(nil)
        end
      end

      it "does not warm up again when it's already on" do
        amp = TubeAmplifier.new

        Timecop.freeze do
          amp.turn_on
          warm_up = amp.instance_variable_get("@warm_up")

          expect { amp.turn_on }
            .not_to change { amp.instance_variable_get("@warm_up") }
            .from(warm_up)
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

      it "resets the warm up to nil" do
        amp = TubeAmplifier.new
        amp.turn_on

        Timecop.freeze do
          expect { amp.turn_off }
            .to change { amp.instance_variable_get("@warm_up") }
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
          warm_up

          expect(amp.warm_up_complete?).to eq true
        end
      end

      it "is true when the warm up time is exceeded" do
        amp = TubeAmplifier.new

        Timecop.freeze do
          amp.turn_on
          warm_up(seconds: 12)

          expect(amp.warm_up_complete?).to eq true
        end
      end
    end

    describe "#volume" do
      it "is the specified volume when the warm up time is complete" do
        amp = TubeAmplifier.new(volume: 10)

        Timecop.freeze do
          amp.turn_on
          warm_up

          expect(amp.volume).to eq 10
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
          warm_up(seconds: 3)

          expect(amp.volume).to eq 3
        end
      end

      it "is less than the specified volume directly before the amp is warmed up" do
        amp = TubeAmplifier.new(volume: 9)

        Timecop.freeze do
          amp.turn_on
          warm_up(seconds: 9)

          expect(amp.volume).to eq 8
        end
      end
    end

    describe "#amplify" do
      it "provides the sound value at the volume specified when fully warmed up" do
        amp = TubeAmplifier.new(volume: 10)

        note = Note.new(root_note: :c, root_octave: 1, offset: 0)

        Timecop.freeze do
          amp.turn_on
          warm_up

          expect(amp.amplify(note)).to eq "C1🔥🔊[10]"
        end
      end

      it "provides the sound value at a fraction of the volume specified when not warmed up" do
        amp = TubeAmplifier.new(volume: 10)

        note = Note.new(root_note: :c, root_octave: 1, offset: 0)

        Timecop.freeze do
          amp.turn_on
          warm_up(seconds: 3)

          expect(amp.amplify(note)).to eq "C1💡🔈[3]"
        end
      end
    end

    describe "#pre_amp_tone" do
      it "has no tone when turned off" do
        amp = TubeAmplifier.new(volume: 10)

        expect(amp.pre_amp_tone).to eq " "
      end

      it "has a warm tone at a low volume" do
        amp = TubeAmplifier.new(volume: 1)
        amp.turn_on
        warm_up

        expect(amp.pre_amp_tone).to eq "💡"
      end

      it "has a warm tone at a mid volume" do
        amp = TubeAmplifier.new(volume: 6)
        amp.turn_on
        warm_up

        expect(amp.pre_amp_tone).to eq "💡"
      end

      it "has a hot tone at a high volume" do
        amp = TubeAmplifier.new(volume: 8)
        amp.turn_on
        warm_up

        expect(amp.pre_amp_tone).to eq "🔥"
      end
    end

    describe "#pre_amp_weight" do
      it "is heavy" do
        amp = TubeAmplifier.new

        expect(amp.pre_amp_weight).to eq :heavy
      end
    end

    describe "#power_amp_weight" do
      it "is heavy" do
        amp = TubeAmplifier.new

        expect(amp.power_amp_weight).to eq :heavy
      end
    end

    describe "#weight" do
      it "is heavy" do
        amp = TubeAmplifier.new

        expect(amp.weight).to eq :heavy
      end
    end

    def warm_up(seconds: nil)
      if seconds
        Timecop.travel(Time.now + seconds)
      else
        Timecop.travel(Time.now + (TubeWarmUp::SECONDS_TO_WARM_UP + 2))
      end
    end
  end
end
