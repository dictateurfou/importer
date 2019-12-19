# importer
 a very light plugin importer for make module in onset and use in other script (because exportFunction broke object).
## this package not have loader for client (server only)

### first step add importer in you server_config

#### for load new package add you package in importer.lua at the end of file

```LUA
import("easy_rp/server.lua")
```

#### import work in all imported script (exemple of my easy_rp/server.lua soon public)
```LUA
easyRp = {}
import("easy_rp/sql.lua") -- export sql for global usage in all file (sql do'esnt have local before)
easyRp.Player = import("easy_rp/class/Player.lua")
easyRp.serverData = import("easy_rp/serverData.lua")
```

### after called you make global with namespace when you need to export for use in other script (use var only if you need to export with module without if you make just global var) exemple of module easy_rp/class/Player.lua:
```LUA
local player = {}
player.__index = player

function player:init(ply)
   setmetatable(ply, self)
   self.__index = self
   return ply
end

function player:getMoney()
   return self.money
end

function player:addMoney(amt)
   self.money = self.money + amt
end

function player:removeMoney(amt)
   self.money = self.money - amt
end

function player:getBank()
   return self.bank
end

function player:removeBank(amt)
   self.bank = self.bank - amt
end

function player:addBank(amt)
   self.bank = self.bank + amt
end

local function newPlayer(playerInfo)
   return player:init(playerInfo)
end

return {["new"] = newPlayer}
```

after this just call

easyRp.Player.new(arg) for use
```LUA
local test = easyRp.Player.new({["money"] = 5000,["bank"] = 4000,["name"] = "dicta",["identifier"] = "steamid"})
print("player test a "..test.money)
```
