local importedFile = {}

function import(filename)
	if(importedFile[filename] == nil) then
		local f = assert(loadfile("packages/"..filename))
		importedFile[filename] = true
		return f()
	end
end

--import("easy_rp/server.lua")




