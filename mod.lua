function data()
return {
	info = {
		minorVersion = 1,
		severityAdd = "NONE",
		severityRemove = "WARNING",
		name = _("mod_name"),
		description = _("mod_desc"),
		authors = {
		    {
		        name = "ModWerkstatt",
		        role = "CREATOR",
		    },
		},
		tags = { "europe", "train", "siemens", "vectron", "smartron", "electric", "multi-system", "universal" },
		minGameVersion = 0,
		dependencies = { },
		url = { "" },
        params = {
			{
				key = "br193_vorspann",
				name = _("Vorspann_br193"),
				values = { "No", "Yes", },
				tooltip = _("option_vorspann_br193_desc"),
				defaultIndex = 0,
			},
			{
				key = "br193_fake",
				name = _("Fake_br193"),
				values = { "No", "Yes", },
				tooltip = _("option_fake_br193_desc"),
				defaultIndex = 0,
			},
			{
				key = "br193_ms",
				name = _("Ms_br193"),
				values = { "No", "Yes", },
				tooltip = _("option_ms_br193_desc"),				
				defaultIndex = 1,
			},
			{
				key = "br193_ac",
				name = _("Ac_br193"),
				values = { "No", "Yes", },
				tooltip = _("option_ac_br193_desc"),				
				defaultIndex = 1,
			},
			{
				key = "br193_dc",
				name = _("dc_br193"),
				values = { "No", "Yes", },
				tooltip = _("option_dc_br193_desc"),				
				defaultIndex = 1,
			},
			{
				key = "br193_sm",
				name = _("Sm_br193"),
				values = { "No", "Yes", },
				tooltip = _("option_sm_br193_desc"),				
				defaultIndex = 1,
			},
			{
				key = "br193_dachinl",
				name = _("dachinl_br193"),
				values = { "No", "Yes", },
				tooltip = _("option_dachinal_br193_desc"),				
				defaultIndex = 1,
			},
			{
				key = "br193_osteuropa",
				name = _("osteuropa_br193"),
				values = { "No", "Yes", },
				tooltip = _("option_osteuropa_br193_desc"),				
				defaultIndex = 1,
			},
			{
				key = "br193_skandinavien",
				name = _("skandinavien_br193"),
				values = { "No", "Yes", },
				tooltip = _("option_skandinavien_br193_desc"),				
				defaultIndex = 1,
			},
        },
	},
	options = {
	},
	runFn = function (settings, modParams)
		
		local vorspannFilter = function(fileName, data)		
			if data.metadata.transportVehicle and data.metadata.vectron and data.metadata.vectron.vorspann == true then				
				data.metadata.availability.yearFrom = 1
				data.metadata.availability.yearTo = 2
				--return false
			end	
			--return true
			return data
		end 
		
		local fakeFilter = function(fileName, data)		
			if data.metadata.transportVehicle and data.metadata.vectron and data.metadata.vectron.fake == true then		
				data.metadata.availability.yearFrom = 1
				data.metadata.availability.yearTo = 2				
			end				
			return data
		end 
		
		local msFilter = function(fileName, data)		
			if data.metadata.transportVehicle and data.metadata.vectron and data.metadata.vectron.ms == true then			
				data.metadata.availability.yearFrom = 1
				data.metadata.availability.yearTo = 2				
			end				
			return data
		end 
		
		local acFilter = function(fileName, data)		
			if data.metadata.transportVehicle and data.metadata.vectron and data.metadata.vectron.ac == true then			
				data.metadata.availability.yearFrom = 1
				data.metadata.availability.yearTo = 2				
			end				
			return data
		end
		
		local dcFilter = function(fileName, data)		
			if data.metadata.transportVehicle and data.metadata.vectron and data.metadata.vectron.dc == true then			
				data.metadata.availability.yearFrom = 1
				data.metadata.availability.yearTo = 2				
			end				
			return data
		end  
		
		local smFilter = function(fileName, data)		
			if data.metadata.transportVehicle and data.metadata.vectron and data.metadata.vectron.sm == true then			
				data.metadata.availability.yearFrom = 1
				data.metadata.availability.yearTo = 2				
			end				
			return data
		end
		
		local dachFilter = function(fileName, data)		
			if data.metadata.transportVehicle and data.metadata.vectron and data.metadata.vectron.dach == true then			
				data.metadata.availability.yearFrom = 1
				data.metadata.availability.yearTo = 2				
			end				
			return data
		end 
		
		local ostFilter = function(fileName, data)		
			if data.metadata.transportVehicle and data.metadata.vectron and data.metadata.vectron.ost == true then			
				data.metadata.availability.yearFrom = 1
				data.metadata.availability.yearTo = 2				
			end				
			return data
		end 
		
		local skandiFilter = function(fileName, data)		
			if data.metadata.transportVehicle and data.metadata.vectron and data.metadata.vectron.skandi == true then			
				data.metadata.availability.yearFrom = 1
				data.metadata.availability.yearTo = 2				
			end				
			return data
		end 
		
		if modParams[getCurrentModId()] ~= nil then
			local params = modParams[getCurrentModId()]					
			if params["br193_vorspann"] == 0 then				
				--addFileFilter("model/transportVehicle", vorspannFilter)	
				addModifier("loadModel", vorspannFilter)
			end
			if params["br193_fake"] == 0 then				
				addModifier("loadModel", fakeFilter)
			end
			if params["br193_ms"] == 0 then				
				addModifier("loadModel", msFilter)
			end
			if params["br193_ac"] == 0 then				
				addModifier("loadModel", acFilter)
			end
			if params["br193_dc"] == 0 then				
				addModifier("loadModel", acFilter)
			end
			if params["br193_sm"] == 0 then				
				addModifier("loadModel", smFilter)
			end
			if params["br193_dachinl"] == 0 then				
				addModifier("loadModel", dachFilter)
			end
			if params["br193_osteuropa"] == 0 then				
				addModifier("loadModel", ostFilter)
			end
			if params["br193_skandinavien"] == 0 then				
				addModifier("loadModel", skandiFilter)
			end
			
		else
			--addFileFilter("model/transportVehicle", vorspannFilter)			
			addModifier("loadModel", fakeFilter)
			addModifier("loadModel", msFilter)
			addModifier("loadModel", acFilter)
			addModifier("loadModel", dcFilter)
			addModifier("loadModel", smFilter)
			addModifier("loadModel", dachFilter)
			addModifier("loadModel", ostFilter)
			addModifier("loadModel", skandiFilter)
		end			
	end
}
end
