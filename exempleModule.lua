--non exporter car n'es pas dans l'export
local function test()
	print("passe")
end

local function test2()
	print("passe2")
end

--exporter car return export a la fin
local export = {}

function export.foo()
    print("Hello World!")
    test()
end

function export.foo2()
	print("foo2 called")
end

return export
