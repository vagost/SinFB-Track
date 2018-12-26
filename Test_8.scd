
Bota san simeio anaforas kapou kapou 
//:TEST_8

SynthDef(\kick, { | dur = 0.15, atk = 0.005, amp = 1, fb = 0, rel = 0.03625 |
	
	Out.ar([0, 1], SinOscFB.ar(
		EnvGen.ar( Env(
			\freq_l.kr([2960, 70, 0]),
			\freq_d.kr([0.07, 0.2]),
			\freq_c.kr([-13]),
		) ), fb,
		amp * EnvGen.ar(
			Env.perc( atk, rel, curve: \amp_c.kr([-1, 6])),
			doneAction: 2
		);	
	))
}).add;

SynthDef(\kick2, { | rel = 0.15, atk = 0.005, amp = 1, fb = 0 |
	
	Out.ar([0, 1], SinOscFB.ar(
		EnvGen.ar( Env(
			\freq_l.kr([2960, 70, 90]),
			\freq_d.kr([0.07, 0.2]),
			\freq_c.kr([-13, -1]),
		) ), fb,
		amp * EnvGen.ar(
			Env.perc( atk, rel - atk/3, curve: \amp_c.kr([-1, 6])),
			doneAction: 2
		);	
	))
}).add;


		
//:Pattern
//TODO: Oles oi sixnotites na prokiptoun me vasi mia klimaka, mesa sto pitch bend i proti nota mia klimaka i deuteri mia alli ktl
//Note: Otan xekinaei to teleutaio kai meta mpainei to proteleutaio gamato

