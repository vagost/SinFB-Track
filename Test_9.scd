
//ToDo_Live:

//Na mpoun olla sxedon se rotations, apolita live!, 
//	tha dimiourgithei enas megalos algorithmos pou tha kanei transform tis parametrous tou_kapos san chaos ugens

//H kathe sira apo rotations tha anikei se ena synth-Pbind

//Enas algorithmos se vides...kai i idea sinexizei

//Mporo na metakino olokliro Pbind i Pdef me ta LfoSeq oste na ta taktopoio ston xrono--> na kino oloklores mazes, isos me akeraia 
//	pollaplasia tou enos sto allo

//Mporo na xrisimopoio kai ta sendTags


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

Pdef(\spxpaxt, 

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
			\dur, Pseq([1/4], inf),
			\amp, 0.3 * Pseq([
			
				Pseq([1], 1),
				Pseq([0], 1),  
				Pseq([0], 2),
				Pseq([0], 1),
				Pseq([1], 2)
			
			], inf) * 0.8,
			\atk, 0.07,
			\rel, 0.1,
			\freq_l, Pseq([
			
				[[160, 60, 114], [162, 60, 115]]/2,
				
				[[260, 60, 113], [260, 62, 112], [260, 64, 111], [260, 600, 113], [260, 603, 112], [260, 604, 111]]/3
			
			],inf),
			\freq_d, Pseq([ [[10, 100], [100.4, 2]] ], inf),
			\fb, Pseq([ [0, 0.3] ], inf), //auto apo 100.3 to pigaino 0.3 gamato!
		
		]),

		Pbind(*[
			\instrument, \kick,
			\dur, Pseq([1/8], inf),
			\amp, 0.5 * Pseq([
			
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

SynthDef(\kick2, { | rel = 0.15, atk = 0.005, amp = 1, fb = 0, posp = 0 |
	
	Out.ar(0, Pan2.ar(SinOscFB.ar(
		EnvGen.ar( Env(
			\freq_l.kr([2960, 70, 0]),
			\freq_d.kr([0.07, 0.2]),
			\freq_c.kr([-13, 200]),
		) ), fb,
		amp * EnvGen.ar(
			Env.perc( atk, rel - atk/3, curve: \amp_c.kr([-1, 6])),
			doneAction: 2
		);	
	), posp, 1))
}).add;


//:

Pdef(\sswt, 

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
			\amp, 0.07 * Pseq([
			
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
				
				[[460, 460, 410]/*, [260, 600, 110], [2060, 6000, 110], [46, 60, 110], [160, 60, 110], [260, 6000, 110]*/]
			
			],inf),
			\freq_d, Pseq([ [[0.1, 20], [10000, 2]] ], inf),
			\fb, Pseq([ [ 0.2, 1000.3 ] ], inf), //auto apo 100.3 to pigaino 0.3 gamato!
		
		]),

		Pbind(*[
			\instrument, \kick,
			\dur, Pseq([1/8], inf),
			\amp, 0*0.3 * Pseq([
			
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
			\atk, 1,
			\freq_l, Pseq([
				`[1000,100,10],
//				0, 0, 
//				`[8360,60,120], `[4360,60,120], 0, `[4360,60,120], 0,
//				`[1260,60,110], 0, `[8360,60,120], 0 
			],inf),
			\freq_d, Pseq([ [1000.4, 400] ], inf),
			\fb, Pseq([ [10000.5, 10000.3, 1000, 0] ], inf),
		
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
			\amp, 0.5 * Pseq([
				Pseq([1], 5),
				Pseq([0.8, 1], 8),  
				Pseq([0, 1, 0, 1], 16),
				Pseq([0, 0.8, 0, 1], 8)
			], inf) * 0.8,
			\atk, Pseq([0.02, 0.02, 1], inf),
			\freq_l, Pseq([ [1000, 100, 90] ],inf),
			\freq_d, Pseq([ [0.1, 0.04], [0.001, 0.004] ], inf),
			\fb, Pseq([ 1000.3, 0.3 ], inf),
			\posp, Prand([1, -1], inf),
			\freq_c, Prand([ `[-13, 200], `[-13, 2] ], inf)
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
		
//:	Test_12

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

SynthDef(\kick2, { | rel = 0.15, atk = 0.005, amp = 1, fb = 0, posp = 0 |
	
	Out.ar(0, Pan2.ar(SinOscFB.ar(
		EnvGen.ar( Env(
			\freq_l.kr([2960, 70, 90]),
			\freq_d.kr([0.07, 0.2]),
			\freq_c.kr([-13, -1]),
		) ), fb,
		amp * EnvGen.ar(
			Env.perc( atk, rel - atk/3, curve: \amp_c.kr([-1, 6])),
			doneAction: 2
		);	
	), posp, 1))
}).add;


//:

Pdef(\xwsst, 

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
			\amp, 0.7 * Pseq([
			
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
			\amp, 0*0.7 * Pseq([
			
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
			\amp, 0.07 * Pseq([
			
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
				
				[[460, 460, 410]/*, [260, 600, 110], [2060, 6000, 110], [46, 60, 110], [160, 60, 110], [260, 6000, 110]*/]
			
			],inf),
			\freq_d, Pseq([ [[0.01, 200], [1000, 2]] ], inf),
			\fb, Pseq([ [ 0.2, 1000.3, 0 ] ], inf), //auto apo 100.3 to pigaino 0.3 gamato!
		
		]),

		Pbind(*[
			\instrument, \kick,
			\dur, Pseq([1/8], inf),
			\amp, 0.5 * Pseq([
			
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
			\amp, 0.07 * Pseq([
				Pseq([1], 16),
				Pseq([0.8, 1]*0, 8),  
				Pseq([0], 16),
				Pseq([0.8, 0.8, 0.9, 1]*0, 8)
			], inf) * 0.8,
			\atk, 1,
			\freq_l, Pseq([
				`[1000,100,10],
//				0, 0, 
//				`[8360,60,120], `[4360,60,120], 0, `[4360,60,120], 0,
//				`[1260,60,110], 0, `[8360,60,120], 0 
			],inf),
			\freq_d, Pseq([ [1000.4, 400] ], inf),
			\fb, Pseq([ [10000.5, 10000.3, 1000, 0] ], inf),
		
		]),
		
		
//1
		Pbind(*[
			\instrument, \kick2,
			\dur, Pseq([1/4, 1/2], inf),
			\amp, 0.4 * Pseq([
				Pseq([1], 5),
				Pseq([0.8, 1], 8),  
				Pseq([0, 1, 0, 1], 16),
				Pseq([0, 0.8, 0, 1], 8)
			], inf) * 0.8,
			\atk, Pseq([0.002, 0.02, 0.2, 0.001], inf),
			\freq_l, Pseq([ [1000, 100, 90] ],inf),
			\freq_d, Pseq([ [0.1, 0.04], [0.001, 0.004], [2000, 400] ], inf),
			\fb, Pseq([1000.3, 0.3, [100, 100000]], inf),
			\posp, Prand([1, -1], inf)
		
		]),

//2			
		Pbind(*[
			\instrument, \kick2,
			\dur, Pseq([1/4], inf),
			\amp, 0.8 * Pseq([
				Pseq([1], 5),
				Pseq([0.8, 1], 8),  
				Pseq([1, 1], 16),
				Pseq([0.8, 1], 8)
			], inf) * 0.8,
			\atk, Pseq([ [0.002, 0.1], [0.02, 0.1], [0.2, 0.1], [0.001, 1]], inf),
			\freq_l, Prand([ [1000, 100, 90, 9000, [90, 20000]] ],inf),
			\freq_d, Pseq([ [0.1, 0.04], [0.001, 0.004], [2000, 400] ], inf),
			\fb, Prand([1000.3, 0.3, [100, 10000], 100, 0.001], inf),
			\posp, Prand([1, -1], inf)
		
		]),
		
		
		Pbind(*[
			\instrument, \kick2,
			\dur, Pseq([1/2, 1/4, 1/4, 1/2, Pseq([1/8], 3), 1/8]/2, inf),
			\amp, 0*0.8 * Pseq([
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

//:TEST_13

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

SynthDef(\kick2, { | rel = 0.15, atk = 0.005, amp = 1, fb = 0, pop = 0 |
	
	Out.ar(0, Pan2.ar(SinOscFB.ar(
		EnvGen.ar( Env(
			\freq_l.kr([2960, 70, 0]),
			\freq_d.kr([0.07, 0.2]),
			\freq_c.kr([-13, 20]),
		) ), fb,
		amp * EnvGen.ar(
			Env.perc( atk, rel/3, curve: \amp_c.kr([-1, 6])),
			doneAction: 2
		);	
	), pop))
}).add;


		
//:Pattern
//TODO: Oles oi sixnotites na prokiptoun me vasi mia klimaka, mesa sto pitch bend i proti nota mia klimaka i deuteri mia alli ktl
//Note: Otan xekinaei to teleutaio kai meta mpainei to proteleutaio gamato

Pdef(\spwsat, 

	Ppar([
	
		Pbind(*[
			\instrument, \kick,
			\dur, Pseq([Pseq([1/2, 1/4, 1/4, 1/2, Pseq([1/4], 3), 1/4], 10)], inf),
			\amp, 0.3 * Pseq([
				
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
			\amp, 0.7 * Pseq([
				
				Pseq([1], 16),
				Pseq([0.8, 1], 8),  
				Pseq([1], 16),
				Pseq([0.8, 0.8, 0.9, 1], 8)
			
			], inf) * 0.8,
			\freq_l, Pseq([
				
				[ [1260, 90, 1010], [2260, 90, 110]] ,
/*				

				`[0, 0, 0], `[0, 0, 0], 
				`[8360,60,120], `[4360,60,120], `[0, 0, 0], `[4360,60,120], `[0, 0, 0],
				`[1260,60,110], `[0, 0, 0], `[8360,60,120], `[0, 0, 0] 
*/			],inf),
			\freq_d, Pseq([ `[0.07, 0.2] ], inf),
			\fb, Pseq([0], inf),
		
		]),
		
		Pbind(*[
			\instrument, \kick,
			\dur, Pseq([1/4, 1/2], inf),
			\amp, 1 * Pseq([
			
				Pseq([1, 0], 16),
				Pseq([0.8, 1], 8),  
				Pseq([1], 10),
				Pseq([1, 0.8, 0.5, 1], 10)
			
			], inf) * 0.8,
			\freq_l, Pseq([
			
				`[160, 40, 1000],
			
			],inf),
			\freq_d, Pseq([ [[0.07, 0.2]] ], inf),
			\fb, Pseq([0], inf),
		
		]),
	
		Pbind(*[
			\instrument, \kick,
			\dur, Pseq([1/8], inf),
			\amp, 0*0.5 * Pseq([
			
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
			\dur, Pseq([1/2], inf),
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
			\freq_d, Pseq([ [ [1000.07, 0.2], [100, 0.2], [0.07, 20] ] ], inf),
			\fb, Pseq([ [0, 10], [0, 200], [100, 200], [1, 1200] ], inf),
		
		]),
		
		Pbind(*[
			\instrument, \kick,
			\dur, Pseq([1/2], inf),
			\amp, 0.07 * Pseq([
			
				Pseq([1], 1),
				Pseq([0], 2),  
				Pseq([1], 2),
				Pseq([0], 3),
				Pseq([1], 2)
			
			], inf) * 0.8,
			\atk, 10,
			\rel, 2,
			\freq_l, Pseq([
			
				[[460, 60, 110], [260, 60, 110]],
			
			],inf),
			\freq_d, Pseq([ [[1000.7, 10], [10.4, 20]] ], inf),
			\fb, Pseq([ [0.3, 0.2] ], inf),
		
		]),
		
		Pbind(*[
			\instrument, \kick,
			\dur, Pseq([1/8], inf),
			\amp, 0.04 * Pseq([
			
				Pseq([1], 1),
				Pseq([0], 2),  
				Pseq([1], 2),
				Pseq([0], 3),
				Pseq([1], 2)
			
			], inf) * 0.8,
			\atk, 10,
			\rel, 2,
			\freq_l, Pseq([
			
				[[1460, 60, 110], [2060, 16000, 1010]],
			
			],inf),
			\freq_d, Pseq([ [[1000.7, 10], [1000.4, 20]] ], inf),
			\fb, Pseq([ [0.3, 1000.2] ], inf),
		
		]),

		Pbind(*[
			\instrument, \kick2,
			\dur, Pseq([Pseq([1/8], 10), Pseq([1/8, 1/4], 15)], inf),
			\amp, 0.6 * Pseq([
			
				Pseq([1], 10),
				Pseq([0], 2),  
				Pseq([1], 8),
				Pseq([0], 3),
				Pseq([1], 2)
			
			], inf) * 0.8,
			\atk, Prand([ 0.02, 0.01, 0.1, [0.001, 0.01, 0.1] ], inf),
			\freq_l, Prand([
			
				[ [460, 60, 110], [260, 60, 110] ],
				[ [460, 600, 110], [2060, 60, 110] ],
				
			],inf),
			\freq_d, Prand([ [  [0.01, 0.1], [1000, 20],  [0.1, 0.1], [10, 20] ] ], inf),
			\fb, Prand([ [100, 2000], [30, 0], 0, 100, 30, 20, 40, 1000 ], inf),
			\pop, Prand([-1, 1, 0], inf)
		]),

		
////////////////////////
//===================================	
	
		//Midenisa ta kick2
		Pbind(*[
			\instrument, \kick2,
			\dur, Pseq([Pseq([1/2, 1/4, 1/4, 1/2, Pseq([1/8], 3), 1/8], 10)], inf),
			\amp, 0.1 * Pseq([
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
			\fb, Pseq([0.5, 10000.3, 100, 0], inf),
		
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
			\dur, Pseq([1/2, 1/4, 1/4, 1/2, Pseq([1/8], 3), 1/8]/2, inf),
			\amp, 0*0.2 * Pseq([
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

//:	Test_14

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

SynthDef(\kick2, { | rel = 0.15, atk = 0.005, amp = 1, fb = 0, posp = 0 |
	
	Out.ar(0, Pan2.ar(SinOscFB.ar(
		EnvGen.ar( Env(
			\freq_l.kr([2960, 70, 90]),
			\freq_d.kr([0.07, 0.2]),
			\freq_c.kr([-13, -1]),
		) ), fb,
		amp * EnvGen.ar(
			Env.perc( atk, rel - atk/3, curve: \amp_c.kr([-1, 6])),
			doneAction: 2
		);	
	), posp, 1))
}).add;


//:

Pdef(\x141C, 

	Ppar([
	
		Pbind(*[
			\instrument, \kick,
			\dur, Pseq([Pseq([1/2, 1/4, 1/4, 1/2, Pseq([1/8], 3), 1/8], 10)]*2, inf),
			\amp, 0.2 * Pseq([
				
				Pseq([1], 16),
				Pseq([0.8, 1], 8),  
				Pseq([1], 16),
				Pseq([0.8, 0.8, 0.9, 1], 8)
			
			], inf) * 0.8,
			\freq_l, Pseq([

				[ [1260, 90, 110], [2260, 90, 110] ],

			],inf),
			\freq_d, Pseq([ `[0.07, 0.02] ], inf),
			\fb, Pseq([0], inf),
		
		]),
		
		Pbind(*[
			\instrument, \kick,
			\dur, Pseq([Pseq([1/8, 1/16, 1/8, 1/8, 1/16, 1/16, 1/16, 1/16], 10)]*2, inf),
			\amp, 0.1 * Pseq([
				
				Pseq([1, 0, 1, 1, 1, 1, 0, 1], inf),
			
			], inf) * 0.8,
			\freq_l, Pseq([
				
				[ [1260, 90, 110], [2260, 90, 110] ] ,

			],inf),
			\freq_d, Pseq([ `[0.07, 0.02] ], inf),
			\fb, Pseq([0], inf),
		
		]),
		
		Pbind(*[
			\instrument, \kick,
			\dur, Pseq([1/8, 1/4], inf),
			\amp, 0.1 * Pseq([
			
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
			\amp, 0*0.2 * Pseq([
			
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
			\amp, 0*0.7 * Pseq([
			
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
			\amp, 0*0.03 * Pseq([
			
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
				
				[[460, 460, 464]/*, [260, 600, 110], [2060, 6000, 110], [46, 60, 110], [160, 60, 110], [260, 6000, 110]*/]
			
			],inf),
			\freq_d, Pseq([ [ [1, 2], [1000, 20] ] ], inf),
			\fb, Pseq([ [ 0.2, 100.3, 0 ] ], inf), //auto apo 100.3 to pigaino 0.3 gamato!
		
		]),

		Pbind(*[
			\instrument, \kick,
			\dur, Pseq([1/8], inf),
			\amp, 0*0.2 * Pseq([
			
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
			\dur, Pseq([Pseq([1/2, 1/8, 1/8, 1/2, Pseq([1/8], 3), 1/8], 10)]/2, inf),
			\amp, 0.07 * Pseq([
				Pseq([1], 16),
				Pseq([0.8, 1]*0, 8),  
				Pseq([0], 16),
				Pseq([0.8, 0.8, 0.9, 1]*0, 8)
			], inf) * 0.8,
			\atk, Pseq([0.01, 0.01], inf),
//			\rel, Pseq([0.02, 0.1], inf),
			\freq_l, Pseq([
				`[ 10000, 10000, 20000],
			],inf),
			\freq_d, Pseq([ [400, 40] ], inf),
			\fb, Pseq([ [100.5, 1000.3, 1000, 2] ], inf),
		
		]),
		
		
//1
		Pbind(*[
			\instrument, \kick2,
			\dur, Pseq([1/4, 1/2], inf),
			\amp, 0*0.2 * Pseq([
				Pseq([1], 5),
				Pseq([0.8, 1], 8),  
				Pseq([0, 1, 0, 1], 16),
				Pseq([0, 0.8, 0, 1], 8)
			], inf) * 0.8,
			\atk, Pseq([0.002, 0.02, 0.2, 0.001], inf),
			\freq_l, Pseq([ [1000, 100, 90] ],inf),
			\freq_d, Pseq([ [0.1, 0.04], [0.001, 0.004], [2000, 400] ], inf),
			\fb, Pseq([1000.3, 0.3, [100, 100000]], inf),
			\posp, Prand([1, -1], inf)
		
		]),

//2			
		Pbind(*[
			\instrument, \kick2,
			\dur, Pseq([1/4], inf),
			\amp, 0*0.1 * Pseq([
				Pseq([1], 5),
				Pseq([0.8, 1], 8),  
				Pseq([1, 1], 16),
				Pseq([0.8, 1], 8)
			], inf) * 0.8,
			\atk, Pseq([ [0.002, 0.1], [0.02, 0.1], [0.2, 0.1], [0.001, 1]], inf),
			\freq_l, Prand([ [1000, 100, 90, 9000, [90, 20000]] ],inf),
			\freq_d, Pseq([ [0.1, 0.04], [0.001, 0.004], [2000, 400] ], inf),
			\fb, Prand([1000.3, 0.3, [100, 10000], 100, 0.001], inf),
			\posp, Prand([1, -1], inf)
		
		]),
		
		
		Pbind(*[
			\instrument, \kick2,
			\dur, Pseq([1/2, 1/4, 1/4, 1/2, Pseq([1/8], 3), 1/8]/2, inf),
			\amp, 0*0.3 * Pseq([
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
t = TempoClock.new;
t.tempo = 1


//:	Test_15

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

SynthDef(\kick2, { | rel = 0.15, atk = 0.005, amp = 1, fb = 0, posp = 0 |
	
	Out.ar(0, Pan2.ar(SinOscFB.ar(
		EnvGen.ar( Env(
			\freq_l.kr([2960, 70, 90]),
			\freq_d.kr([0.07, 0.2]),
			\freq_c.kr([-13, -1]),
		) ), fb,
		amp * EnvGen.ar(
			Env.perc( atk, rel - atk/3, curve: \amp_c.kr([-1, 6])),
			doneAction: 2
		);	
	), posp, 1))
}).add;


//:

Pdef(\x14sow4C, 

	Ppar([
	
		Pbind(*[
			\instrument, \kick,
			\dur, Pseq([Pseq([1/8, 1/4, 1/2, 1/4, Pseq([1/8], 3), 1/2, 1/8], 10)]*2, inf),
			\amp, 0.2 * Pseq([
				
				Pseq([1], 16),
				Pseq([0.8, 1], 8),  
				Pseq([1], 16),
				Pseq([0.8, 0.8, 0.9, 1], 8)
			
			], inf) * 0.8,
			\freq_l, Pseq([

				[ [1260, 90, 110], [2260, 90, 110] ],

			],inf),
			\freq_d, Pseq([ `[0.07, 0.02] ], inf),
			\fb, Pseq([0], inf),
		
		]),
		
		Pbind(*[
			\instrument, \kick,
			\dur, Pseq([Pseq([1/8, 1/16, 1/8, 1/8, 1/16, 1/16, 1/16, 1/16, 1/8], 10)]*2, inf),
			\amp, 0.1 * Pseq([
				
				Pseq([1, 0, 1, 1, 1, 1, 0, 1], inf),
			
			], inf) * 0.8,
			\freq_l, Pseq([
				
				[ [1260, 90, 110], [2260, 90, 110] ] ,

			],inf),
//			\atk, 0.001,
//			\rel, 0.002,
			\freq_d, Pseq([ `[0.07, 0.02] ], inf),
			\fb, Pseq([0], inf),
		
		]),
		
		Pbind(*[
			\instrument, \kick,
			\dur, Pseq([1/8, 1/4], inf),
			\amp, 0.1 * Pseq([
			
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
			\amp, 0.2 * Pseq([
			
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
			\amp, 0*0.7 * Pseq([
			
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
			\dur, Pseq([1], inf),
			\amp, 0.02 * Pseq([
			
			[1, 1]
			
			], inf) * 0.8,
			\atk, 1,
			\rel, 1,
			\freq_l, Pseq([
					
					[ [~c_4, ~e_4, ~d_4], [~f_3, ~g_3, ~a_3] ]/2,
					[ [~c_4, ~e_4, ~d_4], [~f_3, ~g_3, ~a_3] ] //, ~d_2, ~e_2, ~f_2, ~g_2, ~a_2, ~b_2			

			],inf),
			\amp_c, [-1, -1],
//			\freq_c, Pseq([ [-1, -1] ], inf),
			\freq_d, Pseq([ `[ 0.07, 0.07] ], inf),
			\fb, Pseq([ [0.3, 120] ], inf), //auto apo 100.3 to pigaino 0.3 gamato!
		
		]),

		Pbind(*[
			\instrument, \kick,
			\dur, Pseq([1/4, 1/8], inf),
			\amp, 0.1 * Pseq([
			
				Pseq([1], 1),
				Pseq([0], 2),  
				Pseq([1], 8),
				Pseq([0], 3),
				Pseq([1], 2)
			
			], inf) * 0.8,
			\atk, 0.002,
			\freq_l, Pseq([
			
				[ [~b_7, 60, 110], [260, 60, 110] ],
				
				[ [~g_4, 60, 110], [260, 60, 110] ],
//				[[460, 600, 110], [260, 60, 110]],
				
			],inf),
			\freq_d, Pseq([ [  [0.1, 0.1], [0.1, 2] ] ], inf),
			\fb, Pseq([ [100, 200, 1000] ], inf),
		
		]),

		
////////////////////////	
//===================================	
	
		//Midenisa ta kick2
		Pbind(*[
			\instrument, \kick2,
			\dur, Pseq([Pseq([1/2, 1/8, 1/8, 1/2, Pseq([1/8], 3), 1/8], 10)]/2, inf),
			\amp, 0.1 * Pseq([
				Pseq([1], 16),
				Pseq([0.8, 1]*0, 8),  
				Pseq([0], 16),
				Pseq([0.8, 0.8, 0.9, 1]*0, 8)
			], inf) * 0.8,
			\atk, Pseq([0.01, 0.01], inf),
//			\rel, Pseq([0.02, 0.1], inf),
			\freq_l, Pseq([
				`[ 10000, 10000, 20000],
			],inf),
			\freq_d, Pseq([ [400, 40] ], inf),
			\fb, Pseq([ [100.5, 1000.3, 1000, 2] ], inf),
		
		]),
		
		
//1
		Pbind(*[
			\instrument, \kick2,
			\dur, Pseq([1], inf),
			\amp, 0.13 * Pseq([
				Pseq([1], 5),
				Pseq([0.8, 1], 8),  
				Pseq([0, 1, 0, 1], 16),
				Pseq([0, 0.8, 0, 1], 8)
			], inf) * 0.8,
			\atk, Pseq([0.002, 0.02, 0.2, 0.001], inf),
			\freq_l, Pseq([ [1000, 100, 90] ],inf),
			\freq_d, Pseq([ [0.1, 0.04], [0.001, 0.004], [2000, 400] ], inf),
			\fb, Pseq([1000.3, 0.3, [100, 100000]], inf),
			\posp, Prand([1, -1], inf)
		
		]),

//2			
		Pbind(*[
			\instrument, \kick2,
			\dur, Pseq([1], inf),
			\amp, 0.2 * Pseq([
				Pseq([1], 5),
				Pseq([0.8, 1], 8),  
				Pseq([1, 1], 16),
				Pseq([0.8, 1], 8)
			], inf) * 0.8,
			\atk, Pseq([ [0.002, 0.1], [0.02, 0.1], [0.2, 0.1], [0.001, 1]], inf),
			\freq_l, Prand([ [1000, 100, 90, 9000, [90, 20000]] ],inf),
			\freq_d, Pseq([ [0.1, 0.04], [0.001, 0.004], [2000, 400] ], inf),
			\fb, Prand([1000.3, 0.3, [100, 10000], 100, 0.001], inf),
			\posp, Prand([1, -1], inf)
		
		]),
		
		
		Pbind(*[
			\instrument, \kick2,
			\dur, Pseq([1/2, 1/4, 1/4, 1/2, Pseq([1/8], 3), 1/8]/2, inf),
			\amp, 0*0.3 * Pseq([
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
t = TempoClock.new;
t.tempo = 

//:	Test_16_New_

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

SynthDef(\kick2, { | rel = 0.15, atk = 0.005, amp = 1, fb = 0, posp = 0 |
	
	Out.ar(0, Pan2.ar(SinOscFB.ar(
		EnvGen.ar( Env(
			\freq_l.kr([2960, 70, 90]),
			\freq_d.kr([0.07, 0.2]),
			\freq_c.kr([-13, -1]),
		) ), fb,
		amp * EnvGen.ar(
			Env.perc( atk, rel - atk/3, curve: \amp_c.kr([-1, 6])),
			doneAction: 2
		);	
	), posp, 1))
}).add;


//:

Pdef(\xwsss4sst, 

	Ppar([
	
		Pbind(*[
			\instrument, \kick,
			\dur, Pseq([Pseq([1/2, 1/4, 1/4, 1/2, Pseq([1/4], 3), 1/4, 1/8], 10)]/2, inf),
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
			\dur, Pseq([Pseq([1/2, 1/4, 1/4, 1/2, Pseq([1/8], 3), 1/8, 1/8], 10)]*2, inf),
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
			\fb, Pseq([100], inf),
		
		]),
		
		Pbind(*[
			\instrument, \kick,
			\dur, Pseq([Pseq([1/2, 1/4, 1/4, 1/2, Pseq([1/8], 3), 1/8, 1/8], 10)]/2, inf),
			\amp, 1 * Pseq([
				
				Pseq([1], 16),
				Pseq([0.8, 1], 8),  
				Pseq([1], 16),
				Pseq([0.8, 0.8, 0.9, 1], 8)
			
			], inf) * 0.8,
			\atk, 0.007,
			\rel, 0.002,
			\freq_l, Pseq([
				
				[ [1260, 90, 110], [2260, 90, 110] ]*10 ,
/*				

				`[0, 0, 0], `[0, 0, 0], 
				`[8360,60,120], `[4360,60,120], `[0, 0, 0], `[4360,60,120], `[0, 0, 0],
				`[1260,60,110], `[0, 0, 0], `[8360,60,120], `[0, 0, 0] 
*/			],inf),
			\freq_d, Pseq([ `[1.07, 100.02] ], inf),
			\fb, Pseq([100], inf),
		
		]),
		
		Pbind(*[
			\instrument, \kick,
			\dur, Pseq([1/8], inf),
			\amp, 0.7 * Pseq([
			
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
			\dur, Pseq([1/8, 1/4], inf),
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
			\dur, Pseq([1/8, 1/4, 1/8], inf),
			\amp, 0*0.7 * Pseq([
			
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
			\dur, Pseq([1/2, 1/8, 1/4], inf),
			\amp, 0.04 * Pseq([
			
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
				
				[[460, 460, 410]/*, [260, 600, 110], [2060, 6000, 110], [46, 60, 110], [160, 60, 110], [260, 6000, 110]*/]
			
			],inf),
			\freq_d, Pseq([ [[0.01, 200], [10, 200]] ], inf),
			\fb, Pseq([ [ 0.2, 100.3, 100 ] ], inf), //auto apo 100.3 to pigaino 0.3 gamato!
		
		]),

		Pbind(*[
			\instrument, \kick,
			\dur, Pseq([1/8, 1/8, 1/8], inf),
			\amp, 0.5 * Pseq([
			
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
			\amp, 0.07 * Pseq([
				Pseq([1], 16),
				Pseq([0.8, 1]*0, 8),  
				Pseq([0], 16),
				Pseq([0.8, 0.8, 0.9, 1]*0, 8)
			], inf) * 0.8,
			\atk, 1,
			\freq_l, Pseq([
				`[1000,100,10],
//				0, 0, 
//				`[8360,60,120], `[4360,60,120], 0, `[4360,60,120], 0,
//				`[1260,60,110], 0, `[8360,60,120], 0 
			],inf),
			\freq_d, Pseq([ [1000.4, 400] ], inf),
			\fb, Pseq([ [10000.5, 10000.3, 1000, 0] ], inf),
		
		]),
		
		
//1
		Pbind(*[
			\instrument, \kick2,
			\dur, Pseq([1/4, 1/2, 1/8, 1/8], inf),
			\amp, 0.4 * Pseq([
				Pseq([1], 5),
				Pseq([0.8, 1], 8),  
				Pseq([0, 1, 0, 1], 16),
				Pseq([0, 0.8, 0, 1], 8)
			], inf) * 0.8,
			\atk, Pseq([0.002, 0.02, 0.2, 0.001], inf),
			\freq_l, Pseq([ [1000, 100, 90] ],inf),
			\freq_d, Pseq([ [0.1, 0.04], [0.001, 0.004], [2000, 400] ], inf),
			\fb, Pseq([1000.3, 0.3, [100, 100000]], inf),
			\posp, Prand([1, -1], inf)
		
		]),

//2			
		Pbind(*[
			\instrument, \kick2,
			\dur, Pseq([1/4, 1/8, 1/8], inf),
			\amp, 0.8 * Pseq([
				Pseq([1], 5),
				Pseq([0.8, 1], 8),  
				Pseq([1, 1], 16),
				Pseq([0.8, 1], 8)
			], inf) * 0.8,
			\atk, Pseq([ [0.002, 0.1], [0.02, 0.1], [0.2, 0.1], [0.001, 1]], inf),
			\freq_l, Prand([ [1000, 100, 90, 9000, [90, 20000]] ],inf),
			\freq_d, Pseq([ [0.1, 0.04], [0.001, 0.004], [2000, 400] ], inf),
			\fb, Prand([1000.3, 0.3, [100, 10000], 100, 0.001], inf),
			\posp, Prand([1, -1], inf)
		
		]),
		
		
		Pbind(*[
			\instrument, \kick2,
			\dur, Pseq([1/2, 1/4, 1/4, 1/2, Pseq([1/8], 3), 1/8]/2, inf),
			\amp, 0*0.8 * Pseq([
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

//:	Test_17

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

SynthDef(\kick2, { | rel = 0.15, atk = 0.005, amp = 1, fb = 0, posp = 0 |
	
	Out.ar(0, Pan2.ar(SinOscFB.ar(
		EnvGen.ar( Env(
			\freq_l.kr([2960, 70, 90]),
			\freq_d.kr([0.07, 0.2]),
			\freq_c.kr([-13, -1]),
		) ), fb,
		amp * EnvGen.ar(
			Env.perc( atk, rel - atk/3, curve: \amp_c.kr([-1, 6])),
			doneAction: 2
		);	
	), posp, 1))
}).add;


//:

Pdef(\x14sow4C, 

	Ppar([
	
		Pbind(*[
			\instrument, \kick,
			\dur, Pseq([Pseq([1/8, 1/4, 1/2, 1/4, Pseq([1/8], 3), 1/2, 1/8], 10)]*2, inf),
			\amp, 0.2 * Pseq([
				
				Pseq([1], 16),
				Pseq([0.8, 1], 8),  
				Pseq([1], 16),
				Pseq([0.8, 0.8, 0.9, 1], 8)
			
			], inf) * 0.8,
			\freq_l, Pseq([

				[ [1260, 90, 110], [2260, 90, 110] ],

			],inf),
			\freq_d, Pseq([ `[0.07, 0.02] ], inf),
			\fb, Pseq([0], inf),
		
		]),
		
		Pbind(*[
			\instrument, \kick,
			\dur, Pseq([Pseq([1/8, 1/16, 1/8, 1/8, 1/16, 1/16, 1/16, 1/16, 1/8], 10)]*2, inf),
			\amp, 0.1 * Pseq([
				
				Pseq([1, 0, 1, 1, 1, 1, 0, 1], inf),
			
			], inf) * 0.8,
			\freq_l, Pseq([
				
				[ [1260, 90, 110], [2260, 90, 110] ] ,

			],inf),
//			\atk, 0.001,
//			\rel, 0.002,
			\freq_d, Pseq([ `[0.07, 0.02] ], inf),
			\fb, Pseq([0], inf),
		
		]),
		
		Pbind(*[
			\instrument, \kick,
			\dur, Pseq([Pseq([1/16, 1/8, 1/16, 1/8, 1/16, 1/8, 1/16, 1/16, 1/8], 10)]*2, inf),
			\amp, 0.1 * Pseq([
				
				Pseq([0, 1, 1, 0, 1, 1, 1, 0], inf),
			
			], inf) * 0.8,
			\freq_l, Pseq([
				
				[ [1260, 90, 110], [2260, 90, 110] ] ,

			],inf),
//			\atk, 0.001,
//			\rel, 0.002,
			\freq_d, Pseq([ `[0.07, 0.02] ], inf),
			\fb, Pseq([0], inf),
		
		]),///////////
		
		
		
		Pbind(*[
			\instrument, \kick,
			\dur, Pseq([1/8, 1/4], inf),
			\amp, 0.1 * Pseq([
			
				Pseq([1, 0], 16),
				Pseq([0.8, 1], 8),  
				Pseq([1], 10),
				Pseq([1, 0.8, 0.5, 1], 10)
			
			], inf) * 0.8,
			\freq_l, Pseq([
			
				`[ 1260, 60, 110 ],
			
			],inf),
			\freq_d, Pseq([ [[0.07, 0.2], [0.1, 0.2]] ], inf),
			\fb, Pseq([0], inf),
		
		]),
	
		Pbind(*[
			\instrument, \kick,
			\dur, Pseq([1/8], inf),
			\amp, 0.2 * Pseq([
			
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
			\amp, 0*0.7 * Pseq([
			
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
			\dur, Pseq([1], inf),
			\amp, 0.02 * Pseq([
			
			[1, 1]
			
			], inf) * 0.8,
			\atk, 2,
			\rel, 1,
			\freq_l, Pseq([
					
					[ [~c_4, ~e_4, ~d_4], [~f_3, ~g_3, ~a_3] ]/2,
					[ [~c_4, ~e_4, ~d_4], [~f_3, ~g_3, ~a_3] ] 			

			],inf),
			\amp_c, [-1, -1],
//			\freq_c, Pseq([ [-1, -1] ], inf),
			\freq_d, Pseq([ [ 0.07, 0.07], [ 10, 0.07] ], inf),
			\fb, Pseq([ [0.3, 120, 0] ], inf), //auto apo 100.3 to pigaino 0.3 gamato!
		
		]),

		Pbind(*[
			\instrument, \kick,
			\dur, Pseq([1/4, 1/8], inf),
			\amp, 0.1 * Pseq([
			
				Pseq([1], 1),
				Pseq([0], 2),  
				Pseq([1], 8),
				Pseq([0], 3),
				Pseq([1], 2)
			
			], inf) * 0.8,
			\atk, 0.002,
			\freq_l, Pseq([
			
				[ [~b_7, 60, 110], [260, 60, 110] ],
				
				[ [~g_4, 60, 110], [260, 60, 110] ],
//				[[460, 600, 110], [260, 60, 110]],
				
			],inf),
			\freq_d, Pseq([ [  [0.1, 0.1], [0.1, 2] ] ], inf),
			\fb, Pseq([ [100, 200, 1000] ], inf),
		
		]),

		
////////////////////////	
//===================================	
	
		//Midenisa ta kick2
		Pbind(*[
			\instrument, \kick2,
			\dur, Pseq([Pseq([1/2, 1/8, 1/8, 1/2, Pseq([1/8], 3), 1/8], 10)]/2, inf),
			\amp, 0.1 * Pseq([
				Pseq([1], 16),
				Pseq([0.8, 1]*0, 8),  
				Pseq([0], 16),
				Pseq([0.8, 0.8, 0.9, 1]*0, 8)
			], inf) * 0.8,
			\atk, Pseq([0.01, 0.01], inf),
//			\rel, Pseq([0.02, 0.1], inf),
			\freq_l, Pseq([
				`[ 10000, 10000, 20000],
			],inf),
			\freq_d, Pseq([ [400, 40] ], inf),
			\fb, Pseq([ [100.5, 1000.3, 1000, 2] ], inf),
		
		]),
		
		
//1
		Pbind(*[
			\instrument, \kick2,
			\dur, Pseq([1], inf),
			\amp, 0.13 * Pseq([
				Pseq([1], 5),
				Pseq([0.8, 1], 8),  
				Pseq([0, 1, 0, 1], 16),
				Pseq([0, 0.8, 0, 1], 8)
			], inf) * 0.8,
			\atk, Pseq([0.002, 0.02, 0.2, 0.001], inf),
			\freq_l, Pseq([ [1000, 100, 90] ],inf),
			\freq_d, Pseq([ [0.1, 0.04], [0.001, 0.004], [2000, 400] ], inf),
			\fb, Pseq([1000.3, 0.3, [100, 100000]], inf),
			\posp, Prand([1, -1], inf)
		
		]),

//2			
		Pbind(*[
			\instrument, \kick2,
			\dur, Pseq([1], inf),
			\amp, 0.2 * Pseq([
				Pseq([1], 5),
				Pseq([0.8, 1], 8),  
				Pseq([1, 1], 16),
				Pseq([0.8, 1], 8)
			], inf) * 0.8,
			\atk, Pseq([ [0.002, 0.1], [0.02, 0.1], [0.2, 0.1], [0.001, 1]], inf),
			\freq_l, Prand([ [1000, 100, 90, 9000, [90, 20000]] ],inf),
			\freq_d, Pseq([ [0.1, 0.04], [0.001, 0.004], [2000, 400] ], inf),
			\fb, Prand([1000.3, 0.3, [100, 10000], 100, 0.001], inf),
			\posp, Prand([1, -1], inf)
		
		]),
		
		
		Pbind(*[
			\instrument, \kick2,
			\dur, Pseq([1/2, 1/4, 1/4, 1/2, Pseq([1/8], 3), 1/8]/2, inf),
			\amp, 0*0.3 * Pseq([
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

