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
				key = "br189_vorspann",
				name = _("Vorspann_br189"),
				values = { "No", "Yes", },
				tooltip = _("option_vorspann_br189_desc"),
				defaultIndex = 0,
			},
			{
				key = "br189_fake",
				name = _("Fake_br189"),
				values = { "No", "Yes", },
				tooltip = _("option_fake_br189_desc"),
				defaultIndex = 0,
			},
			{
				key = "br189_ms",
				name = _("ms_br189"),
				values = { "No", "Yes", },
				tooltip = _("option_ms_br189_desc"),				
				defaultIndex = 1,
			},
			{
				key = "br189_dc",
				name = _("dc_br189"),
				values = { "No", "Yes", },
				tooltip = _("option_dc_br189_desc"),				
				defaultIndex = 1,
			},
        },
	},
	options = {
	},
	runFn = function (settings, modParams)
		
		local vorspannFilter = function(fileName, data)		
			if data.metadata.transportVehicle and data.metadata.br189 and data.metadata.br189.vorspann == true then				
				data.metadata.availability.yearFrom = 1
				data.metadata.availability.yearTo = 2
				--return false
			end	
			--return true
			return data
		end 
		
		local fakeFilter = function(fileName, data)		
			if data.metadata.transportVehicle and data.metadata.br189 and data.metadata.br189.fake == true then		
				data.metadata.availability.yearFrom = 1
				data.metadata.availability.yearTo = 2				
			end				
			return data
		end 
		
		local msFilter = function(fileName, data)		
			if data.metadata.transportVehicle and data.metadata.br189 and data.metadata.br189.ms == true then			
				data.metadata.availability.yearFrom = 1
				data.metadata.availability.yearTo = 2				
			end				
			return data
		end 
		
		local dcFilter = function(fileName, data)		
			if data.metadata.transportVehicle and data.metadata.br189 and data.metadata.br189.dc == true then			
				data.metadata.availability.yearFrom = 1
				data.metadata.availability.yearTo = 2				
			end				
			return data
		end 
		
		if modParams[getCurrentModId()] ~= nil then
			local params = modParams[getCurrentModId()]					
			if params["br189_vorspann"] == 0 then				
				--addFileFilter("model/transportVehicle", vorspannFilter)	
				addModifier("loadModel", vorspannFilter)
			end
			if params["br189_fake"] == 0 then				
				addModifier("loadModel", fakeFilter)
			end
			if params["br189_ms"] == 0 then				
				addModifier("loadModel", msFilter)
			end
			if params["br189_dc"] == 0 then				
				addModifier("loadModel", acFilter)
			end
			
		else
			--addFileFilter("model/transportVehicle", vorspannFilter)			
			addModifier("loadModel", fakeFilter)
			addModifier("loadModel", msFilter)
			addModifier("loadModel", dcFilter)
		end			
	end
}
end