Pdef(\spsat, 

	Ppar([
	
		Pbind(*[
			\instrument, \kick,
			\dur, Pseq([Pseq([1/2, 1/4, 1/4, 1/2, Pseq([1/4], 3), 1/4], 10)]/2, inf),
			\amp, 0.9 * Pseq([
				
				Pseq([1], 16),
				Pseq([0.8, 1], 8),  
				Pseq([1], 16),
				Pseq([0.8, 0.8, 0.9, 1]*0, 8)
			
			], inf) * 0.8,
			\freq_l, Pseq([
				`[1260,60,110],
				`[0, 0], `[0, 0], 
				`[8360,60,120], `[4360,60,120], `[0, 0], `[4360,60,120], `[0, 0],
				`[1260,60,110], `[0, 0], `[8360,60,120], `[0, 0] 
			],inf),
			\freq_d, Pseq([`[0.07, 0.2]], inf),
			\fb, Pseq([0], inf),
		
		]),
	
		
		Pbind(*[
			\instrument, \kick,
			\dur, Pseq([Pseq([1/2, 1/4, 1/4, 1/2, Pseq([1/8], 3), 1/8], 10)]*2, inf),
			\amp, 1 * Pseq([
				
				Pseq([1], 16),
				Pseq([0.8, 1], 8),  
				Pseq([1], 16),
				Pseq([0.8, 0.8, 0.9, 1], 8)
			
			], inf) * 0.8,
			\freq_l, Pseq([
				
				[ [1260, 90, 110], [2260, 90, 110]] ,
/*				

				`[0, 0, 0], `[0, 0, 0], 
				`[8360,60,120], `[4360,60,120], `[0, 0, 0], `[4360,60,120], `[0, 0, 0],
				`[1260,60,110], `[0, 0, 0], `[8360,60,120], `[0, 0, 0] 
*/			],inf),
			\freq_d, Pseq([ `[0.07, 0.02] ], inf),
			\fb, Pseq([0], inf),
		
		]),
		
		Pbind(*[
			\instrument, \kick,
			\dur, Pseq([1/8, 1/4], inf),
			\amp, 1 * Pseq([
			
				Pseq([1, 0], 16),
				Pseq([0.8, 1], 8),  
				Pseq([1], 10),
				Pseq([1, 0.8, 0.5, 1], 10)
			
			], inf) * 0.8,
			\freq_l, Pseq([
			
				`[1600, 40, 1000],
			
			],inf),
			\freq_d, Pseq([ [[0.07, 0.2]] ], inf),
			\fb, Pseq([0], inf),
		
		]),
	
		Pbind(*[
			\instrument, \kick,
			\dur, Pseq([1/8], inf),
			\amp, 0.6 * Pseq([
			
				Pseq([1, 0.5], 2),
				Pseq([0], 8),  
				Pseq([1], 5),
				Pseq([0], 10),
				Pseq([1, 1, 1, 1], 2)
			
			], inf) * 0.8,
			\atk, Pseq([0.02, 0.05, 0.1], inf), 
			\freq_l, Pseq([
			
				[[460, 60, 110], [260, 60, 110]],
			
			],inf),
			\freq_d, Pseq([ [[0.07, 0.2], [0.1, 0.2]] ], inf),
			\fb, Pseq([ [0, 10], [0, 20], [1, 200], [1, 1200] ], inf),
		
		]),
		
		
		Pbind(*[
			\instrument, \kick,
			\dur, Pseq([1/8], inf),
			\amp, 0.4 * Pseq([
			
				Pseq([1, 0.5], 2),
				Pseq([0], 8),  
				Pseq([1], 5),
				Pseq([0], 10),
				Pseq([1, 1, 1, 1], 2)
			
			], inf) * 0.8,
			//\atk, Pseq([0.02, 0.05, 0.001], inf), 
			\freq_l, Pseq([
			
				[ [4060, 600, 110], [2060, 600, 110] ],
			
			],inf),
			\freq_d, Pseq([ [ [0.07, 0.2], [1, 0.2] ] ], inf),
			\fb, Pseq([ [0, 10], [0, 200], [100, 200], [1, 1200] ], inf),
		
		]),
		
		Pbind(*[
			\instrument, \kick,
			\dur, Pseq([1/8], inf),
			\amp, 0.4 * Pseq([
			
				Pseq([1], 1),
				Pseq([0], 2),  
				Pseq([1], 2),
				Pseq([0], 3),
				Pseq([1], 2)
			
			], inf) * 0.8,
			\atk, 1,
			\freq_l, Pseq([
			
				[[460, 60, 110], [260, 60, 110]],
			
			],inf),
			\freq_d, Pseq([ [[1, 1], [0.4, 2]] ], inf),
			\fb, Pseq([ [0, 0.2] ], inf),
		
		]),

		Pbind(*[
			\instrument, \kick,
			\dur, Pseq([1/8], inf),
			\amp, 0.6 * Pseq([
			
				Pseq([1], 1),
				Pseq([0], 2),  
				Pseq([1], 8),
				Pseq([0], 3),
				Pseq([1], 2)
			
			], inf) * 0.8,
			\atk, 0.002,
			\freq_l, Pseq([
			
				[ [460, 60, 110], [260, 60, 110] ],
//				[[460, 600, 110], [260, 60, 110]],
				
			],inf),
			\freq_d, Pseq([ [  [0.1, 0.1], [0.1, 2] ] ], inf),
			\fb, Pseq([ [0, 200] ], inf),
		
		]),

		
////////////////////////
//===================================	
	
		//Midenisa ta kick2
		Pbind(*[
			\instrument, \kick2,
			\dur, Pseq([Pseq([1/2, 1/4, 1/4, 1/2, Pseq([1/8], 3), 1/8], 10)], inf),
			\amp, 0*0.1 * Pseq([
				Pseq([1], 16),
				Pseq([0.8, 1]*0, 8),  
				Pseq([0], 16),
				Pseq([0.8, 0.8, 0.9, 1]*0, 8)
			], inf) * 0.8,
			\atk, 2,
			\freq_l, Pseq([
				`[1000,100,10],
//				0, 0, 
//				`[8360,60,120], `[4360,60,120], 0, `[4360,60,120], 0,
//				`[1260,60,110], 0, `[8360,60,120], 0 
			],inf),
			\freq_d, Pseq([`[1000.4, 0.04]], inf),
			\fb, Pseq([0.5, 10000.3, 100], inf),
		
		]),
		
		Pbind(*[
			\instrument, \kick,
			\dur, Pseq([Pseq([1/2, 1/4, 1/4, 1/2, Pseq([1/8], 3), 1/8], 10)], inf),
			\amp, 0*0.1 * Pseq([
				Pseq([1], 16),
				Pseq([0.8, 1], 8),  
				Pseq([0.8], 16),
				Pseq([0.8, 0.8, 0.9, 1], 8)
			], inf) * 0.8,
			\atk, Pseq([`[0.1, 1, 0.5]], inf),
			\freq_l, Pseq([
				`[0,900,1000],
//				0, 0, 
//				`[8360,60,120], `[4360,60,120], 0, `[4360,60,120], 0,
//				`[1260,60,110], 0, `[8360,60,120], 0 
			],inf),
			\freq_d, Pseq([`[0.4, 0.04]], inf),
			\fb, Pseq([0], inf),
//			\rel, Pseq([[0.03625, 0.1, 0.035]], inf)
			
		]),
		
		Pbind(*[
			\instrument, \kick2,
			\dur, Pseq([Pseq([1/2, 1/4, 1/4, 1/2, Pseq([1/8], 3), 1/8], 10)], inf),
			\amp, 0*0.5 * Pseq([
				Pseq([1]*0, 16),
				Pseq([0.8, 1], 8),  
				Pseq([0]*0, 16),
				Pseq([0.8, 0.8, 0.9, 1]*0, 8)
			], inf) * 0.8,
			\atk, 2,
			\freq_l, Pseq([`[80]],inf),
			\freq_d, Pseq([[1, 0.04]], inf),
			\fb, Pseq([1000.3, 0.3], inf),
		
		]),

		
		Pbind(*[
			\instrument, \kick2,
			\dur, Pseq([1/2, 1/4, 1/4, 1/2, Pseq([1/8], 3), 1/8], inf),
			\amp, 0.8 * Pseq([
				Pseq([1]*0, 16),
				Pseq([0.8, 1], 8),  
				Pseq([1], 16),
				Pseq([0.8, 0.8, 0.9, 1], 8)
			], inf) * 0.5,
			\freq_l, Pseq([
				`[1260,60,110],
				0, 0, 
				`[4360,60,120], `[8360,60,120], 0, `[4360,60,120], 0,
				`[1260,60,110], 0, `[8360,60,120], 0 
			],inf),
			\freq_d, Pseq([[0.01, 17000]], inf),
			\fb, Pseq([0.3, 1], inf),
			\rel, 0.3,
			\atk, 0.001
			
		])

])).play(TempoClock(60/60), quant:[1]);

