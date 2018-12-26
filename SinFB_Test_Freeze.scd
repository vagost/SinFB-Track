
b = Buffer.readChannel(s, "/Users/vagelis/Library/Application Support/SuperCollider/Sounds/sinFB_test_1.aiff", channels: 0);

(
~synthdefs = CtkProtoNotes(

		SynthDef(\freeze, { arg out=0, soundBufnum=2, rate = 1, bufs = 2048;
		Ê Ê var in, chain;
		Ê Ê in = PlayBuf.ar(1, soundBufnum, BufRateScale.kr(soundBufnum)*1.4*rate, loop: 1);
		Ê Ê chain = FFT(LocalBuf([bufs, bufs]), in);
		Ê Ê chain = PV_MagFreeze(chain, MouseX.kr(0, LFNoise0.kr(MouseY.kr(0.5, 100)))
				 );
		ÊOut.ar(out, 0.7 * IFFT(chain));
		
		}),
);
)

~synth1 = ~synthdefs[\freeze].new.soundBufnum_(b).play;
~synth1.free;

//While Changing lfo's freg change the freq of the drone sound on track
~lfoRate = CtkControl.lfo(SinOsc, 40.4, 0.7, 1);
~synth1.rate_(~lfoRate);
~synth1.rate_(1);

s.record;
s.stopRecording;


