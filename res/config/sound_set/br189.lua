local soundsetutil = require "soundsetutil"

function data()

local data = soundsetutil.makeSoundSet()
		
soundsetutil.addTrackParam01
(data, "vehicle/train/br189/idle.wav", 25.0,
		{
			{ 0.0, 1.0 },
			{ 0.01, 1.0 },
			{ 0.1, 0.0 } },
		{
			{ 0.0, 1.0 },
			{ 1.0, 1.0 } }, 
		"speed01")

		
soundsetutil.addTrackParam01
(data, "vehicle/train/br189/fahrt.wav", 25.0,
		{
			{ 0.00, 0.0},
			{ 0.01, 0.0},
			{ 0.10, 0.8},
			{ 0.279, 1.0},
			{ 0.28, 0.0},
			{ 1.00, 0.0},
			
		},
		{
			{ 0.0, 0.9 }, 
			{ 1.0, 1.0 } 
		}, 
		"speed01")	
		
		
soundsetutil.addTrackParam01
(data, "vehicle/train/br189/fahrt2.wav", 25.0,
		{
			{ 0.00, 0.0},
			{ 0.01, 0.0},
			{ 0.279,0.0},
			{ 0.28, 1.1},
			{ 1.00, 1.3},
			
		},
		{
			{ 0.0, 1.1 }, 
			{ 1.0, 1.3 } 
		}, 
		"speed01")
		
soundsetutil.addEvent(data, "horn", { "vehicle/train/br189/horn.wav" }, 25.0)

soundsetutil.addTrackSqueal(data, "vehicle/train/br189/kurve.wav", 25.0)
soundsetutil.addTrackBrake(data, "vehicle/train/br189/bremsen.wav", 25.0, 1.0)

return data

end