//:	Test_10

SynthDef(\kick, { | dur = 0.15, atk = 0.005, amp = 1, fb = 0, rel = 0.03625 |
	
	Out.ar([0, 1], SinOscFB.ar(
		EnvGen.ar( Env(
			\freq_l.kr([2960, 70, 0]),
			\freq_d.kr([0.07, 0.2]),
			\freq_c.kr([-13]),
		) ), fb,
		amp * EnvGen.ar(
			Env.perc( atk, rel, curve: \amp_c.kr([-1, 6])),
			doneAction: 2
		);	
	))
}).add;

SynthDef(\kick2, { | rel = 0.15, atk = 0.005, amp = 1, fb = 0 |
	
	Out.ar([0, 1], SinOscFB.ar(
		EnvGen.ar( Env(
			\freq_l.kr([2960, 70, 90]),
			\freq_d.kr([0.07, 0.2]),
			\freq_c.kr([-13, -1]),
		) ), fb,
		amp * EnvGen.ar(
			Env.perc( atk, rel - atk/3, curve: \amp_c.kr([-1, 6])),
			doneAction: 2
		);	
	))
}).add;


//:

Pdef(\spaxt, 

	Ppar([
	
		Pbind(*[
			\instrument, \kick,
			\dur, Pseq([Pseq([1/2, 1/4, 1/4, 1/2, Pseq([1/4], 3), 1/4], 10)]/2, inf),
			\amp, 0*0.8 * Pseq([
				
				Pseq([1], 16),
				Pseq([0.8, 1], 8),  
				Pseq([1], 16),
				Pseq([0.8, 0.8, 0.9, 1]*0, 8)
			
			], inf) * 0.8,
			\freq_l, Pseq([
				`[1260,60,110],
				`[0, 0], `[0, 0], 
				`[8360,60,120], `[4360,60,120], `[0, 0], `[4360,60,120], `[0, 0],
				`[1260,60,110], `[0, 0], `[8360,60,120], `[0, 0] 
			],inf),
			\freq_d, Pseq([`[0.07, 0.2]], inf),
			\fb, Pseq([0], inf),
		
		]),
	
		
		Pbind(*[
			\instrument, \kick,
			\dur, Pseq([Pseq([1/2, 1/4, 1/4, 1/2, Pseq([1/8], 3), 1/8], 10)]*2, inf),
			\amp, 0*0.6 * Pseq([
				
				Pseq([1], 16),
				Pseq([0.8, 1], 8),  
				Pseq([1], 16),
				Pseq([0.8, 0.8, 0.9, 1], 8)
			
			], inf) * 0.8,
			\freq_l, Pseq([
				
				[ [1260, 90, 110], [2260, 90, 110]] ,
/*				

				`[0, 0, 0], `[0, 0, 0], 
				`[8360,60,120], `[4360,60,120], `[0, 0, 0], `[4360,60,120], `[0, 0, 0],
				`[1260,60,110], `[0, 0, 0], `[8360,60,120], `[0, 0, 0] 
*/			],inf),
			\freq_d, Pseq([ `[0.07, 0.02] ], inf),
			\fb, Pseq([0], inf),
		
		]),
		
		Pbind(*[
			\instrument, \kick,
			\dur, Pseq([1/8, 1/4], inf),
			\amp, 0*1 * Pseq([
			
				Pseq([1, 0], 16),
				Pseq([0.8, 1], 8),  
				Pseq([1], 10),
				Pseq([1, 0.8, 0.5, 1], 10)
			
			], inf) * 0.8,
			\freq_l, Pseq([
			
				`[1260, 60, 110],
			
			],inf),
			\freq_d, Pseq([ [[0.07, 0.2], [0.1, 0.2]] ], inf),
			\fb, Pseq([0], inf),
		
		]),
	
		Pbind(*[
			\instrument, \kick,
			\dur, Pseq([1/8], inf),
			\amp, 0*0.6 * Pseq([
			
				Pseq([1, 0.5], 2),
				Pseq([0], 8),  
				Pseq([1], 5),
				Pseq([0], 10),
				Pseq([1, 1, 1, 1], 2)
			
			], inf) * 0.8,
			\atk, Pseq([0.02, 0.05, 0.001], inf), 
			\freq_l, Pseq([
			
				[[460, 60, 110], [260, 60, 110]],
			
			],inf),
			\freq_d, Pseq([ [[0.07, 0.2], [0.1, 0.2], [0.001, 1]] ], inf),
			\fb, Pseq([ [1000, 10], [10000, 20], [1, 200], [1, 1200] ], inf),
		
		]),
		
		
		Pbind(*[
			\instrument, \kick,
			\dur, Pseq([1/8], inf),
			\amp, 0*0.3 * Pseq([
			
				Pseq([1, 0.5], 2),
				Pseq([0], 8),  
				Pseq([1], 5),
				Pseq([0], 10),
				Pseq([1, 1, 1, 1], 2)
			
			], inf) * 0.8,
			//\atk, Pseq([0.02, 0.05, 0.001], inf), 
			\freq_l, Pseq([
			
				[ [4060, 600, 110], [2060, 600, 110] ],
			
			],inf),
			\freq_d, Pseq([ [ [0.07, 0.2], [1, 0.2] ] ], inf),
			\fb, Pseq([ [0, 10], [0, 200], [100, 200], [1, 1200] ], inf),
		
		]),
		
		Pbind(*[
			\instrument, \kick,
			\dur, Pseq([1/2], inf),
			\amp, 0.3 * Pseq([
			
				Pseq([1], 1),
				Pseq([0], 2),  
				Pseq([0], 2),
				Pseq([0], 3),
				Pseq([0], 2)
			
			], inf) * 0.8,
			\atk, 10,
			\rel, 2,
			\freq_l, Pseq([
			
//				[10060, 600, 110],
				
				[[460, 60, 110], [260, 600, 110], [2060, 6000, 110]]
			
			],inf),
			\freq_d, Pseq([ [[0.1, 0.1], [1000.4, 2]] ], inf),
			\fb, Pseq([ [0, 1000.3] ], inf), //auto apo 100.3 to pigaino 0.3 gamato!
		
		]),

		Pbind(*[
			\instrument, \kick,
			\dur, Pseq([1/8], inf),
			\amp, 0.7 * Pseq([
			
				Pseq([1], 1),
				Pseq([0], 2),  
				Pseq([1], 8),
				Pseq([0], 3),
				Pseq([1], 2)
			
			], inf) * 0.8,
			\atk, 0.002,
			\freq_l, Pseq([
			
				[ [460, 60, 110], [260, 60, 110] ],
//				[[460, 600, 110], [260, 60, 110]],
				
			],inf),
			\freq_d, Pseq([ [  [0.1, 0.1], [0.1, 2] ] ], inf),
			\fb, Pseq([ [0, 200] ], inf),
		
		]),

		
////////////////////////
//===================================	
	
		//Midenisa ta kick2
		Pbind(*[
			\instrument, \kick2,
			\dur, Pseq([Pseq([1/2, 1/4, 1/4, 1/2, Pseq([1/8], 3), 1/8], 10)], inf),
			\amp, 0*0.07 * Pseq([
				Pseq([1], 16),
				Pseq([0.8, 1]*0, 8),  
				Pseq([0], 16),
				Pseq([0.8, 0.8, 0.9, 1]*0, 8)
			], inf) * 0.8,
			\atk, 2,
			\freq_l, Pseq([
				`[1000,100,10],
//				0, 0, 
//				`[8360,60,120], `[4360,60,120], 0, `[4360,60,120], 0,
//				`[1260,60,110], 0, `[8360,60,120], 0 
			],inf),
			\freq_d, Pseq([`[1000.4, 0.04]], inf),
			\fb, Pseq([0.5, 10000.3, 100], inf),
		
		]),
		
		Pbind(*[
			\instrument, \kick,
			\dur, Pseq([Pseq([1/2, 1/4, 1/4, 1/2, Pseq([1/8], 3), 1/8], 10)], inf),
			\amp, 0*0.1 * Pseq([
				Pseq([1], 16),
				Pseq([0.8, 1], 8),  
				Pseq([0.8], 16),
				Pseq([0.8, 0.8, 0.9, 1], 8)
			], inf) * 0.8,
			\atk, Pseq([`[0.1, 1, 0.5]], inf),
			\freq_l, Pseq([
				`[0,900,1000],
//				0, 0, 
//				`[8360,60,120], `[4360,60,120], 0, `[4360,60,120], 0,
//				`[1260,60,110], 0, `[8360,60,120], 0 
			],inf),
			\freq_d, Pseq([`[0.4, 0.04]], inf),
			\fb, Pseq([0], inf),
//			\rel, Pseq([[0.03625, 0.1, 0.035]], inf)
			
		]),
		
		Pbind(*[
			\instrument, \kick2,
			\dur, Pseq([1/2], inf),
			\amp, 0*0.5 * Pseq([
				Pseq([1], 5),
				Pseq([0.8, 1], 8),  
				Pseq([0]*0, 16),
				Pseq([0.8, 0.8, 0.9, 1]*0, 8)
			], inf) * 0.8,
			\atk, Pseq([0.02, 0.02, 1], inf),
			\freq_l, Pseq([ `[10000] ],inf),
			\freq_d, Pseq([[1, 0.04], [0.1, 0.004]], inf),
			\fb, Pseq([1000.3, 0.3], inf),
		
		]),

		
		Pbind(*[
			\instrument, \kick2,
			\dur, Pseq([1/2, 1/4, 1/4, 1/2, Pseq([1/8], 3), 1/8]/2, inf),
			\amp, 0*0.4 * Pseq([
				Pseq([1]*0, 16),
				Pseq([0.8, 1], 8),  
				Pseq([1], 16),
				Pseq([0.8, 0.8, 0.9, 1], 8)
			], inf) * 0.5,
			\freq_l, Pseq([
				`[1260,60,110],
				0, 0, 
				`[4360,60,120], `[8360,60,120], 0, `[4360,60,120], 0,
				`[1260,60,110], 0, `[8360,60,120], 0 
			],inf),
			\freq_d, Pseq([[0.01, 17000]], inf),
			\fb, Pseq([0.3, 0], inf),
			\rel, 0.3,
			\atk, 0.001
			
		])

])).play(TempoClock(60/60), quant:[1]);

//:		

//:	Test_11

SynthDef(\kick, { | dur = 0.15, atk = 0.005, amp = 1, fb = 0, rel = 0.03625 |
	
	Out.ar([0, 1], SinOscFB.ar(
		EnvGen.ar( Env(
			\freq_l.kr([2960, 70, 0]),
			\freq_d.kr([0.07, 0.2]),
			\freq_c.kr([-13]),
		) ), fb,
		amp * EnvGen.ar(
			Env.perc( atk, rel, curve: \amp_c.kr([-1, 6])),
			doneAction: 2
		);	
	))
}).add;

SynthDef(\kick2, { | rel = 0.15, atk = 0.005, amp = 1, fb = 0 |
	
	Out.ar([0, 1], SinOscFB.ar(
		EnvGen.ar( Env(
			\freq_l.kr([2960, 70, 90]),
			\freq_d.kr([0.07, 0.2]),
			\freq_c.kr([-13, -1]),
		) ), fb,
		amp * EnvGen.ar(
			Env.perc( atk, rel - atk/3, curve: \amp_c.kr([-1, 6])),
			doneAction: 2
		);	
	))
}).add;


//:

Pdef(\spssxaxt, 

	Ppar([
	
		Pbind(*[
			\instrument, \kick,
			\dur, Pseq([Pseq([1/2, 1/4, 1/4, 1/2, Pseq([1/4], 3), 1/4], 10)]/2, inf),
			\amp, 0.8 * Pseq([
				
				Pseq([1], 16),
				Pseq([0.8, 1], 8),  
				Pseq([1], 16),
				Pseq([0.8, 0.8, 0.9, 1]*0, 8)
			
			], inf) * 0.8,
			\freq_l, Pseq([
				`[1260,60,110],
				`[0, 0], `[0, 0], 
				`[8360,60,120], `[4360,60,120], `[0, 0], `[4360,60,120], `[0, 0],
				`[1260,60,110], `[0, 0], `[8360,60,120], `[0, 0] 
			],inf),
			\freq_d, Pseq([`[0.07, 0.2]], inf),
			\fb, Pseq([0], inf),
		
		]),
	
		
		Pbind(*[
			\instrument, \kick,
			\dur, Pseq([Pseq([1/2, 1/4, 1/4, 1/2, Pseq([1/8], 3), 1/8], 10)]*2, inf),
			\amp, 0.6 * Pseq([
				
				Pseq([1], 16),
				Pseq([0.8, 1], 8),  
				Pseq([1], 16),
				Pseq([0.8, 0.8, 0.9, 1], 8)
			
			], inf) * 0.8,
			\freq_l, Pseq([
				
				[ [1260, 90, 110], [2260, 90, 110]] ,
/*				

				`[0, 0, 0], `[0, 0, 0], 
				`[8360,60,120], `[4360,60,120], `[0, 0, 0], `[4360,60,120], `[0, 0, 0],
				`[1260,60,110], `[0, 0, 0], `[8360,60,120], `[0, 0, 0] 
*/			],inf),
			\freq_d, Pseq([ `[0.07, 0.02] ], inf),
			\fb, Pseq([0], inf),
		
		]),
		
		Pbind(*[
			\instrument, \kick,
			\dur, Pseq([1/8, 1/4], inf),
			\amp, 1 * Pseq([
			
				Pseq([1, 0], 16),
				Pseq([0.8, 1], 8),  
				Pseq([1], 10),
				Pseq([1, 0.8, 0.5, 1], 10)
			
			], inf) * 0.8,
			\freq_l, Pseq([
			
				`[1260, 60, 110],
			
			],inf),
			\freq_d, Pseq([ [[0.07, 0.2], [0.1, 0.2]] ], inf),
			\fb, Pseq([0], inf),
		
		]),
	
		Pbind(*[
			\instrument, \kick,
			\dur, Pseq([1/8], inf),
			\amp, 0.6 * Pseq([
			
				Pseq([1, 0.5], 2),
				Pseq([0], 8),  
				Pseq([1], 5),
				Pseq([0], 10),
				Pseq([1, 1, 1, 1], 2)
			
			], inf) * 0.8,
			\atk, Pseq([0.02, 0.05, 0.01], inf), 
			\freq_l, Pseq([
			
				[[460, 60, 110], [260, 60, 110]],
			
			],inf),
			\freq_d, Pseq([ [[0.07, 0.2], [0.1, 0.2], [0.001, 1]] ], inf),
			\fb, Pseq([ [0, 1000], [10, 2000], [0, 200], [1, 1200] ], inf),
		
		]),
		
		
		Pbind(*[
			\instrument, \kick,
			\dur, Pseq([1/8], inf),
			\amp, 0*0.3 * Pseq([
			
				Pseq([1, 0.5], 2),
				Pseq([0], 8),  
				Pseq([1], 5),
				Pseq([0], 10),
				Pseq([1, 1, 1, 1], 2)
			
			], inf) * 0.8,
			//\atk, Pseq([0.02, 0.05, 0.001], inf), 
			\freq_l, Pseq([
			
				[ [4060, 600, 110], [2060, 600, 110] ],
			
			],inf),
			\freq_d, Pseq([ [ [0.07, 0.2], [1, 0.2] ] ], inf),
			\fb, Pseq([ [0, 10], [0, 200], [100, 200], [1, 1200] ], inf),
		
		]),
		
		Pbind(*[
			\instrument, \kick,
			\dur, Pseq([1/2], inf),
			\amp, 0.4 * Pseq([
			
				Pseq([1], 1),
				Pseq([0], 2),  
				Pseq([0], 2),
				Pseq([0], 3),
				Pseq([0], 2)
			
			], inf) * 0.8,
			\atk, 10,
			\rel, 2,
			\freq_l, Pseq([
			
				//[10060, 100, 110],
				
//				[1060, 600, 110],
				
				[[460, 60, 110], [260, 600, 110]]//, [2060, 6000, 110], [46, 60, 110], [26, 600, 110], [260, 6000, 110]]
			
			],inf),
			\freq_d, Pseq([ [[0.1, 20], [100, 2]] ], inf),
			\fb, Pseq([ [ 0.2, 1000.3 ] ], inf), //auto apo 100.3 to pigaino 0.3 gamato!
		
		]),

		Pbind(*[
			\instrument, \kick,
			\dur, Pseq([1/8], inf),
			\amp, 0.3 * Pseq([
			
				Pseq([1], 1),
				Pseq([0], 2),  
				Pseq([1], 8),
				Pseq([0], 3),
				Pseq([1], 2)
			
			], inf) * 0.8,
			\atk, 0.002,
			\freq_l, Pseq([
			
				[ [4060, 60, 110], [260, 60, 110] ],
				
				[ [460, 60, 110], [260, 60, 110] ],
//				[[460, 600, 110], [260, 60, 110]],
				
			],inf),
			\freq_d, Pseq([ [  [0.1, 0.1], [0.1, 2] ] ], inf),
			\fb, Pseq([ [100, 200] ], inf),
		
		]),

		
////////////////////////
//===================================	
	
		//Midenisa ta kick2
		Pbind(*[
			\instrument, \kick2,
			\dur, Pseq([Pseq([1/2, 1/4, 1/4, 1/2, Pseq([1/8], 3), 1/8], 10)], inf),
			\amp, 0*0.07 * Pseq([
				Pseq([1], 16),
				Pseq([0.8, 1]*0, 8),  
				Pseq([0], 16),
				Pseq([0.8, 0.8, 0.9, 1]*0, 8)
			], inf) * 0.8,
			\atk, 2,
			\freq_l, Pseq([
				`[1000,100,10],
//				0, 0, 
//				`[8360,60,120], `[4360,60,120], 0, `[4360,60,120], 0,
//				`[1260,60,110], 0, `[8360,60,120], 0 
			],inf),
			\freq_d, Pseq([ [1000.4, 400] ], inf),
			\fb, Pseq([ [0.5, 10000.3, 100, 0] ], inf),
		
		]),
		
		Pbind(*[
			\instrument, \kick,
			\dur, Pseq([Pseq([1/2, 1/4, 1/4, 1/2, Pseq([1/8], 3), 1/8], 10)], inf),
			\amp, 0*0.1 * Pseq([
				Pseq([1], 16),
				Pseq([0.8, 1], 8),  
				Pseq([0.8], 16),
				Pseq([0.8, 0.8, 0.9, 1], 8)
			], inf) * 0.8,
			\atk, Pseq([`[0.1, 1, 0.5]], inf),
			\freq_l, Pseq([
				`[0,900,1000],
//				0, 0, 
//				`[8360,60,120], `[4360,60,120], 0, `[4360,60,120], 0,
//				`[1260,60,110], 0, `[8360,60,120], 0 
			],inf),
			\freq_d, Pseq([`[0.4, 0.04]], inf),
			\fb, Pseq([0], inf),
//			\rel, Pseq([[0.03625, 0.1, 0.035]], inf)
			
		]),
		
		Pbind(*[
			\instrument, \kick2,
			\dur, Pseq([1/2], inf),
			\amp, 0*0.5 * Pseq([
				Pseq([1], 5),
				Pseq([0.8, 1], 8),  
				Pseq([0]*0, 16),
				Pseq([0.8, 0.8, 0.9, 1]*0, 8)
			], inf) * 0.8,
			\atk, Pseq([0.02, 0.02, 1], inf),
			\freq_l, Pseq([ `[10000] ],inf),
			\freq_d, Pseq([[1, 0.04], [0.1, 0.004]], inf),
			\fb, Pseq([1000.3, 0.3], inf),
		
		]),

		
		Pbind(*[
			\instrument, \kick2,
			\dur, Pseq([1/2, 1/4, 1/4, 1/2, Pseq([1/8], 3), 1/8]/2, inf),
			\amp, 0*0.4 * Pseq([
				Pseq([1]*0, 16),
				Pseq([0.8, 1], 8),  
				Pseq([1], 16),
				Pseq([0.8, 0.8, 0.9, 1], 8)
			], inf) * 0.5,
			\freq_l, Pseq([
				`[1260,60,110],
				0, 0, 
				`[4360,60,120], `[8360,60,120], 0, `[4360,60,120], 0,
				`[1260,60,110], 0, `[8360,60,120], 0 
			],inf),
			\freq_d, Pseq([[0.01, 17000]], inf),
			\fb, Pseq([0.3, 0], inf),
			\rel, 0.3,
			\atk, 0.001
			
		])

])).play(TempoClock(60/60), quant:[1]);

//:				
		
