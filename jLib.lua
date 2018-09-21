--		8 8888         ,o888888o.         ,o888888o.           .8.          8 8888           d888888o.   
--		8 8888      . 8888     `88.      8888     `88.        .888.         8 8888         .`8888:' `88. 
--		8 8888     ,8 8888       `8b  ,8 8888       `8.      :88888.        8 8888         8.`8888.   Y8 
--		8 8888     88 8888        `8b 88 8888               . `88888.       8 8888         `8.`8888.     
--		8 8888     88 8888         88 88 8888              .8. `88888.      8 8888          `8.`8888.    
--		8 8888     88 8888         88 88 8888             .8`8. `88888.     8 8888           `8.`8888.   
--		8 8888     88 8888        ,8P 88 8888            .8' `8. `88888.    8 8888            `8.`8888.  
--		8 8888     `8 8888       ,8P  `8 8888       .8' .8'   `8. `88888.   8 8888        8b   `8.`8888. 
--		8 8888      ` 8888     ,88'      8888     ,88' .888888888. `88888.  8 8888        `8b.  ;8.`8888 
--		8 888888888888 `8888888P'         `8888888P'  .8'       `8. `88888. 8 888888888888 `Y8888P ,88P'

math.randomseed(os.time())

local Town = {}
local Callback = {}
local Event = {}
local Delay = {}
local Table = {}
local String = {}
local Map = {}
local Cont = {}
local Item = {}
local Player = {}
local Creatures = {}
local Hunt = {}
local Shop = {}
local Depot = {}
local Backpacks = {}
local IpcPublisher = {}
local IpcSubscriber = {}
local Ipc = {}
local Hud = {}
local Rewriting = {}
local Ini = {}
local Channel = {}

local REGISTERED_EVENTS = {}
local CALLBACKS_INDEX = 0
local CALLBACKS = {}

local EVENT_CONTAINER = "container"
local EVENT_CHANNEL = "channel"

local EVENTS = {}
EVENTS[EVENT_CONTAINER] = {}
EVENTS[EVENT_CHANNEL] = {}

local DELAY = {}
DELAY.MOVE_ITEM = 350
DELAY.USE_ITEM = 300
DELAY.TRADE = 250
DELAY.TURN = 300
DELAY.TALK_NPC = {800, 1200}
DELAY.CHECK_POS = 200
DELAY.CLOSE_CONTAINER = 200
DELAY.BROWSE_FIELD = 350
DELAY.CONTAINER_TIMEOUT = 5000
DELAY.TARGETING_RESUME = 500
DELAY.BUDDEL = 2000

local TAGS = {}
TAGS["node"] = {0, "Node"}
TAGS["stand"] = {1, "Stand"}
TAGS["ladder"] = {2, "Ladder"}
TAGS["rope"] = {3, "Rope"}
TAGS["hole"] = {4, "Hole"}
TAGS["lwalk1"] = {7, "LWalk1"}
TAGS["lwalk3"] = {8, "LWalk3"}
TAGS["lwalk4"] = {12, "LWalk4"}
TAGS["lwalk5"] = {13, "LWalk5"}

local WEAPONS = {3277, 7378, 7367}

local SKINNING = {5906, 5905, 5893, 5925, 5877, 5948, 5876, 5878, 281, 282, 3026, 3029, 3032, 9303}

local LURER = {}
LURER.WHITELIST = {}
LURER.BLACKLIST = {}

LURER.WHITELIST["Lizard Legionnaire"] = 4
LURER.WHITELIST["Lizard Dragon Priest"] = 4
LURER.WHITELIST["Mummy"] = 3
LURER.WHITELIST["Ghost"] = 3
LURER.WHITELIST["Gargoyle"] = 3
LURER.WHITELIST["Crypt Shambler"] = 3
LURER.WHITELIST["Demon Skeleton"] = 3
LURER.WHITELIST["Corym Charlatan"] = 3
LURER.WHITELIST["Corym Skirmisher"] = 3
LURER.WHITELIST["Glooth Golem"] = 3
LURER.WHITELIST["Rustheap Golem"] = 3
LURER.WHITELIST["Metal Gargoyle"] = 3

local COLORS = {}
COLORS["White"] = {r = 255, g = 255, b = 255}
COLORS["Gray"] = {r = 128, g = 128, b = 128}
COLORS["Black"] = {r = 0, g = 0, b = 0}

COLORS["Blue"] = {r = 0, g = 0, b = 255}
COLORS["LightBlue"] = {r = 128, g = 128, b = 255}
COLORS["DarkBlue"] = {r = 0, g = 0, b = 128}

COLORS["Cyan"] = {r = 0, g = 255, b = 255}
COLORS["LightCyan"] = {r = 128, g = 255, b = 255}
COLORS["DarkCyan"] = {r = 0, g = 128, b = 128}

COLORS["Green"] = {r = 0, g = 255, b = 0}
COLORS["LightGreen"] = {r = 128, g = 255, b = 128}
COLORS["DarkGreen"] = {r = 0, g = 128, b = 0}

COLORS["Lime"] = {r = 128, g = 255, b = 0}
COLORS["LightLime"] = {r = 191, g = 255, b = 128}
COLORS["DarkLime"] = {r = 64, g = 128, b = 0}

COLORS["Orange"] = {r = 255, g = 102, b = 0}
COLORS["LightOrange"] = {r = 255, g = 179, b = 128}
COLORS["DarkOrange"] = {r = 128, g = 51, b = 0}

COLORS["Pink"] = {r = 255, g = 0, b = 255}
COLORS["LightPink"] = {r = 255, g = 128, b = 255}
COLORS["DarkPink"] = {r = 128, g = 0, b = 128}

COLORS["Purple"] = {r = 102, g = 0, b = 255}
COLORS["LightPurple"] = {r = 179, g = 128, b = 255}
COLORS["DarkPurple"] = {r = 51, g = 0, b = 128}

COLORS["Red"] = {r = 255, g = 0, b = 0}
COLORS["LightRed"] = {r = 255, g = 128, b = 128}
COLORS["DarkRed"] = {r = 128, g = 0, b = 0}

COLORS["Yellow"] = {r = 255, g = 255, b = 0}
COLORS["LightYellow"] = {r = 255, g = 255, b = 128}
COLORS["DarkYellow"] = {r = 128, g = 128, b = 0}

COLORS["Random"] = {r = math.random(0, 255), g = math.random(0, 255), b = math.random(0, 255)}

local HUD = {}
HUD["Left"] = {}
HUD["Right"] = {}

HUD["TitleColor"] = COLORS["Gray"]
HUD["DescriptionColor"] = COLORS["White"]
HUD["InformationColor"] = COLORS["White"]
HUD["LootColor"] = COLORS["White"]
HUD["ValueColor"] = COLORS["White"]

HUD["Time"] = nil
HUD["RefillTime"] = 0
HUD["LastRefillTime"] = 0
HUD["HuntTime"] = 0
HUD["LastHuntTime"] = 0
HUD["LeaveTime"] = 0
HUD["LastLeaveTime"] = 0

HUD["Experience"] = 0

HUD["Loot2"] = {}
HUD["LootHUD"] = {["Loot"] = 0, ["Waste"] = 0, ["Items"] = {["Loot"] = {}, ["Waste"] = {}}}
HUD["LootBlacklist"] = {["0"] = true, ["283"] = true, ["284"] = true, ["285"] = true, ["9063"] = true, ["9064"] = true, ["9065"] = true, ["9066"] = true}
HUD["LootWasteBlacklist"] = {["3031"] = true, ["3035"] = true, ["3043"] = true, ["9063"] = true, ["9064"] = true, ["9065"] = true, ["9066"] = true}
HUD["TrackLoot"] = 0
HUD["Corpses"] = {"dead", "slain", "demonic", "remains", "the", "dissolved", "elemental", "split"}

local CONFIG = {}
local SUPPLIES = {}

local BACKPACKS = {}
BACKPACKS["MainBackpack"] = {}
BACKPACKS["GoldBackpack"] = {}
BACKPACKS["LootBackpack"] = {}
BACKPACKS["StackBackpack"] = {}
BACKPACKS["NonStackBackpack"] = {}
BACKPACKS["SuppliesBackpack"] = {}
BACKPACKS["PotionBackpack"] = {}
BACKPACKS["RuneBackpack"] = {}
BACKPACKS["RingBackpack"] = {}
BACKPACKS["AmuletBackpack"] = {}
BACKPACKS["AmmoBackpack"] = {}

local SCRIPT_DATA = {}
SCRIPT_DATA["Name"] = "|NAME|"
SCRIPT_DATA["Version"] = "2.0.02"
SCRIPT_DATA["Ot"] = false
SCRIPT_DATA["Level"] = nil
SCRIPT_DATA["Vocation"] = nil
SCRIPT_DATA["Channel"] = nil
SCRIPT_DATA["SellLoot"] = false
SCRIPT_DATA["HasteSpawn"] = false
SCRIPT_DATA["DefaultAmulet"] = nil
SCRIPT_DATA["Balance"] = "Unknown"
SCRIPT_DATA["Exit"] = nil

SCRIPT_DATA["StackDepot"] = nil
SCRIPT_DATA["NonStackDepot"] = nil
SCRIPT_DATA["SuppliesDepot"] = nil

SCRIPT_DATA["ForceRefill"] = false
SCRIPT_DATA["IsDepositing"] = false
SCRIPT_DATA["IsRefilling"] = false
SCRIPT_DATA["IsHunting"] = false
SCRIPT_DATA["IsLeaving"] = false

SCRIPT_DATA["IsReadyLeave"] = false
SCRIPT_DATA["IsKillingEvent"] = false
SCRIPT_DATA["IsAntiLuring"] = false
SCRIPT_DATA["IsPlaceLuring"] = false

SCRIPT_DATA["IsIgnoring"] = false
SCRIPT_DATA["IsLuring"] = false

SCRIPT_DATA["PartnerName"] = nil
SCRIPT_DATA["Subscriber"] = nil
SCRIPT_DATA["Publisher"] = nil
SCRIPT_DATA["Topic"] = "ipc"

SCRIPT_DATA["IpcReady"] = false
SCRIPT_DATA["IpcEvents"] = {}
SCRIPT_DATA["IpcSignals"] = {}
SCRIPT_DATA["Wildgrowth"] = {}
SCRIPT_DATA["UseBomb"] = false

SCRIPT_DATA["LastWait"] = 100

local SCRIPT_CONFIG = [[|CONFIG|]]
local HUD_CONFIG = [[[HUD]
TitleColor = Gray                                       ; Color for the Title part in HUD ( Left & Right side )
DescriptionColor = White                                ; Color for the Description part in HUD ( Left side )
InformationColor = White                                ; Color for the Information part in HUD ( Left side )
LootColor = White                                       ; Color for the Loot part in HUD ( Right side )
ValueColor = White                                      ; Color for the Value part in HUD ( Right side )
]]

--		8 8888                  .8.          8 888888888o   8 8888888888   8 8888           d888888o.   
--		8 8888                 .888.         8 8888    `88. 8 8888         8 8888         .`8888:' `88. 
--		8 8888                :88888.        8 8888     `88 8 8888         8 8888         8.`8888.   Y8 
--		8 8888               . `88888.       8 8888     ,88 8 8888         8 8888         `8.`8888.     
--		8 8888              .8. `88888.      8 8888.   ,88' 8 888888888888 8 8888          `8.`8888.    
--		8 8888             .8`8. `88888.     8 8888888888   8 8888         8 8888           `8.`8888.   
--		8 8888            .8' `8. `88888.    8 8888    `88. 8 8888         8 8888            `8.`8888.  
--		8 8888           .8'   `8. `88888.   8 8888      88 8 8888         8 8888        8b   `8.`8888. 
--		8 8888          .888888888. `88888.  8 8888    ,88' 8 8888         8 8888        `8b.  ;8.`8888 
--		8 888888888888 .8'       `8. `88888. 8 888888888P   8 888888888888 8 888888888888 `Y8888P ,88P' 

function onLabel(labelName)
	local labelName = String.splitString(labelName, "|")

	-- Basic town label for executing actions
	if (labelName[1] == "next") then
		local curTown = Town.getTown().name
		local curPos = Town.getTownPlace().name
		local nextDest = Town.checkNextLocation()

		Player.walker(false)

		Town.checkAction(nextDest, function()

			if (SCRIPT_DATA["ForceRefill"] or (Player.normalStamina() / 60) <= 14 or CONFIG["General"]["LogBeforeSS"] > 0 and Map.getTimeToServerSave() / 60 <= CONFIG["General"]["LogBeforeSS"]) then
				Channel.warn("Stopping script, requested by user, low stamina or not enough account balance. Please restart the script to continue. ( Going to depot )")
				alert()

				if (string.find(curPos, "depot")) then
					return
				end
			end

			local nextDest = Town.checkNextLocation()

			Player.walker(true)

			-- I'm at town exit after executing an action, go to spawn
			if (string.find(curPos, "exit")) then
				Map.goToLabel(curTown.. "|" ..curPos.. "-spawn")
				Player.targetingIgnoring(true)
				Player.looter(false)

				-- Enable haster if requested
				if (SCRIPT_DATA["HasteSpawn"]) then
					Event.startEvent("Haster")
				end
			-- I'm going to town exit or handling more tasks in town
			else
				Map.goToLabel(curTown.. "|" ..curPos.. "-" ..nextDest)
			end
		end)

	-- Labels used during hunt
	elseif (labelName[1] == "hunt") then

		-- Sets all of the important values
		if (labelName[2] == "start") then
			if (not SCRIPT_DATA["IsHunting"]) then
				SCRIPT_DATA["IsHunting"] = true
				HUD["HuntTime"] = os.time() - HUD["LastHuntTime"]

				Player.looter(true)

				if (not CONFIG["Lurer"]) then
					Player.normalTargeting()
				end

				Event.startEvent("SupplyChecker")
			end

			-- Enable anti-lure if needed
			if (CONFIG["AntiLure"] and CONFIG["AntiLure"]["AntiLureActive"]) then
				Event.startEvent("AntiLure")
			end

			-- Enable place-lure if needed
			if (CONFIG["PlaceLurer"] and CONFIG["PlaceLurer"]["PlaceLureActive"]) then
				Event.startEvent("PlaceLure")
			end

			-- Disable haster
			Event.stopEvent("Haster")
		-- Goes to hunt|start or checks for optional route
		elseif (labelName[2] == "check") then
			if (#labelName == 2) then
				Map.goToLabel("hunt|start")

				LURER.BLACKLIST = {}
			else
				if (not CONFIG["Route"][labelName[3]]) then
					Map.goToLabel("hunt|" ..labelName[4], true)
				else
					Map.goToLabel("hunt|" ..labelName[3], true)
				end
			end
		-- Label automatically created when leaving
		elseif (labelName[2] == "exit") then
			Rewriting.insertClosestWaypoint("hunt|exit|" ..labelName[3], "hunt|leave", "leave")
		-- Label ending the hunt part and going to town
		elseif (labelName[2] == "leave") then
			Player.targetingIgnoring(true)
			Player.looter(false)

			-- Stop events
			Event.stopEvent("SupplyChecker")
			Event.stopEvent("Lurer")
			Event.stopEvent("AntiLure")
			Event.stopEvent("PlaceLure")

			-- Enable haster if requested
			if (SCRIPT_DATA["HasteSpawn"]) then
				Event.startEvent("Haster")
			end

			-- Set values to false
			SCRIPT_DATA["IsAntiLuring"] = false
			SCRIPT_DATA["IsPlaceLuring"] = false
			SCRIPT_DATA["IsKillingEvent"] = false

			loadSettings(SCRIPT_DATA["Name"], "Walker")

			Callback.setTimeout(function()
				Map.goToLabel("hunt|leave")
				Player.walker(true)
			end, 200)
		-- Fixes targeting/looter and completes tasks in town
		elseif (labelName[2] == "finish") then
			Player.targetingIgnoring(false)
			Player.looter(true)

			SCRIPT_DATA["IsLeaving"] = false
			HUD["RefillTime"] = os.time() - HUD["LastRefillTime"]

			local curTown = Town.getTown().name
			local curPos = Town.getTownPlace().name
			local nextDest = Town.checkNextLocation()

			Map.goToLabel(curTown.. "|" ..curPos.. "-" ..nextDest)

			-- Disable haster
			Event.stopEvent("Haster")
		end

	-- Special labels for controlling modules
	elseif (labelName[1] == "special") then
		-- Targeting ignoring state
		if (labelName[2] == "ignore") then
			if (labelName[3] == "start") then
				Player.targetingIgnoring(true)
			elseif (labelName[3] == "stop") then
				Player.targetingIgnoring(false)
			end
		-- Supply checker
		elseif (labelName[2] == "checker") then
			if (labelName[3] == "start") then
				Event.startEvent("SupplyChecker")
			elseif (labelName[3] == "stop") then
				Event.stopEvent("SupplyChecker")
			end
		-- Haster
		elseif (labelName[2] == "haste") then
			if (labelName[3] == "start") then
				Event.startEvent("Haster")
			elseif (labelName[3] == "stop") then
				Event.stopEvent("Haster")
			end
		-- Lurer
		elseif (labelName[2] == "lure") then
			if (CONFIG["Lurer"] and CONFIG["Lurer"]["LureActive"]) then
				if (labelName[3] == "start") then
					Player.lureTargeting(CONFIG["Lurer"]["LureKill"])
					Event.startEvent("Lurer")
				elseif (labelName[3] == "stop") then
					Player.normalTargeting()
					Event.stopEvent("Lurer")
				elseif (labelName[3] == "kill") then
					if (CONFIG["General"] and not CONFIG["General"]["IgnoreMonsters"] and SCRIPT_DATA["IsLeaving"] or SCRIPT_DATA["IsHunting"]) then
						if (not labelName[4]) then
							SCRIPT_DATA["IsKillingEvent"] = true
							Event.executeEvent("Lurer")
						else
							local min = tonumber(labelName[4])
							local monsterCount = #Creatures.findAllCreatures(true)

							if (monsterCount >= min) then
								SCRIPT_DATA["IsKillingEvent"] = true
								Event.executeEvent("Lurer")
							end
						end
					end
				end
			end
		-- Anti-lure
		elseif (labelName[2] == "antilure") then
			if (CONFIG["AntiLure"] and CONFIG["AntiLure"]["AntiLureActive"]) then
				if (labelName[3] == "wait") then
					Player.walker(false)

					Callback.setTimeout(function()
						Map.goToLabel(labelName[5])
						Player.walker(true)
						SCRIPT_DATA["IsAntiLuring"] = false
						Player.targetingIgnoring(true)
					end, Delay.pingDelay(labelName[4] * 1000))
				elseif (labelName[3] == "exit") then
					Rewriting.insertClosestWaypoint("special|antilure|exit|" ..labelName[4], "special|antilure|stop", "antilure")
				end
			end
		-- Placelure
		elseif (labelName[2] == "placelure") then
			if (CONFIG["PlaceLurer"] and CONFIG["PlaceLurer"]["PlaceLureActive"]) then
				if (labelName[3] == "fix") then
					Map.goToLabel(labelName[4])
					Player.targetingLuring(false)

					if (SCRIPT_DATA["IsReadyLeave"]) then
						Event.executeEvent("SupplyChecker")
					end
				elseif (labelName[3] == "exit") then
					Rewriting.insertClosestWaypoint("special|placelure|exit|" ..labelName[4], "special|placelure|stop", "placelure")
				elseif (labelName[3] == "start") then
					SCRIPT_DATA["IsPlaceLuring"] = false
				end
			end
		end

	-- Other labels for various simple actions
	elseif (labelName[1] == "other") then
		if (labelName[2] == "cure") then
			Player.cureConditions(1)
		elseif (labelName[2] == "step") then
			Player.step(labelName[3])						-- Arg1: Direction
		elseif (labelName[2] == "use") then
			Player.use(labelName[3])						-- Arg1: Direction
		elseif (labelName[2] == "usewith") then
			Player.useWith(labelName[3], labelName[4])		-- Arg1: Direction, Arg2: Item
		elseif (labelName[2] == "hole") then
			Player.hole(labelName[3])						-- Arg1: Direction
		elseif (labelName[2] == "door") then
			Player.door(labelName[3])						-- Arg1: Direction
		elseif (labelName[2] == "levitate") then
			Player.levitate(labelName[3], labelName[4])		-- Arg1: Direction, Arg2: Level
		elseif (labelName[2] == "drop") then
			Player.drop(labelName[3], labelName[4])	-- Arg1: Direction, Arg2: Item
		elseif (labelName[2] == "dropsoil") then
			Player.dropSoil(labelName[3], labelName[4], labelName[5], labelName[6])	-- Arg1: X, Arg2: Y, Arg3: Z, Arg4: Direction
		elseif (labelName[2] == "destroy") then
			Player.destroy(labelName[3])					-- Arg1: Direction
		elseif (labelName[2] == "flever") then
			Player.farmineLever(labelName[3])				-- Arg1: Direction
		elseif (labelName[2] == "travel") then
			Creatures.travel(labelName[3], labelName[4])	-- Arg1: Name, Arg2: Destination
		elseif (labelName[2] == "wait") then
			Player.delayWalker(labelName[3])				-- Arg1: Time
		elseif (labelName[2] == "checkloot") then
			if (not SCRIPT_DATA["SellLoot"]) then
				Map.goToLabel("noloot")
			end
		elseif (labelName[2] == "loot") then
			local backpacks = {}

			table.insert(backpacks, BACKPACKS["LootBackpack"].index)
			table.insert(backpacks, BACKPACKS["StackBackpack"].index)
			table.insert(backpacks, BACKPACKS["NonStackBackpack"].index)

			Creatures.followNpc(labelName[3], function()
				Shop.sellItems(true, backpacks)
			end)
		end
	-- Everything IPC connected
	elseif (labelName[1] == "ipc") then
		-- Start label
		if (labelName[2] == "start") then
			if (not SCRIPT_DATA["IsHunting"]) then
				SCRIPT_DATA["IsHunting"] = true
				HUD["HuntTime"] = os.time() - HUD["LastHuntTime"]
			end

			if (SCRIPT_DATA["Vocation"] == "knight") then
				Player.looter(true)
			end

			SCRIPT_DATA["IpcSignals"] = {}

			Event.stopEvent("Haster")
		-- Finishing round label
		elseif (labelName[2] == "check" and not labelName[3]) then
			SCRIPT_DATA["IpcSignals"] = {}

			Map.goToLabel("ipc|start")
		-- Message sent to partner
		elseif (labelName[2] == "publish") then
			IpcPublisher.publishMessage(SCRIPT_DATA["Publisher"], SCRIPT_DATA["Topic"], table.concat(labelName, "|", 3))

			if (string.match(labelName[3], "wait")) then
				table.insert(SCRIPT_DATA["IpcSignals"], labelName[3])
			end
		-- Message sent to myself
		else
			Ipc.handleMessage(table.concat(labelName, "|", 3))
		end
	end
end

--		8888888 8888888888 ,o888888o.  `8.`888b                 ,8' b.             8    d888888o.   
--		      8 8888    . 8888     `88. `8.`888b               ,8'  888o.          8  .`8888:' `88. 
--		      8 8888   ,8 8888       `8b `8.`888b             ,8'   Y88888o.       8  8.`8888.   Y8 
--		      8 8888   88 8888        `8b `8.`888b     .b    ,8'    .`Y888888o.    8  `8.`8888.     
--		      8 8888   88 8888         88  `8.`888b    88b  ,8'     8o. `Y888888o. 8   `8.`8888.    
--		      8 8888   88 8888         88   `8.`888b .`888b,8'      8`Y8o. `Y88888o8    `8.`8888.   
--		      8 8888   88 8888        ,8P    `8.`888b8.`8888'       8   `Y8o. `Y8888     `8.`8888.  
--		      8 8888   `8 8888       ,8P      `8.`888`8.`88'        8      `Y8o. `Y8 8b   `8.`8888. 
--		      8 8888    ` 8888     ,88'        `8.`8' `8,`'         8         `Y8o.` `8b.  ;8.`8888 
--		      8 8888       `8888888P'           `8.`   `8'          8            `Yo  `Y8888P ,88P' 

local TOWNS = {}
TOWNS["ab'dendriel"] = {x = 32670, y = 31680}
TOWNS["ankrahmun"] = {x = 33150, y = 32820}
TOWNS["carlin"] = {x = 32340, y = 31800}
TOWNS["darashia"] = {x = 33240, y = 32440}
TOWNS["edron"] = {x = 33190, y = 31820}
TOWNS["farmine"] = {x = 33030, y = 31520}
TOWNS["gray beach"] = {x = 33460, y = 31310}
TOWNS["kazordoon"] = {x = 32630, y = 31920}
TOWNS["liberty bay"] = {x = 32320, y = 32830}
TOWNS["port hope"] = {x = 32620, y = 32770}
TOWNS["rathelon"] = {x = 33620, y = 31920}
TOWNS["roshamuul"] = {x = 33550, y = 32390}
TOWNS["svargrond"] = {x = 32260, y = 31150}
TOWNS["thais"] = {x = 32370, y = 32220}
TOWNS["venore"] = {x = 32950, y = 32080}
TOWNS["yalahar"] = {x = 32800, y = 31240}

local PLACES = {}
PLACES["ab'dendriel"] = {}
PLACES["ab'dendriel"]["depot"] = {x = 32682, y = 31688, z = {3, 4, 5, 6, 7, 8}}
PLACES["ab'dendriel"]["bank"] = {x = 32685, y = 31689, z = {8}}
PLACES["ab'dendriel"]["potion"] = {x = 32670, y = 31661, z = {6}}
PLACES["ab'dendriel"]["rune"] = {x = 32670, y = 31661, z = {6}}
PLACES["ab'dendriel"]["ammo"] = {x = 32689, y = 31615, z = {7}}

PLACES["ankrahmun"] = {}
PLACES["ankrahmun"]["depot"] = {x = 33126, y = 32842, z = {5, 6, 7}}
PLACES["ankrahmun"]["bank"] = {x = 33134, y = 32823, z = {6}}
PLACES["ankrahmun"]["potion"] = {x = 33130, y = 32813, z = {5}}
PLACES["ankrahmun"]["rune"] = {x = 33130, y = 32818, z = {5}}
PLACES["ankrahmun"]["ammo"] = {x = 33156, y = 32812, z = {4}}
PLACES["ankrahmun"]["exit.west"] = {x = 33087, y = 32789, z = {7}}
PLACES["ankrahmun"]["exit.boat"] = {x = 33092, y = 32884, z = {6}}

PLACES["carlin"] = {}
PLACES["carlin"]["depot"] = {x = 32339, y = 31781, z = {5, 6, 7, 8}}
PLACES["carlin"]["bank"] = {x = 32326, y = 31782, z = {7}}
PLACES["carlin"]["potion"] = {x = 32345, y = 31828, z = {7}, npc = "Rachel"}
PLACES["carlin"]["rune"] = {x = 32345, y = 31828, z = {7}, npc = "Rachel"}
PLACES["carlin"]["ammo"] = {x = 32294, y = 31786, z = {7}}
PLACES["carlin"]["exit.north"] = {x = 32341, y = 31746, z = {7}}
PLACES["carlin"]["exit.east"] = {x = 32396, y = 31785, z = {7}}
PLACES["carlin"]["exit.west"] = {x = 32289, y = 31789, z = {7}}

PLACES["darashia"] = {}
PLACES["darashia"]["depot"] = {x = 33220, y = 32461, z = {7, 8}}
PLACES["darashia"]["bank"] = {x = 33221, y = 32391, z = {7}}
PLACES["darashia"]["potion"] = {x = 33221, y = 32403, z = {7}, npc = "Asima"}
PLACES["darashia"]["rune"] = {x = 33221, y = 32403, z = {7}, npc = "Asima"}
PLACES["darashia"]["ammo"] = {x = 33233, y = 32429, z = {7}, npc = "Edoch"}
PLACES["darashia"]["exit.south"] = {x = 33208, y = 32450, z = {7}}
PLACES["darashia"]["exit.carpet"] = {x = 33269, y = 32441, z = {6}}
PLACES["darashia"]["exit.boat"] = {x = 33289, y = 32482, z = {6}}

PLACES["edron"] = {}
PLACES["edron"]["depot"] = {x = 33168, y = 31805, z = {8, 9, 10}}
PLACES["edron"]["bank"] = {x = 33173, y = 31803, z = {7}}
PLACES["edron"]["potion"] = {x = 33255, y = 31840, z = {7}}
PLACES["edron"]["rune"] = {x = 33256, y = 31841, z = {3}}
PLACES["edron"]["ammo"] = {x = 33213, y = 31796, z = {6}}
PLACES["edron"]["exit.east"] = {x = 33243, y = 31808, z = {7}}
PLACES["edron"]["exit.boat"] = {x = 33176, y = 31764, z = {6}}

PLACES["farmine"] = {}
PLACES["farmine"]["depot"] = {x = 33025, y = 31449, z = {11}}
PLACES["farmine"]["bank"] = {x = 33013, y = 31492, z = {10}}
PLACES["farmine"]["potion"] = {x = 33010, y = 31534, z = {10}}
PLACES["farmine"]["rune"] = {x = 33010, y = 31534, z = {10}}
PLACES["farmine"]["ammo"] = {x = 33037, y = 31541, z = {10}}
PLACES["farmine"]["exit.east"] = {x = 33060, y = 31531, z = {10}}

PLACES["gray beach"] = {}
PLACES["gray beach"]["depot"] = {x = 00000, y = 00000, z = {}} -- TBD
PLACES["gray beach"]["bank"] = {x = 00000, y = 00000, z = {}} -- TBD
PLACES["gray beach"]["potion"] = {x = 00000, y = 00000, z = {}} -- TBD
PLACES["gray beach"]["rune"] = {x = 00000, y = 00000, z = {}} -- TBD
PLACES["gray beach"]["ammo"] = {x = 00000, y = 00000, z = {}} -- TBD

PLACES["kazordoon"] = {}
PLACES["kazordoon"]["depot"] = {x = 32660, y = 31913, z = {8}}
PLACES["kazordoon"]["bank"] = {x = 32648, y = 31907, z = {8}}
PLACES["kazordoon"]["potion"] = {x = 32629, y = 31924, z = {5}, npc = "Sigurd"}
PLACES["kazordoon"]["rune"] = {x = 32629, y = 31924, z = {5}, npc = "Sigurd"}
PLACES["kazordoon"]["ammo"] = {x = 32661, y = 31895, z = {9}}
PLACES["kazordoon"]["exit.carts"] = {x = 32657, y = 31903, z = {8}}

PLACES["liberty bay"] = {}
PLACES["liberty bay"]["depot"] = {x = 32331, y = 32835, z = {6, 7}}
PLACES["liberty bay"]["bank"] = {x = 32338, y = 32836, z = {7}}
PLACES["liberty bay"]["potion"] = {x = 32345, y = 32810, z = {7}}
PLACES["liberty bay"]["rune"] = {x = 32345, y = 32810, z = {7}}
PLACES["liberty bay"]["ammo"] = {x = 32293, y = 32818, z = {7}, npc = "Cedrik"}
PLACES["liberty bay"]["exit.south"] = {x = 32345, y = 32842, z = {7}}
PLACES["liberty bay"]["exit.west"] = {x = 32255, y = 32817, z = {7}}

PLACES["port hope"] = {}
PLACES["port hope"]["depot"] = {x = 32628, y = 32745, z = {7}}
PLACES["port hope"]["bank"] = {x = 32635, y = 32742, z = {6}}
PLACES["port hope"]["potion"] = {x = 32622, y = 32743, z = {5}}
PLACES["port hope"]["rune"] = {x = 32622, y = 32743, z = {5}}
PLACES["port hope"]["ammo"] = {x = 32635, y = 32742, z = {5}}

PLACES["rathelon"] = {}
PLACES["rathelon"]["depot"] = {x = 33637, y = 31895, z = {6, 7}}
PLACES["rathelon"]["bank"] = {x = 33626, y = 31892, z = {5}}
PLACES["rathelon"]["potion"] = {x = 33618, y = 31882, z = {4}}
PLACES["rathelon"]["rune"] = {x = 33618, y = 31882, z = {5}}
PLACES["rathelon"]["ammo"] = {x = 33632, y = 31882, z = {5}}
PLACES["rathelon"]["exit.south"] = {x = 33635, y = 31940, z = {6}}

PLACES["roshamuul"] = {}
PLACES["roshamuul"]["depot"] = {x = 33548, y = 32382, z = {6}}
PLACES["roshamuul"]["bank"] = {x = 33559, y = 32386, z = {7}}
PLACES["roshamuul"]["potion"] = {x = 33541, y = 32380, z = {7}}
PLACES["roshamuul"]["rune"] = {x = 33541, y = 32380, z = {7}}
PLACES["roshamuul"]["ammo"] = {x = 33541, y = 32380, z = {7}}
PLACES["roshamuul"]["exit.north"] = {x = 33533, y = 32370, z = {7}}
PLACES["roshamuul"]["exit.south"] = {x = 33553, y = 32387, z = {6}}

PLACES["svargrond"] = {}
PLACES["svargrond"]["depot"] = {x = 32264, y = 31141, z = {6, 7}}
PLACES["svargrond"]["bank"] = {x = 32299, y = 31134, z = {7}}
PLACES["svargrond"]["potion"] = {x = 32308, y = 31132, z = {7}}
PLACES["svargrond"]["rune"] = {x = 32308, y = 31132, z = {7}}
PLACES["svargrond"]["ammo"] = {x = 32235, y = 31074, z = {6}, npc = "Robert"}
PLACES["svargrond"]["exit.south"] = {x = 32256, y = 31197, z = {7}}
PLACES["svargrond"]["exit.north"] = {x = 32246, y = 31104, z = {5}}

PLACES["thais"] = {}
PLACES["thais"]["depot"] = {x = 32348, y = 32228, z = {5, 6, 7, 8}}
PLACES["thais"]["bank"] = {x = 32345, y = 32230, z = {7}}
PLACES["thais"]["potion"] = {x = 32400, y = 32222, z = {7}}
PLACES["thais"]["rune"] = {x = 32400, y = 32222, z = {7}}
PLACES["thais"]["ammo"] = {x = 32343, y = 32247, z = {6}}

PLACES["venore"] = {}
PLACES["venore"]["depot"] = {x = 33018, y = 32049, z = {7}}
PLACES["venore"]["bank"] = {x = 33019, y = 32053, z = {6}}
PLACES["venore"]["potion"] = {x = 32970, y = 32085, z = {6}}
PLACES["venore"]["rune"] = {x = 32970, y = 32082, z = {6}}
PLACES["venore"]["ammo"] = {x = 32906, y = 32118, z = {6}}
PLACES["venore"]["exit.north"] = {x = 32954, y = 32025, z = {6}}
PLACES["venore"]["exit.east"] = {x = 33002, y = 32096, z = {6}}
PLACES["venore"]["exit.south"] = {x = 32936, y = 32155, z = {6}}
PLACES["venore"]["exit.west"] = {x = 32865, y = 32126, z = {6}}

PLACES["yalahar"] = {}
PLACES["yalahar"]["depot"] = {x = 32782, y = 31248, z = {6, 7}}
PLACES["yalahar"]["bank"] = {x = 32824, y = 31249, z = {7}}
PLACES["yalahar"]["potion"] = {x = 32789, y = 31238, z = {5}}
PLACES["yalahar"]["rune"] = {x = 32789, y = 31238, z = {5}}
PLACES["yalahar"]["ammo"] = {x = 32790, y = 31238, z = {3}, npc = "Vincent"}
PLACES["yalahar"]["exit.west"] = {x = 32771, y = 31247, z = {7}}
PLACES["yalahar"]["exit.east"] = {x = 32833, y = 31249, z = {7}}

-- Returns current town
function Town.getTown()
	local pos = Player.pos()
	local position = {dist = 99999}

	-- Checks every possible town and sorts by distance to determine the closest position
	for k, v in pairs(TOWNS) do
		local distTo = Map.getDistanceTo(pos, {x = v.x, y = v.y})

		if (distTo < position.dist) then
			position.name = k
			position.dist = distTo
		end
	end

	return position
end

-- Returns current place in town
function Town.getTownPlace()
	local pos = Player.pos()
	local position = {dist = 99999}
	local town = Town.getTown()

	-- Checks every possible place in town and sorts by distance to determine the closest position
	for k, v in pairs(PLACES[town.name]) do
		for i = 1, #v.z do
			if (pos.z == v.z[i]) then
				local distTo = Map.getDistanceTo(pos, {x = v.x, y = v.y})

				if (distTo < position.dist) then
					position.name = k
					position.dist = distTo
				end

				break
			end
		end
	end

	return position
end

-- Returns sorted locations required to visit
function Town.checkLocations()
	local toVisit = {}
	local currentTown = Town.getTown().name
	local pos = Player.pos()

	if (not Hunt.checkPotions(true, false)) then
		table.insert(toVisit, "potion")
	end

	if (not Hunt.checkRunes(true, false)) then
		table.insert(toVisit, "rune")
	end

	if (not Hunt.checkAmmunition(true, false)) then
		table.insert(toVisit, "ammo")
	end

	if (not Hunt.checkRing(true, false) or not Hunt.checkAmulet(true, false) or not Hunt.checkWithdraw(true, false)) then
		table.insert(toVisit, "depot")
	end

	if (Player.countMoney() > 0) then
		table.insert(toVisit, "bank")
	end

	-- Adds place name, npc and distance to a table
	for i = 1, #toVisit do
		local distTo = Map.getDistanceTo(pos, {x = PLACES[currentTown][toVisit[i]].x, y = PLACES[currentTown][toVisit[i]].y})

		toVisit[i] = {name = toVisit[i], npc = PLACES[currentTown][toVisit[i]].npc, dist = distTo, z = PLACES[currentTown][toVisit[i]].z[1]}
	end

	-- Sorts the table by distance ( closest first )
	table.sort(toVisit, function(a, b) return a.dist < b.dist end)

	return toVisit
end

-- Returns next location to visit
function Town.checkNextLocation()
	local toVisit = Town.checkLocations()

	-- Script was forced to refill or had loot/came back from hunt
	if (Backpacks.checkDeposit() or SCRIPT_DATA["ForceRefill"]) then
		return "depot"
	end

	-- Normal town handling if destination is found
	if (toVisit[1]) then
		return toVisit[1].name
	end

	return SCRIPT_DATA["Exit"]
end

-- Handles current waypoint
function Town.checkAction(arg, callback)
	local toVisit = Town.checkLocations()
	local place = Town.getTownPlace().name

	if (place == arg) then
		if (toVisit[1] or Player.countMoney() > 0 or Backpacks.checkDeposit()) then

			-- Deposit/withdraw items
			if (arg == "depot") then

				if (Backpacks.checkDeposit()) then
					Depot.depositLoot(function()
						if (not Cont.getByName("Browse Field")) then
							Backpacks.resetBackpacks(false, function()

								SCRIPT_DATA["IsDepositing"] = false

								HUD["Loot2"] = {}

								callback()
								return
							end)
						else
							Backpacks.resetBackpacks(true, function()

								SCRIPT_DATA["IsDepositing"] = false

								HUD["Loot2"] = {}

								callback()
								return
							end)
						end
					end)
				else
					Depot.withdrawSupplies(function()
						callback()
						return
					end)
				end

			-- Deposit gold
			elseif (arg == "bank") then

				Creatures.followNpc(toVisit[1].npc, function()
					Shop.depositGold(true, function()
						callback()
						return
					end)
				end)

			-- Buy potions/runes/ammunition depending on location
			elseif (arg == "potion" or arg == "rune" or arg == "ammo") then

				local items = {arg}

				for i = 2, #toVisit do
					if (toVisit[i] and toVisit[1].dist == toVisit[i].dist and toVisit[1].z == toVisit[i].z) then
						if (string.find("potion rune ammo", toVisit[i].name)) then
							table.insert(items, toVisit[i].name)
						end
					end
				end

				for i = 1, #items do
					if (items[i] == "potion") then
						items[i] = "Potions"
					elseif (items[i] == "rune") then
						items[i] = "Runes"
					elseif (items[i] == "ammo") then
						items[i] = "Ammunition"
					end
				end

				Creatures.followNpc(toVisit[1].npc, function()
					Shop.sellFlasks(true, function()
						Shop.buyItems(false, items, function()
							callback()
							return
						end)
					end)
				end)

			else
				callback()
				return
			end
		else
			callback()
			return
		end
	else
		callback()
		return
	end
end

--		    ,o888888o.           .8.          8 8888         8 8888         8 888888888o          .8.           ,o888888o.    8 8888     ,88' 
--		   8888     `88.        .888.         8 8888         8 8888         8 8888    `88.       .888.         8888     `88.  8 8888    ,88'  
--		,8 8888       `8.      :88888.        8 8888         8 8888         8 8888     `88      :88888.     ,8 8888       `8. 8 8888   ,88'   
--		88 8888               . `88888.       8 8888         8 8888         8 8888     ,88     . `88888.    88 8888           8 8888  ,88'    
--		88 8888              .8. `88888.      8 8888         8 8888         8 8888.   ,88'    .8. `88888.   88 8888           8 8888 ,88'     
--		88 8888             .8`8. `88888.     8 8888         8 8888         8 8888888888     .8`8. `88888.  88 8888           8 8888 88'      
--		88 8888            .8' `8. `88888.    8 8888         8 8888         8 8888    `88.  .8' `8. `88888. 88 8888           8 888888<       
--		`8 8888       .8' .8'   `8. `88888.   8 8888         8 8888         8 8888      88 .8'   `8. `88888.`8 8888       .8' 8 8888 `Y8.     
--		   8888     ,88' .888888888. `88888.  8 8888         8 8888         8 8888    ,88'.888888888. `88888.  8888     ,88'  8 8888   `Y8.   
--		    `8888888P'  .8'       `8. `88888. 8 888888888888 8 888888888888 8 888888888P .8'       `8. `88888.  `8888888P'    8 8888     `Y8. 

-- Puts a timeout in queue
function Callback.setTimeout(callback, delay)
	CALLBACKS_INDEX = CALLBACKS_INDEX + 1
	CALLBACKS[CALLBACKS_INDEX] = {callback = callback, delay = (os.clock() * 1000) + delay}

	return CALLBACKS_INDEX
end

-- Removes a timeout from queue
function Callback.clearTimeout(index)
	CALLBACKS[index] = nil
end

-- Puts a condition in queue
function Callback.setCondition(event, message, callback)
	local index = #EVENTS[event] + 1
	local message = message or nil

	EVENTS[event][index] = {callback = callback, message = message}

	return index
end

-- Removes a condition from queue
function Callback.clearCondition(event, index)
	EVENTS[event][index] = nil
end

-- Handles callbacks
function Callback.checkCallbacks()
	local cTime = os.clock() * 1000

	-- Iterates over every callback in queue, executes then deletes
	for k, v in pairs(CALLBACKS) do
		if (cTime >= v.delay) then
			v.callback(k)
			CALLBACKS[k] = nil

			Callback.checkCallbacks()
			return 
		end
	end
end

-- Handles conditions
function Callback.checkConditions(event, message, ...)
	for k, v in pairs(EVENTS[event]) do
		if (k and not v) then
			EVENTS[event][k] = nil
			Callback.checkConditions(message, ...)
			return
		end

		local type = type(v.message)

		-- Invalid argument
		if (type == "nil") then
			EVENTS[event][k] = nil
			v.callback(message, ...)
		-- Argument is a string
		elseif (type == "string") then
			if (string.lower(v.message) == string.lower(message)) then
				EVENTS[event][k] = nil
				v.callback(message, ...)
			end
		-- Argument is a table
		elseif (type == "table") then
			local match = {string.match(v.message)}

			if (match[1]) then
				EVENTS[event][k] = nil
				v.callback(message, match, ...)
			end
		end
	end
end

--		8 8888888888 `8.`888b           ,8' 8 8888888888   b.             8 8888888 8888888888 d888888o.   
--		8 8888        `8.`888b         ,8'  8 8888         888o.          8       8 8888     .`8888:' `88. 
--		8 8888         `8.`888b       ,8'   8 8888         Y88888o.       8       8 8888     8.`8888.   Y8 
--		8 8888          `8.`888b     ,8'    8 8888         .`Y888888o.    8       8 8888     `8.`8888.     
--		8 888888888888   `8.`888b   ,8'     8 888888888888 8o. `Y888888o. 8       8 8888      `8.`8888.    
--		8 8888            `8.`888b ,8'      8 8888         8`Y8o. `Y88888o8       8 8888       `8.`8888.   
--		8 8888             `8.`888b8'       8 8888         8   `Y8o. `Y8888       8 8888        `8.`8888.  
--		8 8888              `8.`888'        8 8888         8      `Y8o. `Y8       8 8888    8b   `8.`8888. 
--		8 8888               `8.`8'         8 8888         8         `Y8o.`       8 8888    `8b.  ;8.`8888 
--		8 888888888888        `8.`          8 888888888888 8            `Yo       8 8888     `Y8888P ,88P' 

-- Registers an event
function Event.registerNewEvent(type, functionName)
	return registerNativeEventListener(type, functionName)
end

-- Creates a new event
function Event.createEvent(name, functionName, delay, active)
	REGISTERED_EVENTS[name] = {fname = functionName, delay = (os.clock() * 1000) + delay, startDelay = delay, active = active}
end

-- Event handler
function Event.handleEvents()
	local cTime = os.clock() * 1000

	-- Iterates over every event, then executes it and delays
	for k, v in pairs(REGISTERED_EVENTS) do
		if (cTime >= v.delay and v.active) then
			v.delay = v.startDelay + (os.clock() * 1000)
			Event.executeEvent(k)
		end
	end
end

-- Executes a specific event
function Event.executeEvent(name)
	REGISTERED_EVENTS[name].fname()
end

-- Delays a specific event
function Event.delayEvent(name, _delay)
	REGISTERED_EVENTS[name].delay = _delay + (os.clock() * 1000)
end

-- Adds a new event to the loop
function Event.startEvent(name)
	REGISTERED_EVENTS[name].active = true
end

-- Removes an event from the loop
function Event.stopEvent(name)
	REGISTERED_EVENTS[name].active = false
end

--		8 888888888o.      8 8888888888   8 8888                  .8.   `8.`8888.      ,8' d888888o.   
--		8 8888    `^888.   8 8888         8 8888                 .888.   `8.`8888.    ,8'.`8888:' `88. 
--		8 8888        `88. 8 8888         8 8888                :88888.   `8.`8888.  ,8' 8.`8888.   Y8 
--		8 8888         `88 8 8888         8 8888               . `88888.   `8.`8888.,8'  `8.`8888.     
--		8 8888          88 8 888888888888 8 8888              .8. `88888.   `8.`88888'    `8.`8888.    
--		8 8888          88 8 8888         8 8888             .8`8. `88888.   `8. 8888      `8.`8888.   
--		8 8888         ,88 8 8888         8 8888            .8' `8. `88888.   `8 8888       `8.`8888.  
--		8 8888        ,88' 8 8888         8 8888           .8'   `8. `88888.   8 8888   8b   `8.`8888. 
--		8 8888    ,o88P'   8 8888         8 8888          .888888888. `88888.  8 8888   `8b.  ;8.`8888 
--		8 888888888P'      8 888888888888 8 888888888888 .8'       `8. `88888. 8 8888    `Y8888P ,88P' 

-- Returns delay
function Delay.pingDelay(delay)
	if (type(delay) == "table") then
		return math.max(math.random(unpack(delay)), Player.ping())
	end

	return math.max(delay, Player.ping())
end

--		8888888 8888888888   .8.          8 888888888o   8 8888         8 8888888888     d888888o.   
--		      8 8888        .888.         8 8888    `88. 8 8888         8 8888         .`8888:' `88. 
--		      8 8888       :88888.        8 8888     `88 8 8888         8 8888         8.`8888.   Y8 
--		      8 8888      . `88888.       8 8888     ,88 8 8888         8 8888         `8.`8888.     
--		      8 8888     .8. `88888.      8 8888.   ,88' 8 8888         8 888888888888  `8.`8888.    
--		      8 8888    .8`8. `88888.     8 8888888888   8 8888         8 8888           `8.`8888.   
--		      8 8888   .8' `8. `88888.    8 8888    `88. 8 8888         8 8888            `8.`8888.  
--		      8 8888  .8'   `8. `88888.   8 8888      88 8 8888         8 8888        8b   `8.`8888. 
--		      8 8888 .888888888. `88888.  8 8888    ,88' 8 8888         8 8888        `8b.  ;8.`8888 
--		      8 8888.8'       `8. `88888. 8 888888888P   8 888888888888 8 888888888888 `Y8888P ,88P' 

-- Finds a value in table
function Table.contains(t, value)
	for k, v in pairs(t) do
		if (type(v) == "string" and type(value) == "string") then
			if (string.lower(v) == string.lower(value)) then
				return true, k
			end
		elseif (v == value) then
			return true, k
		end
	end

	return false
end

-- Removes a value from table
function Table.valueRemove(t, var)
	for k, v in pairs(t) do
		if (v == var) then
			table.remove(t, k)
			break
		end
	end
end

--- Counts a key-value table length
function Table.countLength(t, limit)
	local count = 0
	local limit = limit or 999

	for k, v in pairs(t) do
		if (k) then
			count = count + 1
			if (count >= limit) then
				return count
			end
		end
	end

	return count
end

-- Sorts a table by distance based on player's position
function Table.sortByDistance(t)
	local pos = Player.pos()
	
	table.sort(t, function(a, b) return (getDistanceBetween(pos, a) < getDistanceBetween(pos, b)) end)
	return t
end

--		   d888888o.   8888888 8888888888 8 888888888o.   8 8888  b.             8     ,o888888o.       d888888o.  
--		 .`8888:' `88.       8 8888       8 8888    `88.  8 8888  888o.          8    8888     `88.   .`8888:' `88.
--		 8.`8888.   Y8       8 8888       8 8888     `88  8 8888  Y88888o.       8 ,8 8888       `8.  8.`8888.   Y8
--		 `8.`8888.           8 8888       8 8888     ,88  8 8888  .`Y888888o.    8 88 8888            `8.`8888.    
--		  `8.`8888.          8 8888       8 8888.   ,88'  8 8888  8o. `Y888888o. 8 88 8888             `8.`8888.   
--		   `8.`8888.         8 8888       8 888888888P'   8 8888  8`Y8o. `Y88888o8 88 8888              `8.`8888.   
--		    `8.`8888.        8 8888       8 8888`8b       8 8888  8   `Y8o. `Y8888 88 8888   8888888     `8.`8888. 
--		8b   `8.`8888.       8 8888       8 8888 `8b.     8 8888  8      `Y8o. `Y8 `8 8888       .8' 8b   `8.`8888.
--		`8b.  ;8.`8888       8 8888       8 8888   `8b.   8 8888  8         `Y8o.`    8888     ,88'  `8b.  ;8.`8888
--		 `Y8888P ,88P'       8 8888       8 8888     `88. 8 8888  8            `Yo     `8888888P'     `Y8888P ,88P'

-- Splits a string based on the pattern
function String.splitString(str, pattern)
	local result = {}

	for word in (str.. pattern):gmatch("(.-)" ..pattern) do
		table.insert(result, word)
	end

	return result
end

-- Converts seconds to a string in format h:m:s
function String.convertTime(seconds)
	local h = math.floor(seconds / 3600)
	local m = math.floor(seconds / 60 % 60)
	local s = math.floor(seconds % 60)
	
	return string.format("%02.f:%02.f:%02.f", h, m, s)
end

-- Makes the string title case
function String.titleCase(str)
	return string.gsub(str, "(%a)([%w_']*)", function(a, b) return string.upper(a) ..string.lower(b) end)
end

-- Limits length of a string
function String.limitLength(str, limit, suffix)
	if (string.len(str) > limit) then
		str = string.sub(str, 1, limit) ..suffix
	end

	return str
end

-- Adds commas every 3 words
function String.commaSplitString(str)
	local str = tostring(str)
	local strLen = string.sub(str, 1, 1) == "-" and string.len(str) - 1 or string.len(str) -- Removes the minus sign

	-- String is too short, return
	if (strLen <= 3 or string.find(str, ",") or not tonumber(str)) then return str end

	local _string = {}
	local j = string.len(str) % 3 + 1

	if (j > 1) then
		table.insert(_string, string.sub(str, 1, j-1))
	end

	for i = j, string.len(str), 3 do
		local p = string.sub(str, i, i+2)
		table.insert(_string, p)
	end

	return table.concat(_string, ",")
end

--		          .         .                                                
--		         ,8.       ,8.                   .8.          8 888888888o   
--		        ,888.     ,888.                 .888.         8 8888    `88. 
--		       .`8888.   .`8888.               :88888.        8 8888     `88 
--		      ,8.`8888. ,8.`8888.             . `88888.       8 8888     ,88 
--		     ,8'8.`8888,8^8.`8888.           .8. `88888.      8 8888.   ,88' 
--		    ,8' `8.`8888' `8.`8888.         .8`8. `88888.     8 888888888P'  
--		   ,8'   `8.`88'   `8.`8888.       .8' `8. `88888.    8 8888         
--		  ,8'     `8.`'     `8.`8888.     .8'   `8. `88888.   8 8888         
--		 ,8'       `8        `8.`8888.   .888888888. `88888.  8 8888         
--		,8'         `         `8.`8888. .8'       `8. `88888. 8 8888         

-- Returns tile ID
function Map.getTileID(x, y, z)
	return getTileUseID(x, y, z)
end

-- Returns tile target ID
function Map.getTileUseID(x, y, z)
	return getTileUseTargetID(x, y, z)
end

-- Returns tile move ID
function Map.getTileMoveID(x, y, z)
	return getTileMoveID(x, y, z)
end

-- Returns if NPC is on tile
function Map.checkTile(x, y, z)
	return Map.getTileMoveID(x, y, z).id == 99 and Map.getTileMoveID(x, y, z).count == 1 and Map.getTileUseID(x, y, z).id == 99 and Map.getTileUseID(x, y, z).count == 1
end

-- Returns if tile is walkable
function Map.isTileWalkable(_x, _y, _z)
	local creatures = Creatures.findAllCreatures(false)

	for i = 1, #creatures do
		local cPos = Creatures.position(creatures[i])

		if (cPos.x == _x and cPos.y == _y and cPos.z == _z) then
			return false
		end
	end

	return getTileIsWalkable(_x, _y, _z)
end

-- Returns a position from direction
function Map.getDirection(dir)
	local pos = Player.pos()

	if (dir == "north") then pos = {x = pos.x, y = pos.y - 1, z = pos.z}
	elseif (dir == "east") then pos = {x = pos.x + 1, y = pos.y, z = pos.z}
	elseif (dir == "south") then pos = {x = pos.x, y = pos.y + 1, z = pos.z}
	elseif (dir == "west") then pos = {x = pos.x - 1, y = pos.y, z = pos.z}
	elseif (dir == "northeast") then pos = {x = pos.x + 1, y = pos.y - 1, z = pos.z}
	elseif (dir == "northwest") then pos = {x = pos.x - 1, y = pos.y - 1, z = pos.z}
	elseif (dir == "southeast") then pos = {x = pos.x + 1, y = pos.y + 1, z = pos.z}
	elseif (dir == "southwest") then pos = {x = pos.x - 1, y = pos.y + 1, z = pos.z} end

	return pos
end

-- Returns a direction based on two positions
function Map.getDirectionTo(pos1, pos2)
	if (pos1.x > pos2.x) then
		if (pos1.y > pos2.y) then
			return "northwest"
		elseif (pos1.y < pos2.y) then
			return "southwest"
		end

		return "west"
	elseif (pos1.x < pos2.x) then
		if (pos1.y > pos2.y) then
			return "northeast"
		elseif (pos1.y < pos2.y) then
			return "southeast"
		end

		return "east"
	else
		if (pos1.y > pos2.y) then
			return "north"
		end
	end

	return "south"
end

-- Returns distance to pos2 from pos1
function Map.getDistanceTo(pos1, pos2)
	return math.max(math.abs(pos1.x - pos2.x) + math.abs(pos1.y - pos2.y), 0)
end

-- Returns walkable tiles on-screen
function Map.getWalkableTiles(pos, range, monsters)
	local walkableTiles = {}
	local center = pos
	local range = (range > 7) and 7 or range

	-- Checks every tile around passed position
	for _x = -range, range do
		for _y = -range, range do
			if (Map.isTileWalkable(center.x + _x, center.y + _y, center.z)) then
				table.insert(walkableTiles, {x = center.x + _x, y = center.y + _y, z = center.z})
			end
		end
	end

	if (monsters) then
		for n, c in Creatures.iMonsters() do
			local mPos = Creatures.position(c)

			for i = 1, #walkableTiles do
				if (walkableTiles[i].x == mPos.x and walkableTiles[i].y == mPos.y) then
					table.remove(walkableTiles, i)
					break
				end
			end
		end
	end

	return walkableTiles
end

-- Returns a position based on direction
function Map.getPosFrom(pos, dir, range)
	return getPositionFromDirection(pos, dir, range or 1)
end

-- Uses an item with ground
function Map.useWithGround(id, x, y, z)
	return selfUseItemWithGround(id, x, y, z)
end

-- Uses an item from ground
function Map.useFromGround(x, y, z)
	return selfUseItemFromGround(x, y, z)
end

-- Goes to a label
function Map.goToLabel(label, relative)
	gotoLabel(label, relative and 1 or 0)
end

-- Returns if a tile is on-screen
function Map.isOnScreen(tPos)
	local myPos = Player.pos()

	return math.abs(myPos.x - tPos.x) < 7 and math.abs(myPos.y - tPos.y) < 5
end

-- Returns timezone offset
function Map.getTimeOffset()
	local currentTime = os.time()
	local utcDate = os.date("!*t", currentTime)
	local localDate = os.date("*t", currentTime)

	localDate.isdst = false

	return os.time(localDate) - os.time(utcDate), currentTime
end

-- Returns time to server save in seconds
function Map.getTimeToServerSave()
	local offset, time = Map.getTimeOffset()
	local timeNowTable = os.date("*t", time)
	local dst = timeNowTable.isdst and 7200 or 3200
	local targetTime = {year = timeNowTable.year, month = timeNowTable.month, day = timeNowTable.day, hour = 10, min = 0}
	local secondsLeft = (os.time(targetTime) - (time + dst) + offset)

	if (secondsLeft < 0) then
		secondsLeft = 86400 + secondsLeft
	end

	return math.floor(secondsLeft)
end

-- Returns if a tile is reachable
function Map.isTileReachable(sPos, tPos, discovered, t)
	veryUnsafeFunctionEnterCriticalMode()

	-- Checks if current tile checked was checked
	local function isTileDiscovered(discovered, search)
		for i = 1, #discovered do
			if (discovered[i].x == search.x and discovered[i].y == search.y and discovered[i].z == search.z) then
				return true
			end
		end

		return false
	end

	-- Checks if current tile checked is the target tile
	local function isTileTarget(target, search)
		if (target.x == search.x and target.y == search.y and target.z == search.z) then
			return true
		end

		return false
	end

	-- DFS
	local function isTileReachable(sPos, tPos, discovered, t)
		local newT = {}
	
		if (#t == 0) then
			return false
		end
		
		for i = 1, #t do
			if (math.abs(t[i].x - sPos.x) < 7 and math.abs(t[i].y - sPos.y) < 5) then
				for _x = -1, 1 do
					for _y = -1, 1 do
						local p = {x = t[i].x + _x, y = t[i].y + _y, z = t[i].z}

						if (getTileIsWalkable(p.x, p.y, p.z) and not isTileDiscovered(discovered, p)) then
							table.insert(discovered, p)
							table.insert(newT, p)

							if (isTileTarget(tPos, p)) then
								return true
							end
						end
					end
				end
			end
		end

		return isTileReachable(sPos, tPos, discovered, newT)
	end

	local success = isTileReachable(sPos, tPos, discovered, t)

	veryUnsafeFunctionExitCriticalMode()
	return success
end

--		    ,o888888o.        ,o888888o.     b.             8 8888888 8888888888   .8.           8 8888 b.             8 8 8888888888   8 888888888o.     d888888o.   
--		   8888     `88.   . 8888     `88.   888o.          8       8 8888        .888.          8 8888 888o.          8 8 8888         8 8888    `88.  .`8888:' `88. 
--		,8 8888       `8. ,8 8888       `8b  Y88888o.       8       8 8888       :88888.         8 8888 Y88888o.       8 8 8888         8 8888     `88  8.`8888.   Y8 
--		88 8888           88 8888        `8b .`Y888888o.    8       8 8888      . `88888.        8 8888 .`Y888888o.    8 8 8888         8 8888     ,88  `8.`8888.     
--		88 8888           88 8888         88 8o. `Y888888o. 8       8 8888     .8. `88888.       8 8888 8o. `Y888888o. 8 8 888888888888 8 8888.   ,88'   `8.`8888.    
--		88 8888           88 8888         88 8`Y8o. `Y88888o8       8 8888    .8`8. `88888.      8 8888 8`Y8o. `Y88888o8 8 8888         8 888888888P'     `8.`8888.   
--		88 8888           88 8888        ,8P 8   `Y8o. `Y8888       8 8888   .8' `8. `88888.     8 8888 8   `Y8o. `Y8888 8 8888         8 8888`8b          `8.`8888.  
--		`8 8888       .8' `8 8888       ,8P  8      `Y8o. `Y8       8 8888  .8'   `8. `88888.    8 8888 8      `Y8o. `Y8 8 8888         8 8888 `8b.    8b   `8.`8888. 
--		   8888     ,88'   ` 8888     ,88'   8         `Y8o.`       8 8888 .888888888. `88888.   8 8888 8         `Y8o.` 8 8888         8 8888   `8b.  `8b.  ;8.`8888 
--		    `8888888P'        `8888888P'     8            `Yo       8 8888.8'       `8. `88888.  8 8888 8            `Yo 8 888888888888 8 8888     `88. `Y8888P ,88P' 

Cont.__index = Cont

-- Returns a new container object
function Cont.createNew(value)
	local c = {}
	local isString = type(value) == "string"
	
	if (value == nil or type(value) == "boolean") then
		c._index = -1
	else
		setmetatable(c, Cont)
		if (isString or value > 99) then
			local index = -1
			while (index < 16) do
				index = index + 1
				if (getContainerOpen(index)) then
					local name = isString and value or Item.getItemName(value)
					if (getContainerName(index) == String.titleCase(name)) then
						break
					end
				end
			end
			value = index
		end
		c._index = getContainerOpen(value) and value or -1
	end

	return c
end

setmetatable(Cont, {__call = function(_, ...) return Cont.createNew(...) end})

-- Returns container name
function Cont.getName(index)
	local c = type(index) == "table" and index or Cont.createNew(index)
	return getContainerName(c._index)
end	

-- Returns a container object from first container
function Cont.getFirst()
	for i = 0, 15 do
		if (Cont.isOpen(i)) then
			return i
		end
	end

	return Cont.createNew(0)
end

-- Returns a container object from last container
function Cont.getLast()
	for i = 15, 0, -1 do
		if (Cont.isOpen(i)) then
			return i
		end
	end

	return Cont.createNew(0)
end

-- Returns container's ID
function Cont.getID(index)
	local c = type(index) == "table" and index or Cont.createNew(index)
	return getContainerID(c._index)
end

-- Creates a container object from name
function Cont.getByName(name)
	for i = 15, 0, -1 do
		if (Cont.isOpen(i) and string.lower(Cont.getName(i)) == string.lower(name)) then
			return i
		end
	end

	return nil
end

-- Returns item data from a spot
function Cont.getItemDataFromSpot(index, spot)
	local c = type(index) == "table" and index or Cont.createNew(index)
	return getContainerSpotData(c._index, spot)
end

-- Goes to a previous container
function Cont.goBack(index)
	local c = type(index) == "table" and index or Cont.createNew(index)
	return containerBack(c._index)
end

-- Returns if container is open
function Cont.isOpen(index)
	local c = type(index) == "table" and index or Cont.createNew(index)
	return getContainerOpen(c._index)
end

-- Minimizes a container
function Cont.minimize(index)
	local c = type(index) == "table" and index or Cont.createNew(index)
	return minimizeContainer(c._index)
end

-- Returns taken slots in container
function Cont.itemCount(index)
	local c = type(index) == "table" and index or Cont.createNew(index)
	return getContainerItemCount(c._index)
end

-- Returns container item capacity
function Cont.itemCapacity(index)
	local c = type(index) == "table" and index or Cont.createNew(index)
	return getContainerItemCapacity(c._index)
end

-- Returns number of items in a container
function Cont.countItemsOfID(index, name)
	local c = type(index) == "table" and index or Cont.createNew(index)
	local _id = Item.getItemID(name)
	local amount = 0

	for spot = 0, Cont.itemCount(c._index) - 1 do
		local item = Cont.getItemDataFromSpot(c._index, spot)
		if (item.id == _id) then
			amount = amount + math.max(item.count, 1)
		end
	end

	return amount
end

-- Moves item from container to ground
function Cont.moveItemToGround(container, spot, x, y, z, count)
	local c = type(container) == "table" and container or Cont.createNew(container)
	return containerMoveItemToGround(c._index, spot, x, y, z, count or -1)
end

-- Moves item from container to another container
function Cont.moveItemToContainer(containerFrom, containerTo, spotFrom, spotTo, count)
	local c = type(containerFrom) == "table" and containerFrom or Cont.createNew(containerFrom)
	local c2 = type(containerTo) == "table" and containerTo or Cont.createNew(containerTo)
	return containerMoveItemToContainer(c._index, spotFrom, c2._index, spotTo, count or -1)
end

-- Uses an item in a specific spot in the container
function Cont.useItemFromContainer(index, spot, sameWindow, keep)
	local c = type(index) == "table" and index or Cont.createNew(index)
	return containerUseItem(c._index, spot, sameWindow or false, keep or true)
end

-- Moves item to equipment slot
function Cont.moveItemToEquipment(index, spot, slot, count)
	local c = type(index) == "table" and index or Cont.createNew(index)
	return containerMoveItemToSlot(c._index, spot, slot, count or -1)
end
	
-- Returns found containers in another container
function Cont.findContainers(index)
	local c = type(index) == "table" and index or Cont.createNew(index)
	local cont = {}

	for spot = 0, Cont.itemCount(c._index) - 1 do
		local item = Cont.getItemDataFromSpot(c._index, spot)

		if (Item.isContainer(item.id)) then
			table.insert(cont, {container = item.id, spot = spot})
		end
	end

	return cont
end

-- Returns if two containers are the same
function Cont.compareContainers(index1, index2)
	local itemCount1 = Cont.itemCount(index1)
	local itemCount2 = Cont.itemCount(index2)
	
	-- Different item count, return false
	if (itemCount1 ~= itemCount2) then
		return false
	-- Different names, return false
	elseif (Cont.getName(index1) ~= Cont.getName(index2)) then
		return false
	-- Different items on certain spots, return false
	else
		for spot = 0, itemCount1 do
			local item1 = Cont.getItemDataFromSpot(index1, spot)
			local item2 = Cont.getItemDataFromSpot(index2, spot)

			if (item1.id ~= item2.id or item1.count ~= item2.count) then
				return false
			end
		end
	end

	return true
end

-- Returns number of opened containers
function Cont.getContainers()
	local indexes = {}

	for i = 15, 0, -1 do
		if (Cont.isOpen(i)) then
			table.insert(indexes, i)
		end
	end

	return indexes
end

-- Closes every container
function Cont.closeContainers(callback)
	Callback.setTimeout(function()
		local containers = Cont.getContainers()
		
		if (#containers > 0) then
			Cont.closeContainers(callback)
		else
			callback()
			return true
		end
		
		for i = 15, 0, -1 do
			if (Cont.isOpen(i)) then
				closeContainer(i)
				break
			end
		end
	end, Delay.pingDelay(DELAY.CLOSE_CONTAINER))
end

-- Finds an item in container
function Cont.findInContainer(index, item)
	local _id = Item.getItemID(item)
	local c = type(index) == "table" and index or Cont.createNew(index)

	for spot = 0, Cont.itemCount(c._index) - 1 do
		local item = Cont.getItemDataFromSpot(c, spot).id

		if (item == _id) then
			return spot
		end
	end

	return nil
end

-- Finds an item in every container
function Cont.findInContainers(item)
	local _id = Item.getItemID(item)

	for i = 0, 15 do
		if (Cont.isOpen(i)) then
			for spot = 0, Cont.itemCount(i) - 1 do
				local item = Cont.getItemDataFromSpot(i, spot).id

				if (item == _id) then
					return i, spot
				end
			end
		end
	end

	return nil
end

-- Waits for an update on container
function Cont.onContainerUpdate(container, callback)
	local timeout = nil
	local success = nil

	-- Timeout in case something goes wrong
	timeout = Callback.setTimeout(function()
		Callback.clearCondition(EVENT_CONTAINER, success)
		Channel.warn("Timeout passed - Cont.onContainerUpdate")

		callback(false)
		return
	end, Delay.pingDelay(DELAY.CONTAINER_TIMEOUT))

	success = Callback.setCondition(EVENT_CONTAINER, tostring(container), function(index, name, id)
		Callback.clearTimeout(timeout)

		Callback.setTimeout(function()
			callback(true)
			return
		end, Delay.pingDelay(DELAY.USE_ITEM))
	end)
end

--		8 8888 8888888 8888888888 8 8888888888            ,8.       ,8.            d888888o.   
--		8 8888       8 8888       8 8888                 ,888.     ,888.         .`8888:' `88. 
--		8 8888       8 8888       8 8888                .`8888.   .`8888.        8.`8888.   Y8 
--		8 8888       8 8888       8 8888               ,8.`8888. ,8.`8888.       `8.`8888.     
--		8 8888       8 8888       8 888888888888      ,8'8.`8888,8^8.`8888.       `8.`8888.    
--		8 8888       8 8888       8 8888             ,8' `8.`8888' `8.`8888.       `8.`8888.   
--		8 8888       8 8888       8 8888            ,8'   `8.`88'   `8.`8888.       `8.`8888.  
--		8 8888       8 8888       8 8888           ,8'     `8.`'     `8.`8888.  8b   `8.`8888. 
--		8 8888       8 8888       8 8888          ,8'       `8        `8.`8888. `8b.  ;8.`8888 
--		8 8888       8 8888       8 888888888888 ,8'         `         `8.`8888. `Y8888P ,88P' 

-- Returns item cost
function Item.getCost(item)
	return getItemCost(Item.getItemID(item))
end

-- Returns item value
function Item.getValue(item)
	return getItemValue(Item.getItemID(item))
end

-- Returns equipped item data
function Item.eqData(arg)
	if (arg == "head") then
		return getHeadSlotData()
	elseif (arg == "armor") then
		return getArmorSlotData()
	elseif (arg == "legs") then
		return getLegsSlotData()
	elseif (arg == "feet") then
		return getFeetSlotData()
	elseif (arg == "amulet") then
		return getAmuletSlotData()
	elseif (arg == "weapon") then
		return getWeaponSlotData()
	elseif (arg == "ring") then
		return getRingSlotData()
	elseif (arg == "backpack") then
		return getBackpackSlotData()
	elseif (arg == "shield") then
		return getShieldSlotData()
	elseif (arg == "ammo") then
		return getAmmoSlotData()
	end
end

-- Returns item id
function Item.getItemID(input)
	return (type(input) == "number" and input) or getItemIDByName(input)
end

-- Returns item name
function Item.getItemName(input)
	return (type(input) == "string" and input) or getItemNameByID(input)
end

-- Returns amount of item
function Item.count(item, eq)
	veryUnsafeFunctionEnterCriticalMode()

	local equipmentSlots = {"head", "amulet", "backpack", "armor", "shield", "weapon", "legs", "feet", "ring", "ammo"}
	local countEq = eq or false
	local itemID = Item.getItemID(item)
	local amount = 0

	if (countEq) then
		for i = 1, #equipmentSlots do
			local slot = Item.eqData(equipmentSlots[i])
			if (slot.id == itemID) then
				amount = amount + math.max(slot.count, 1)
			end
		end
	end
	
	for i = 0, 15 do
		if (Cont.isOpen(i)) then
			amount = amount + Cont.countItemsOfID(i, itemID)
		end
	end
	
	veryUnsafeFunctionExitCriticalMode()
	return amount
end

-- Returns if item count is equal or smaller than x
function Item.compareCount(item, count, equal)
	local equal = equal or false
	local amount = Item.count(item, true)

	-- Make sure to include the ring
	if (Item.activeRingID(item) ~= item) then
		amount = amount + Item.count(Item.activeRingID(item), true)
	end

	if (equal) then
		if (amount <= count) then
			return amount
		end
	else
		if (amount < count) then
			return amount
		end
	end

	return false
end

-- Returns if item is stackable
function Item.isStackable(id)
	local id = Item.getItemID(id)

	return isItemStackable(id)
end

-- Returns if item is nonstackable
function Item.isNonStackable(id)
	local id = Item.getItemID(id)

	return not isItemStackable(id)
end

-- Returns if item is a gold coin
function Item.isGold(id)
	local id = Item.getItemID(id)

	if (id == 3031 or id == 3035 or id == 3043) then
		return true
	end

	return false
end

-- Returns if item is a corpse
function Item.isCorpse(cont)
	local contId = Cont.getID(cont)
	local contName = string.lower(Cont.getName(cont))

	if (isItemCorpse(contId)) then
		return true
	end

	for _, name in pairs(HUD["Corpses"]) do
		if (string.find(contName, name)) then
			return true
		end
	end

	return false
end

-- Returns if item is a container
function Item.isContainer(id)
	local id = Item.getItemID(id)

	return isItemContainer(id)
end

-- Returns active ring id
function Item.activeRingID(id)
	local id = Item.getItemID(id)
	local rings = {
		[3049] = 3086,
		[3050] = 3087,
		[3051] = 3088,
		[3052] = 3089,
		[3053] = 3090,
		[3091] = 3094,
		[3092] = 3095,
		[3093] = 3096,
		[3097] = 3099,
		[3098] = 3100,
		[6299] = 6300,
		[9393] = 9392,
		[16114] = 16264
	}

	return rings[id] or id
end

-- Returns inactive ring id
function Item.inactiveRingID(id)
	local id = Item.getItemID(id)
	local rings = {
		[3086] = 3049,
		[3087] = 3050,
		[3088] = 3051,
		[3089] = 3052,
		[3090] = 3053,
		[3094] = 3091,
		[3095] = 3092,
		[3096] = 3093,
		[3099] = 3097,
		[3100] = 3098,
		[6300] = 6299,
		[9392] = 9393,
		[16264] = 16114
	}

	return rings[id] or id
end

-- Equips an item
function Item.equip(id, slot, count)
	local _id = Item.getItemID(id)
	local count = count or 1
	
	-- Finds an item and equips it
	for i = 0, 15 do
		if (Cont.isOpen(i)) then
			for spot = 0, Cont.itemCount(i) - 1 do
				local item = Cont.getItemDataFromSpot(i, spot)

				if (item.id == _id) then
					if (slot == "ring" and Item.eqData("ring").id ~= Item.activeRingID(id) or slot == "amulet" and Item.eqData("amulet").id ~= _id) then
						Cont.moveItemToEquipment(i, spot, slot, count)
						return
					elseif (slot == "ring" and Item.eqData("ring").id == Item.activeRingID(id) or slot == "amulet" and Item.eqData("amulet").id == _id) then
						return
					else
						Cont.moveItemToEquipment(i, spot, slot, count)
						return
					end
				end
			end
		end
	end
end

-- Dequips an item
function Item.dequip(slot, dest)
	local c = type(dest) == "table" and dest or Cont.createNew(dest)
	return slotMoveItemToContainer(slot, c._index, Cont.itemCapacity(c) -1)
end

-- Uses an item from equipment
function Item.useFromEquipment(slot, callback)
	local equipmentSlots = {"head", "amulet", "backpack", "armor", "shield", "weapon", "legs", "feet", "ring", "ammo"}
	local contains, index = Table.contains(equipmentSlots, slot)

	if (slot ~= "backpack") then
		slotUseItem(index)
		callback()
		return 
	end

	slotUseItem(index)

	-- Backpack case, wait till it's opened
	Cont.onContainerUpdate(0, function()
		callback()
		return true
	end)
end

--		8 888888888o   8 8888                  .8.   `8.`8888.      ,8' 8 8888888888   8 888888888o.   
--		8 8888    `88. 8 8888                 .888.   `8.`8888.    ,8'  8 8888         8 8888    `88.  
--		8 8888     `88 8 8888                :88888.   `8.`8888.  ,8'   8 8888         8 8888     `88  
--		8 8888     ,88 8 8888               . `88888.   `8.`8888.,8'    8 8888         8 8888     ,88  
--		8 8888.   ,88' 8 8888              .8. `88888.   `8.`88888'     8 888888888888 8 8888.   ,88'  
--		8 888888888P'  8 8888             .8`8. `88888.   `8. 8888      8 8888         8 888888888P'   
--		8 8888         8 8888            .8' `8. `88888.   `8 8888      8 8888         8 8888`8b       
--		8 8888         8 8888           .8'   `8. `88888.   8 8888      8 8888         8 8888 `8b.     
--		8 8888         8 8888          .888888888. `88888.  8 8888      8 8888         8 8888   `8b.   
--		8 8888         8 888888888888 .8'       `8. `88888. 8 8888      8 888888888888 8 8888     `88. 

-- Returns player name
function Player.name()
	return getCreatureName(getCreatureListIndex(getSelfID()))
end

-- Returns player stamina in seconds
function Player.normalStamina()
	return getSelfStamina()
end

-- Returns player stamina in string h:m
function Player.stamina()
	local stamina = Player.normalStamina()
	local staminaH = math.floor(stamina / 60)
	local staminaM = math.floor(stamina % 60)

	return string.format("%02.f:%02.f", staminaH, staminaM)
end

-- Returns player level
function Player.level()
	return getSelfLevel()
end

-- Returns player experience
function Player.experience()
	return getSelfExperience()
end

-- Returns player experience to next level
function Player.experienceToNext()
	local lvl = Player.level()
	local expToNext = math.floor((50 * lvl * lvl * lvl - 150 * lvl * lvl + 400 * lvl) / 3)

	return math.max(expToNext - Player.experience(), 0)
end

-- Returns player health points
function Player.hp(arg)
	return arg and getSelfMaxHealth() or getSelfHealth()
end

-- Returns player percent health points
function Player.percentHp()
	return (getSelfHealth() / getSelfMaxHealth()) * 100
end

-- Returns player percent mana points
function Player.percentMp()
	return (getSelfMana() / getSelfMaxMana()) * 100
end

-- Returns player mana points
function Player.mp(arg)
	return arg and getSelfMaxMana() or getSelfMana()
end

-- Returns player capacity
function Player.cap()
	return math.floor(getSelfCap())
end

-- Returns player ping
function Player.ping()
	return getSelfPing()
end

-- Returns player vocation
function Player.vocation()
	local maxHp = Player.hp(true)
	local maxMp = Player.mp(true)
	local level = Player.level()
	local legs = Item.eqData("legs").id
	local armor = Item.eqData("armor").id
	local weapon = Item.eqData("weapon").id
	local HP = {
		Knight = 5 * (3 * level - (2 * 8) + 29),
		Paladin = 5 * (2 * level - 8 + 29),
		Mage = 5 * (level + 29)
	}
	local MP = {
		Knight = 5 * level + 50,
		Paladin = 5 * ((3 * level) - (2 * 8)) + 50,
		Mage = 5 * ((6 * level) - (5 * 8)) + 50
	}
	local KnightEQ = {
		Legs = {13999},
		Armor = {13993, 8061, 8056, 8054, 8053, 8862, 8055, 11686},
		WeaponAxe = {665, 666, 667, 668, 669, 684, 685, 686, 687, 688, 784, 785, 786, 787, 788, 801, 802, 803, 804, 805, 919, 3266, 3268, 3269, 3274, 3275, 3276, 3293, 3302, 3303, 3306, 3313, 3314, 3315, 3316, 3317, 3318, 3319, 3320, 3323, 3328, 3329, 3331, 3335, 3342, 3344, 3346, 6553, 7380, 7388, 7389, 7411, 7412, 7413, 7419, 7420, 7433, 7434, 7435, 7436, 7453, 7454, 7455, 7456, 7773, 8096, 8097, 8098, 9384, 9386, 10388, 10406, 12683, 13991, 14040, 14043, 14089, 16161, 20070, 20071, 20072, 20073, 20074, 20075, 21174, 21176, 21180},
		WeaponSword = {660, 661, 662, 663, 664, 679, 680, 681, 682, 683, 779, 780, 781, 782, 783, 794, 795, 796, 797, 798, 860, 3264, 3265, 3267, 3271, 3272, 3273, 3278, 3280, 3281, 3283, 3284, 3285, 3288, 3290, 3291, 3292, 3294, 3295, 3296, 3297, 3299, 3300, 3301, 3307, 3308, 3326, 3330, 3334, 3338, 3339, 3345, 6527, 7382, 7383, 7384, 7385, 7386, 7390, 7391, 7402, 7403, 7404, 7405, 7406, 7407, 7408, 7416, 7417, 7418, 7449, 7774, 8102, 8103, 8104, 9375, 9387, 9396, 10389, 10390, 10392, 11657, 11693, 12673, 16160, 16175, 17812, 20064, 20065, 20066, 20067, 20068, 20069, 21177, 21179},
		WeaponClub = {670, 671, 672, 673, 674, 689, 690, 691, 692, 693, 789, 790, 791, 792, 793, 806, 807, 808, 809, 810, 3208, 3270, 3279, 3282, 3286, 3289, 3304, 3305, 3309, 3310, 3311, 3312, 3321, 3322, 3324, 3325, 3327, 3332, 3333, 3336, 3337, 3340, 3341, 3343, 3348, 3453, 7379, 7381, 7387, 7392, 7409, 7410, 7414, 7415, 7421, 7422, 7423, 7424, 7425, 7426, 7427, 7428, 7429, 7430, 7431, 7432, 7437, 7450, 7451, 7452, 8099, 8100, 8101, 9373, 9376, 9385, 10391, 11692, 13987, 14001, 14250, 16162, 17813, 17824, 17828, 17859, 20076, 20077, 20078, 20079, 20080, 20081, 21171, 21172, 21173, 21178, 21219}
	}
	local PaladinEQ = {
		Legs = {8095, 8863, 16111},
		Armor = {8044, 3394, 8059, 13994, 8057, 3571, 8063, 8060, 8058},
		Weapon = {904, 1781, 2992, 3277, 3287, 3298, 3347, 3349, 3350, 5803, 7366, 7367, 7368, 7378, 7438, 8021, 8022, 8023, 8024, 8025, 8026, 8027, 8028, 8029, 8030, 9378, 14246, 14247, 14768, 16163, 16164, 19356, 19362, 20082, 20083, 20084, 20085, 20086, 20087, 21158}
	}
	local SorcererEQ = {
		Armor = {8039, 8062, 8040, 8037},
		Weapon = {3074, 3075, 3072, 8093, 3073, 3071, 12603, 8092, 8094, 16096, 16115}
	}
	local DruidEQ = {
		Armor = {8041, 8038},
		Weapon = {3066, 3070, 3069, 8083, 3065, 3067, 8084, 8082, 16117, 16118}
	}

	if (HP.Knight == maxHp and MP.Knight == maxMp) then
		return "knight"
	elseif (HP.Paladin == maxHp and MP.Paladin == maxMp) then
		return "paladin"
	elseif (HP.Mage == maxHp and MP.Mage == maxMp) then
		if (Table.contains(DruidEQ.Armor, armor) or Table.contains(DruidEQ.Weapon, weapon)) then
			return "druid"
		elseif (Table.contains(SorcererEQ.Armor, armor) or Table.contains(SorcererEQ.Weapon, weapon)) then
			return "sorcerer"
		else
			return "mage"
		end
	elseif (Table.contains(DruidEQ.Armor, armor) or Table.contains(DruidEQ.Weapon, weapon)) then
		return "druid"
	elseif (Table.contains(SorcererEQ.Armor, armor) or Table.contains(SorcererEQ.Weapon, weapon)) then
		return "sorcerer"
	elseif (Table.contains(PaladinEQ.Legs, legs) or Table.contains(PaladinEQ.Armor, armor) or Table.contains(PaladinEQ.Weapon, weapon)) then
		return "paladin"
	elseif (Table.contains(KnightEQ.Legs, legs) or Table.contains(KnightEQ.Armor, armor) or Table.contains(KnightEQ.WeaponAxe, weapon) or Table.contains(KnightEQ.WeaponSword, weapon) or Table.contains(KnightEQ.WeaponClub, weapon)) then
		return "knight"
	else
		return "none"
	end
end

-- Returns shovel id
function Player.getShovel()
	if (Item.count(3457) > 0) then return 3457				-- Shovel
	elseif (Item.count(5710) > 0) then return 5710			-- Light shovel
	elseif (Item.count(9594) > 0) then return 9594			-- Sneaky Stabber of Eliteness
	elseif (Item.count(9596) > 0) then return 9596			-- Squeezing Gear of Girlpower
	elseif (Item.count(9599) > 0) then return 9599			-- Whacking Driller of Fate
	else return nil
	end
end

-- Returns machete id
function Player.getMachete()
	if (Item.count(3308) > 0) then return 3308				-- Machete
	elseif (Item.count(3330) > 0) then return 3330			-- Heavy machete
	elseif (Item.count(9594) > 0) then return 9594			-- Sneaky Stabber of Eliteness
	elseif (Item.count(9596) > 0) then return 9596			-- Squeezing Gear of Girlpower
	elseif (Item.count(9599) > 0) then return 9599			-- Whacking Driller of Fate
	else return nil
	end
end

-- Changes walker state
function Player.walker(arg)
	setWalkerEnabled(arg)
	Player.targetingIgnoring(SCRIPT_DATA["IsIgnoring"])
	Player.targetingLuring(SCRIPT_DATA["IsLuring"])
end

-- Changes targeting state
function Player.targeting(arg)
	return setTargetingEnabled(arg)
end

-- Changes looter state
function Player.looter(arg)
	return setLooterEnabled(arg)
end

-- Delays walker
function Player.delayWalker(time)
	return delayWalker(time)
end

-- Returns player position
function Player.pos()
	return Self.Position()
end

-- Walks to a tile
function Player.walkTo(x, y, z, callback, timeout)
	doSelfWalkTo(x, y, z)
	local time = os.time()
	
	-- Checks if position was reached
	local function checkPos()
		local pos = Player.pos()

		Callback.setTimeout(function()
			if (pos.x == x and pos.y == y and pos.z == z or not Map.isTileWalkable(x, y, z) or not Map.isTileReachable(pos, {x = x, y = y, z = z}, {}, {pos}) or timeout and os.difftime(os.time(), time) >= timeout) then
				callback()
				return true
			else
				checkPos()
			end
		end, Delay.pingDelay(DELAY.CHECK_POS))
	end

	checkPos()
end

-- Changes targeting type for lurer event
function Player.lureTargeting(cond)
	if (cond) then
		Player.targetingIgnoring(false)
		Player.targeting(false)
	else
		Player.targetingIgnoring(true)
		Player.targeting(true)
	end
end

-- Changes targeting to normal settings
function Player.normalTargeting()
	Player.targetingIgnoring(false)
	Player.targetingLuring(false)
	Player.targeting(true)
end

-- Changes targeting type of ignoring
function Player.targetingIgnoring(arg)
	if (arg) then
		SCRIPT_DATA["IsIgnoring"] = true
		setTargetingIgnoreEnabled(true)
	else
		SCRIPT_DATA["IsIgnoring"] = false
		setTargetingIgnoreEnabled(false)
	end
end

-- Changes targeting type of luring
function Player.targetingLuring(arg)
	if (arg) then
		SCRIPT_DATA["IsLuring"] = true
		setWalkerLureEnabled(true)
	else
		SCRIPT_DATA["IsLuring"] = false
		setWalkerLureEnabled(false)
	end
end

-- Returns spell cooldown
function Player.spellCooldown(spell)
	return getSelfSpellCooldown(spell)
end

-- Returns current look direction
function Player.lookDirection()
	return getSelfLookDirection()
end

-- Turns a player
function Player.turn(dir)
	return doSelfTurn(dir)
end

-- Returns amount of flasks in every container
function Player.countFlasks()
	return Item.count(283) + Item.count(284) + Item.count(285)
end

-- Returns amount of gold in every container
function Player.countMoney()
	return Item.count(3031) + (Item.count(3035) * 100) + (Item.count(3043) * 10000)
end

-- Casts a spell
function Player.castSpell(spell, callback)
	if (Player.spellCooldown(spell) == 0) then
		selfSay(spell)
		callback()
	else
		Callback.setTimeout(function()
			Player.castSpell(spell, callback)
		end, Delay.pingDelay(200))
	end
end

-- Heals conditions
function Player.cureConditions(index)
	local conds = {}
	table.insert(conds, {name = "poisoned", spell = "exana pox", voc = {["k"] = true, ["p"] = true, ["s"] = true, ["d"] = true}})
	table.insert(conds, {name = "bleeding", spell = "exana kor", voc = {["k"] = true, ["d"] = true}})
	table.insert(conds, {name = "cursed", spell = "exana mort", voc = {["p"] = true}})
	table.insert(conds, {name = "burning", spell = "exana flam", voc = {["d"] = true}})
	table.insert(conds, {name = "electrified", spell = "exana vis", voc = {["d"] = true}})

	if (index <= #conds) then
		local data = conds[index]

		if (getSelfFlag(data.name)) then
			Player.castSpell(data.spell, function()
				Callback.setTimeout(function()
					Player.cureConditions(index+1)
				end, Delay.pingDelay(2000))
			end)
		else
			Player.cureConditions(index+1)
		end
	end
end

-- Says text to npc
function Player.say(msg, callback)
	local msgCount = #msg

	if (msgCount == 0) then
		callback()
		return
	end
	
	local function sayMsg(index)
		local message = msg[index]

		if (not message) then
			callback()
			return
		end

		Callback.setTimeout(function()
			if (index == msgCount) then
				callback()
			else
				sayMsg(index + 1)
			end
		end, Delay.pingDelay(DELAY.TALK_NPC))
		
		selfNpcSay(message)
	end
	
	sayMsg(1)
end

-- Steps in a direction
function Player.step(dir)
	Player.delayWalker(1000)

	local resume = SCRIPT_DATA["IsIgnoring"] or false

	Player.targetingIgnoring(true)
	
	local dirs = {
		["north"] = 0,
		["east"] = 1,
		["south"] = 2,
		["west"] = 3,
		["southwest"] = 4,
		["southeast"] = 5,
		["northwest"] = 6,
		["northeast"] = 7
	}
	
	doSelfStep(dirs[string.lower(dir)])
	
	Callback.setTimeout(function()
		Player.delayWalker(0)

		Callback.setTimeout(function()
			if (SCRIPT_DATA["IsIgnoring"]) then
				Player.targetingIgnoring(resume)
			end
		end, Delay.pingDelay(DELAY.TARGETING_RESUME))
	end, Delay.pingDelay(200))
end

-- Uses an item from position
function Player.use(dir)
	local pos = Map.getDirection(dir)

	Map.useFromGround(pos.x, pos.y, pos.z)
end

--- Uses an item with direction
function Player.useWith(dir, item)
	local resume = SCRIPT_DATA["IsIgnoring"] or false
	Player.targetingIgnoring(true)

	local cont = BACKPACKS["SuppliesBackpack"].index or BACKPACKS["MainBackpack"].index
	local item = Item.getItemID(item)
	local pos = Map.getDirection(dir)
	local spot = Cont.findInContainer(cont, item)

	if (not spot) then
		return
	end

	Map.useWithGround(item, pos.x, pos.y, pos.z)

	Callback.setTimeout(function()
		if (SCRIPT_DATA["IsIgnoring"]) then
			Player.targetingIgnoring(resume)
		end
	end, Delay.pingDelay(DELAY.TARGETING_RESUME))
end

--- Hole digger
function Player.hole(dir)
	local pos = Map.getDirection(dir)
	local shovel = Player.getShovel()
	local resume = SCRIPT_DATA["IsIgnoring"] or false

	Player.targetingIgnoring(true)

	local function dig()
		Player.delayWalker(2000)

		Callback.setTimeout(function()
			if (Map.getTileID(pos.x, pos.y, pos.z).id ~= 615) then
				Map.useWithGround(shovel, pos.x, pos.y, pos.z)
			else
				Player.delayWalker(0)

				Callback.setTimeout(function()
					if (SCRIPT_DATA["IsIgnoring"]) then
						Player.targetingIgnoring(resume)
					end
				end, Delay.pingDelay(DELAY.TARGETING_RESUME))
				return
			end

			dig()
		end, Delay.pingDelay(250))
	end

	dig()
end

-- Opens door
function Player.door(dir)
	local pos = Map.getDirection(dir)
	local resume = SCRIPT_DATA["IsIgnoring"] or false

	if (Map.isTileWalkable(pos.x, pos.y, pos.z)) then
		return
	end

	Player.targetingIgnoring(true)
	
	local function openDoor(dir)
		Player.delayWalker(2000)

		Callback.setTimeout(function()
			if (not Map.isTileWalkable(pos.x, pos.y, pos.z)) then
				Map.useFromGround(pos.x, pos.y, pos.z)
				openDoor(dir)
			else
				Player.delayWalker(0)

				Callback.setTimeout(function()
					if (SCRIPT_DATA["IsIgnoring"]) then
						Player.targetingIgnoring(resume)
					end
				end, Delay.pingDelay(DELAY.TARGETING_RESUME))
			end
		end, Delay.pingDelay(DELAY.USE_ITEM))
	end
	
	openDoor(dir)
end

-- Levitates in a direction
function Player.levitate(dir, level)
	local posZ = Player.pos().z
	local resume = SCRIPT_DATA["IsIgnoring"] or false
	local dirs = {
		["north"] = 0,
		["east"] = 1,
		["south"] = 2,
		["west"] = 3
	}

	Player.targetingIgnoring(true)
	
	local function doLevitate()
		Player.delayWalker(2000)

		Callback.setTimeout(function()
			if (Player.pos().z == posZ) then
				if (Player.lookDirection() ~= dirs[dir]) then
					Player.turn(dirs[dir])
					doLevitate()
				elseif (Player.spellCooldown("exani hur") == 0) then
					selfSay("exani hur " ..level)
					doLevitate()
				else
					doLevitate()
				end
			else
				Player.delayWalker(0)

				Callback.setTimeout(function()
					if (SCRIPT_DATA["IsIgnoring"]) then
						Player.targetingIgnoring(resume)
					end
				end, Delay.pingDelay(DELAY.TARGETING_RESUME))
			end
		end, Delay.pingDelay(DELAY.TURN))
	end
	
	doLevitate()
end

-- Drops an item on coordinates
function Player.drop(dir, item)
	Player.delayWalker(2000)
	local resume = SCRIPT_DATA["IsIgnoring"] or false

	Player.targetingIgnoring(true)

	Callback.setTimeout(function()
		local cont, spot = Cont.findInContainers(item)

		if (not cont or not spot) then
			Player.delayWalker(0)
			Player.targetingIgnoring(resume)
			return
		end

		local item = Cont.getItemDataFromSpot(cont, spot)

		Cont.moveItemToGround(cont, spot, x, y, z, math.min(amount, item.count))
		
		Callback.setTimeout(function()
			Player.delayWalker(0)

			Callback.setTimeout(function()
				Player.targetingIgnoring(resume)
			end, Delay.pingDelay(DELAY.TARGETING_RESUME))
		end, 200)
	end, Delay.pingDelay(DELAY.MOVE_ITEM))
end

-- Drops a soil on coordinates
function Player.dropSoil(x, y, z, dir)
	local resume = SCRIPT_DATA["IsIgnoring"] or false

	Player.targetingIgnoring(true)

	local cont = BACKPACKS["SuppliesBackpack"].index or BACKPACKS["MainBackpack"].index
	local pos = {x = x, y = y, z = z}
	local myPos = Player.pos()

	local function dropSoil()
		Player.delayWalker(3000)

		Callback.setTimeout(function()
			local _myPos = Player.pos()
			local _spot = nil

			for spot = 0, Cont.itemCount(cont) - 1 do
				local item = Cont.getItemDataFromSpot(cont, spot).id
				local name = Item.getItemName(item)

				if (string.find(string.lower(name), "soil")) then
					_spot = spot
					break
				end
			end

			if (math.abs(myPos.x - _myPos.x) < 3 and math.abs(myPos.y - _myPos.y) < 3 and myPos.z == _myPos.z) then
				Player.walkTo(myPos.x, myPos.y, myPos.z, function()
					Cont.moveItemToGround(cont, _spot, pos.x, pos.y, pos.z, 1)

					Callback.setTimeout(function()
						Player.step(dir)
						dropSoil()
					end, Delay.pingDelay(350))
				end)
			else
				Player.delayWalker(0)

				Callback.setTimeout(function()
					if (SCRIPT_DATA["IsIgnoring"]) then
						Player.targetingIgnoring(resume)
					end
				end, Delay.pingDelay(DELAY.TARGETING_RESUME))
			end
		end, Delay.pingDelay(DELAY.MOVE_ITEM))
	end

	dropSoil()
end

--- Destroys an item
function Player.destroy(dir)
	local pos = Map.getDirection(dir)
	local resume = SCRIPT_DATA["IsIgnoring"] or false

	Player.targetingIgnoring(true)

	local function destroyObject(dir)
		Player.delayWalker(2000)

		Callback.setTimeout(function()
			Map.useWithGround(3264, pos.x, pos.y, pos.z) -- Machete

			if (not Map.isTileWalkable(pos.x, pos.y, pos.z)) then
				destroyObject(dir)
			else
				Player.delayWalker(0)

				Callback.setTimeout(function()
					if (SCRIPT_DATA["IsIgnoring"]) then
						Player.targetingIgnoring(resume)
					end
				end, Delay.pingDelay(DELAY.TARGETING_RESUME))
			end
		end, Delay.pingDelay(DELAY.USE_ITEM))
	end

	if (not Map.isTileWalkable(pos.x, pos.y, pos.z)) then
		destroyObject(dir)
	else
		Callback.setTimeout(function()
			if (SCRIPT_DATA["IsIgnoring"]) then
				Player.targetingIgnoring(resume)
			end
		end, Delay.pingDelay(DELAY.TARGETING_RESUME))
	end
end

--- Uses a lever in Farmine
function Player.farmineLever(dir)
	local myPos = Player.pos()
	local leverPos = Map.getDirection(dir)
	local resume = SCRIPT_DATA["IsIgnoring"] or false

	Player.targetingIgnoring(true)

	local function checkPos()
		local curPos = Player.pos()

		Player.delayWalker(2000)

		Callback.setTimeout(function()
			if (math.abs(myPos.x - curPos.x) < 2 and math.abs(myPos.y - curPos.y) < 2 and myPos.z == curPos.z) then
				if (myPos.x ~= curPos.x or myPos.y ~= curPos.y) then
					Player.walkTo(myPos.x, myPos.y, myPos.z, function()
						Map.useFromGround(leverPos.x, leverPos.y, leverPos.z)
						checkPos()
					end)
				else
					Map.useFromGround(leverPos.x, leverPos.y, leverPos.z)
					checkPos()
				end
			else
				Player.delayWalker(0)
				
				Callback.setTimeout(function()
					if (SCRIPT_DATA["IsIgnoring"]) then
						Player.targetingIgnoring(resume)
					end
				end, Delay.pingDelay(DELAY.TARGETING_RESUME))
			end
		end, Delay.pingDelay(DELAY.USE_ITEM))
	end

	checkPos()
end

-- Restores mana to a specific value
function Player.restoreMana(potion, upTo, callback)
	local time = os.time()

	local function giveMana()
		local monsters = Creatures.findAllCreatures()

		Callback.setTimeout(function()
			if (#monsters < 3 and Creatures.targetID() == 0 and math.abs(Player.percentMp()) <= upTo and os.difftime(os.time(), time) < 20) then
				Player.delayWalker(300)
				local pos = Player.pos()

				Map.useWithGround(Item.getItemID(potion), pos.x, pos.y, pos.z)
				giveMana()
			else
				Player.delayWalker(0)
				callback()
			end
		end, Delay.pingDelay(DELAY.USE_ITEM))
	end

	giveMana()
end

--		    ,o888888o.    8 888888888o.   8 8888888888            .8.    8888888 8888888888 8 8888      88 8 888888888o.   8 8888888888      d888888o.   
--		   8888     `88.  8 8888    `88.  8 8888                 .888.         8 8888       8 8888      88 8 8888    `88.  8 8888          .`8888:' `88. 
--		,8 8888       `8. 8 8888     `88  8 8888                :88888.        8 8888       8 8888      88 8 8888     `88  8 8888          8.`8888.   Y8 
--		88 8888           8 8888     ,88  8 8888               . `88888.       8 8888       8 8888      88 8 8888     ,88  8 8888          `8.`8888.     
--		88 8888           8 8888.   ,88'  8 888888888888      .8. `88888.      8 8888       8 8888      88 8 8888.   ,88'  8 888888888888   `8.`8888.    
--		88 8888           8 888888888P'   8 8888             .8`8. `88888.     8 8888       8 8888      88 8 888888888P'   8 8888            `8.`8888.   
--		88 8888           8 8888`8b       8 8888            .8' `8. `88888.    8 8888       8 8888      88 8 8888`8b       8 8888             `8.`8888.  
--		`8 8888       .8' 8 8888 `8b.     8 8888           .8'   `8. `88888.   8 8888       ` 8888     ,8P 8 8888 `8b.     8 8888         8b   `8.`8888. 
--		   8888     ,88'  8 8888   `8b.   8 8888          .888888888. `88888.  8 8888         8888   ,d8P  8 8888   `8b.   8 8888         `8b.  ;8.`8888 
--		    `8888888P'    8 8888     `88. 8 888888888888 .8'       `8. `88888. 8 8888          `Y88888P'   8 8888     `88. 8 888888888888  `Y8888P ,88P' 

Creatures.__index = Creatures

-- Returns a new creature object
function Creatures.createNew(value)
	local c = {}
	setmetatable(c, Creatures)
	
	Creatures.__tostring = function(a)
		return Creatures.name(a)
	end
	Creatures.__eq = function(a, b)
		return Creatures.ID(a) == Creatures.ID(b)
	end
	
	if (value == nil) then
		c._id = -1
		c._listindex = -1
		c._name = ""
	else
		if (type(value) == "string") then
			c._name = value
			c._id = getCreatureID(value)
			c._listindex = getCreatureListIndex(c._id)
		elseif (type(value) == "number") then
			if (value < 1300) then
				value = getCreatureIDFromIndex(value)
			end
			
			c._id = value
			c._listindex = getCreatureListIndex(c._id)
			c._name = getCreatureName(c._listindex)
		end
	end

	return c
end

setmetatable(Creatures, {__call = function(_, ...) return Creatures.createNew(...) end})

-- missing
function Creatures.paramHelper(...)
	local params = {...}
	local distance = 10
	local sort = nil
	local checks = {}

	if (type(params[1]) == "table") then
		local function eq(a, b) return a == b end

		local function findFunction(name)
			if (name == "distance" or name == "dist") then
				return Creatures.distFromSelf
			end
			
			for k, v in pairs(Creatures) do
				if (string.lower(k) == name) then
					return v
				end
			end

			return nil
		end
		
		for k, v in pairs(params[1]) do
			local name = string.lower(k)

			if (name == "sort") then
				sort = v
			else
				local func = findFunction(name)
				local eq = eq
				local compare = v

				if (type(v) ~= "table") then
					compare = {}
					compare[1] = eq
					compare[2] = v
				end

				checks[#checks+1] = {func, compare}
			end
		end
	else
		distance = params[1] or 10
		sort = params[2]
	end

	return distance, sort, checks
end

-- missing
function Creatures.checkHelper(checks, creature)
	for _, check in ipairs(checks) do
		if (not check[2][1](check[1](creature), check[2][2])) then
			return false
		end
	end

	return true
end

-- missing
function Creatures.checkConstructor(params, check, value)
	local checks = {[check] = value}
	local function lt(a, b) return a < b end

	if (type(params[1]) == "table") then
		for k, v in pairs(params[1]) do
			checks[k] = v
		end
	else
		if (params[1]) then
			checks["distance"] = {lt, params[1]+1}
		end

		checks["sort"] = params[1]
	end

	return checks
end

-- Iterates through every possible creature
function Creatures.iCreatures(...)
	local distance, sort, checks = Creatures.paramHelper(...)
	local spectators = Creatures.getSpectators()
	local index = 1

	if (sort) then
		table.sort(spectators, sort)
	end

	return function()
		local cid = spectators[index]

		while (cid) do
			index = index + 1

			if (Creatures.distFromSelf(cid) <= distance and Creatures.checkHelper(checks, cid)) then
				return Creatures.name(cid), cid
			end

			cid = spectators[index]
		end

		return nil, nil
	end
end

-- Iterates through players
function Creatures.iPlayers(...)
	return Creatures.iCreatures(Creatures.checkConstructor({...}, "isplayer", true))
end

-- Iterates through monsters
function Creatures.iMonsters(...)
	return Creatures.iCreatures(Creatures.checkConstructor({...}, "ismonster", true))
end

-- Iterates through npcs
function Creatures.iNpcs(...)
	return Creatures.iCreatures(Creatures.checkConstructor({...}, "isnpc", true))
end

--- Returns if creature is a player
function Creatures.isPlayer(c)
	local _c = type(c) == "table" and c or Creatures.createNew(c)
	return Creatures.isValid(_c) and isCreaturePlayer(_c._listindex) or _c._id == getSelfID()
end

--- Returns if creature is a monster
function Creatures.isMonster(c)
	local _c = type(c) == "table" and c or Creatures.createNew(c)
	return Creatures.isValid(_c) and isCreatureMonster(_c._listindex)
end

--- Returns if creature is a npc
function Creatures.isNpc(c)
	local _c = type(c) == "table" and c or Creatures.createNew(c)
	return Creatures.isValid(_c) and isCreatureNpc(_c._listindex)
end

-- Returns if creature is targeted
function Creatures.isTarget(c)
	local _c = type(c) == "table" and c or Creatures.createNew(c)
	return _c._id == getSelfTargetID()
end

-- Returns current ID of targeted creature
function Creatures.targetID()
	return getSelfTargetID()
end

-- Returns every creature object
function Creatures.getSpectators(multiFloor)
	local t = {}
	local spec = {getCreatureSpectators(multiFloor and 1 or 0)}

	for _, cIndex in ipairs(spec) do
		if (cIndex >= 0) then
			table.insert(t, Creatures.createNew(cIndex))
		end
	end

	return t
end

-- Checks if creature is valid
function Creatures.isValid(c)
	local _c = type(c) == "table" and c or Creatures.createNew(c)
	return (Creatures.ID(_c) > 0 and _c._listindex <= 1300 and _c._listindex >= 0)
end

-- Returns creature's name
function Creatures.name(c)
	local _c = type(c) == "table" and c or Creatures.createNew(c)
	return _c._name
end

-- Returns creature's id
function Creatures.ID(c)
	local _c = type(c) == "table" and c or Creatures.createNew(c)
	return _c._id
end

-- Returns if creature is visible
function Creatures.isVisible(c)
	local _c = type(c) == "table" and c or Creatures.createNew(c)
	return getCreatureVisible(_c._listindex)
end

-- Returns if creature is alive
function Creatures.isAlive(c)
	local _c = type(c) == "table" and c or Creatures.createNew(c)
	return getCreatureHealthPercent(_c._listindex) > 0
end

-- Returns creature's index
function Creatures.index(c)
	local _c = type(c) == "table" and c or Creatures.createNew(c)
	return _c._listindex
end

-- Returns creature's position
function Creatures.position(c)
	local _c = type(c) == "table" and c or Creatures.createNew(c)
	return getCreaturePosition(_c._listindex)
end

-- Returns if creature is on-screen
function Creatures.isOnScreen(c, multiFloor)
	local _c = type(c) == "table" and c or Creatures.createNew(c)
	local selfPos = Player.pos()
	local cPos = Creatures.position(_c)
	return (math.abs(selfPos.x - cPos.x) <= 8 and math.abs(selfPos.y - cPos.y) <= 6 and (selfPos.z == cPos.z or multiFloor))
end

-- Returns distance from player to creature
function Creatures.distFromSelf(c)
	local _c = type(c) == "table" and c or Creatures.createNew(c)
	return getDistanceBetween(Creatures.position(_c), Player.pos())
end

-- Attacks a creature
function Creatures.attack(c)
	local _c = type(c) == "table" and c or Creatures.createNew(c)
	return attackCreature(_c._id)
end

-- Follows a creature
function Creatures.follow(c)
	local _c = type(c) == "table" and c or Creatures.createNew(c)
	return followCreature(_c._id)
end

-- Retuns if creature is valid
function Creatures.checkCreature(c, bList)
	local _c = type(c) == "table" and c or Creatures.createNew(c)

	if (Creatures.isValid(_c) and Creatures.isVisible(_c) and Creatures.isAlive(_c) and Creatures.isOnScreen(_c)) then
		if (bList and LURER.BLACKLIST[Creatures.ID(_c)] and LURER.BLACKLIST[Creatures.ID(_c)] >= 3) then
			return false
		end

		return true
	end

	return false
end

-- Follows a npc
function Creatures.followNpc(name, callback)
	local myPos = Player.pos()
	
	if (name) then
		-- Real Tibia, NPC can be found be XenoBot
		if (not SCRIPT_DATA["Ot"]) then
			for i = 0, 1300 do
				if (string.lower(Creatures.name(i)) == string.lower(name) and Creatures.checkCreature(i)) then
					local cPos = Creatures.position(i)
					local dist = getDistanceBetween(myPos, cPos)

					if (not cPos or not Map.isTileReachable(Player.pos(), cPos, {}, {Player.pos()})) then
						callback(false)
						return false
					end

					if (dist > 2) then
						local tiles = Map.getWalkableTiles(cPos, 1)

						tiles = Table.sortByDistance(tiles)
						Player.walkTo(tiles[1].x, tiles[1].y, tiles[1].z, function()
							callback(true)
							return true
						end, 5)
					else
						callback(true)
						return true
					end
				end
			end
		-- OTS, NPC needs to be find by abnormal tile ID
		else
			local pos = {}

			for _x = -7, 7 do
				for _y = -5, 5 do
					if (Map.checkTile(myPos.x+_x, myPos.y+_y, myPos.z)) then
						table.insert(pos, {x = myPos.x+_x, y = myPos.y+_y, z = myPos.z, diff = getDistanceBetween(myPos, {x = myPos.x+_x, y = myPos.y+_y, z = myPos.z})})
					end
				end
			end

			-- Sort by distance, closest first
			table.sort(pos, function(a, b) return a.diff < b.diff end)

			if (#pos > 0) then
				local tiles = Map.getWalkableTiles(pos[1], 1)
				
				tiles = Table.sortByDistance(tiles)
				Player.walkTo(tiles[1].x, tiles[1].y, tiles[1].z, function()
					callback(true)
					return false
				end, 5)
			else
				Channel.warn("Failed to follow NPC ( " ..name.. " )")
				callback(true)
				return false
			end
		end
	else
		callback(false)
		return
	end
end

-- Returns every creature found
function Creatures.findAllCreatures(bList, range)
	local foundCreatures = {}

	for n, c in Creatures.iMonsters() do
		if (Creatures.checkCreature(c, bList)) then
			if (range) then
				if (Creatures.distFromSelf(c) <= range) then
					table.insert(foundCreatures, c)
				end
			else
				table.insert(foundCreatures, c)
			end
		end
	end

	return foundCreatures
end

-- Returns every creature found in the list
function Creatures.findCreatures(names, bList)
	local foundCreatures = {}

	if (type(names) == "string") then
		names = {names}
	end

	for n, c in Creatures.iMonsters() do
		if (Table.contains(names, string.lower(n)) and Creatures.checkCreature(c, bList)) then
			table.insert(foundCreatures, c)
		end
	end

	return foundCreatures
end

-- Returns a list of creatures around the player
function Creatures.findCreaturesAround(names, bList, range)
	local foundCreatures = {}

	if (type(names) == "string") then
		names = {names}
	end

	for n, c in Creatures.iMonsters() do
		if (Table.contains(names, string.lower(n)) and Creatures.checkCreature(c, bList)) then
			if (Creatures.distFromSelf(c) <= range) then
				table.insert(foundCreatures, c)
			end
		end
	end

	return foundCreatures
end

-- Returns creatures in opposite direction than provided
function Creatures.findInOppositeDirection(names, dir, bList)
	local foundCreatures = {}
	local foundAllCreatures = {}
	local myPos = Player.pos()
	local compare = nil
	local dirs = {[0] = 2, [1] = 3, [2] = 2, [3] = 3, ["n"] = 0, ["e"] = 1, ["s"] = 2, ["w"] = 3} -- north = 2, east = 2, south = 2, west = 2

	if (type(dir) == "string") then
		dir = dirs[dir]
	end

	if (type(names) == "string") then
		names = {names}
	end

	-- North, East, South, West
	if (dir == 0) then
		compare = function(a, b) return a.y > b.y end
	elseif (dir == 1) then
		compare = function(a, b) return a.x < b.x end
	elseif (dir == 2) then
		compare = function(a, b) return a.y < b.y end
	elseif (dir == 3) then
		compare = function(a, b) return a.x > b.x end
	end
	
	for n, c in Creatures.iMonsters() do
		-- We want only specific monsters
		if (names and Table.contains(names, string.lower(n))) then
			table.insert(foundAllCreatures, c)

			if (Creatures.checkCreature(c, bList)) then
				local cPos = Creatures.position(c)

				-- Make sure the monsters are opposite of the searching direction
				if (compare(cPos, myPos)) then
					table.insert(foundCreatures, c)
				end
			end
		-- We want every monster that is behind us
		else
			table.insert(foundAllCreatures, c)

			if (Creatures.checkCreature(c, bList)) then
				local cPos = Creatures.position(c)

				-- Make sure the monsters are opposite of the searching direction
				if (compare(cPos, myPos)) then
					table.insert(foundCreatures, c)
				end
			end
		end
	end

	return foundCreatures, foundAllCreatures, dirs[dir]
end

-- Returns sorted creatures by distance
function Creatures.sortByDistance(t)
	local distances = {}

	for i = 1, #t do
		if (Creatures.checkCreature(t[i])) then
			table.insert(distances, {dist = Creatures.distFromSelf(t[i]), creature = t[i]})
		end
	end

	table.sort(distances, function(a, b) return (a.dist > b.dist) end)
	return distances
end

-- Travels to a destination
function Creatures.travel(name, dest)
	Player.delayWalker(30000)
	
	local name = string.lower(name)				-- Npc name
	local dest = tostring(string.lower(dest))	-- Destination to travel to
	local dialog = nil							-- Dialog to say based on npc
	local sPos = Player.pos()
	local buddelPositions = {
		["barbarian camp"] = {x = 32021, y = 31294, z = 7},
		["helheim"] = {x = 32462, y = 31174, z = 7},
		["okolnir"] = {x = 32224, y = 31381, z = 7},
		["svargrond"] = {x = 32256, y = 31197, z = 7},
		["tyrsung"] = {x = 32333, y = 31227, z = 7}
	}
	
	-- Set dialog
	if (Table.contains({"barry", "bruce", "hal", "oliver", "peter", "reed", "tony"}, name)) then
		dialog = {"hi", "pass", dest} -- Yalahar gates
	elseif (name == "captain fearless" and dest == "darashia") then
		dialog = {"hi", dest, "yes", "yes"} -- Venore to Darashia
	elseif (name == "buddel") then
		dialog = {"hi", "go", dest, "yes"} -- Buddel
	elseif (name == "scrutinon") then
		dialog = {"hi", "travel", dest} -- Gray Island
	else
		dialog = {"hi", dest, "yes"} -- Normal travel
	end
	
	Creatures.followNpc(name, function()
		if (name == "buddel") then -- Fuck Buddel
			local function travelBuddel()
				Callback.setTimeout(function()

					-- Check position
					if (getDistanceBetween(Player.pos(), buddelPositions[dest]) > 10) then
						travelBuddel()
					else
						Player.delayWalker(0)
						return true
					end
					
					Player.say(dialog, function() end)
				end, Delay.pingDelay(DELAY.BUDDEL))
			end
			
			travelBuddel()
		else
			Player.say(dialog, function()
				Callback.setTimeout(function()
					local cPos = Player.pos()

					-- Confirm position change
					if (sPos.x == cPos.x and sPos.y == cPos.y and sPos.z == cPos.z) then
						Creatures.travel(name, dest)
						return
					else
						Player.delayWalker(0)
						return true
					end
				end, Delay.pingDelay(250))
			end)
		end
	end)
end

--		8 8888        8 8 8888      88 b.             8 8888888 8888888888 
--		8 8888        8 8 8888      88 888o.          8       8 8888       
--		8 8888        8 8 8888      88 Y88888o.       8       8 8888       
--		8 8888        8 8 8888      88 .`Y888888o.    8       8 8888       
--		8 8888        8 8 8888      88 8o. `Y888888o. 8       8 8888       
--		8 8888        8 8 8888      88 8`Y8o. `Y88888o8       8 8888       
--		8 8888888888888 8 8888      88 8   `Y8o. `Y8888       8 8888       
--		8 8888        8 ` 8888     ,8P 8      `Y8o. `Y8       8 8888       
--		8 8888        8   8888   ,d8P  8         `Y8o.`       8 8888       
--		8 8888        8    `Y88888P'   8            `Yo       8 8888       

-- Returns if there are enough potions
function Hunt.checkPotions(town, msg)
	return Hunt.checkInConfig("Potions", town, msg)
end

-- Returns if there are enough runes
function Hunt.checkRunes(town, msg)
	return Hunt.checkInConfig("Runes", town, msg)
end

-- Returns if there is enough ammunition
function Hunt.checkAmmunition(town, msg)
	return Hunt.checkInConfig("Ammunition", town, msg)
end

-- Returns if there are enough rings
function Hunt.checkRing(town, msg)
	return Hunt.checkInConfig("Ring", town, msg)
end

-- Returns if there are enough amulets
function Hunt.checkAmulet(town, msg)
	return Hunt.checkInConfig("Amulet", town, msg)
end

-- Returns if there are enough items that are being withdrawn
function Hunt.checkWithdraw(town, msg)
	return Hunt.checkInConfig("Withdraw", town, msg)
end

-- Returns if there is enough capacity
function Hunt.checkCapacity(msg)
	local minCap = CONFIG["Capacity"] and CONFIG["Capacity"]["MinCap"] or 0

	if (Player.cap() < minCap) then
		if (msg) then Channel.log("Proceeding to leave, low capacity ( " ..Player.cap().. " )") end
		return false
	end

	return true
end

-- Returns if there is enough stamina
function Hunt.checkStamina(msg)
	local stamina = Player.normalStamina()

	if (stamina / 60 <= 14) then
		if (msg) then Channel.log("Proceeding to leave, low stamina ( " ..Player.stamina().. " )") end
		return false
	end

	return true
end

-- Returns if there are enough specified items
function Hunt.checkInConfig(section, town, msg)
	local amount = nil

	for suppID, supply in pairs(SUPPLIES) do
		if (supply.group == section) then
			if (supply.max > 0) then
				if (town) then
					amount = Item.compareCount(supply.id, supply.max, false)

					if (amount) then
						return false
					end
				else
					amount = Item.compareCount(supply.id, supply.min, true)

					if (amount) then
						if (msg) then Channel.log("Proceeding to leave, low amount of [" ..supply.group.. "] " ..String.titleCase(Item.getItemName(supply.id)).. " ( Amount: " ..amount.. " )") end
						return false
					end
				end
			end
		end
	end

	return true
end

-- Returns any items to withdraw
function Hunt.checkToWithdraw()
	local t = {}

	for suppID, supply in pairs(SUPPLIES) do
		if (supply.group == "Ring" or supply.group == "Amulet" or supply.group == "Withdraw") then
			local missing = math.max(supply.max - Item.count(supply.id, true), 0)

			if (missing > 0) then
				table.insert(t, {id = supply.id, missing = missing, group = supply.group})
			end
		end
	end

	return t
end

-- Returns if anything is missing
function Hunt.checkAll(town, msg)
	local _dropFlasks = CONFIG["Capacity"] and CONFIG["Capacity"]["DropFlasks"] or false
	local monsters = Creatures.findAllCreatures()
	
	if (_dropFlasks and Creatures.targetID() == 0 and #monsters < 3 or _dropFlasks and Player.countFlasks() > 10) then
		Hunt.dropFlasks()
	end

	if ((not Hunt.checkPotions(town, msg)) or (not Hunt.checkRunes(town, msg)) or (not Hunt.checkAmmunition(town, msg))  or (not Hunt.checkRing(town, msg)) or (not Hunt.checkAmulet(town, msg)) or (not Hunt.checkWithdraw(town, msg)) or (not Hunt.checkCapacity(msg)) or (not Hunt.checkStamina(msg)) or SCRIPT_DATA["IsReadyLeave"]) then
		return false
	end

	if (SCRIPT_DATA["ForceRefill"] or CONFIG["General"]["LogBeforeSS"] > 0 and Map.getTimeToServerSave() / 60 <= CONFIG["General"]["LogBeforeSS"]) then
		return false
	end

	return true
end

-- Drops flasks on a random tile
function Hunt.dropFlasks()
	if (Player.countFlasks() > 0) then
		local flasks = {283, 284, 285}
		local pos = Player.pos()
		local walkableTiles = Map.getWalkableTiles(pos, 2)

		if (#walkableTiles == 0) then
			return
		end

		local dropTile = walkableTiles[math.random(1, #walkableTiles)]

		for i = 0, 15 do
			if (Cont.isOpen(i)) then
				for spot = 0, Cont.itemCount(i) - 1 do
					local item = Cont.getItemDataFromSpot(i, spot)
					if (Table.contains(flasks, item.id)) then
						Cont.moveItemToGround(i, spot, dropTile.x, dropTile.y, dropTile.z, -1)
						break
					end
				end
			end
		end
	end
end

-- Checks if there is enough cap for every supply at the start
function Hunt.checkInitialCap()
	local t = {}
	local curCap = Player.cap()
	local requiredCap = 0

	for suppID, supply in pairs(SUPPLIES) do
		local curAmount = Item.count(tonumber(supply["id"]), true)
		local maxAmount = tonumber(supply["max"])

		if (maxAmount > 0) then
			local missing = math.max(maxAmount - curAmount, 0)

			table.insert(t, {["section"] = supply["group"], ["supply"] = String.titleCase(supply["name"]), ["missing"] = missing, ["cap"] = missing * getItemWeight(tonumber(supply["id"]))})
		end
	end

	for i = 1, #t do
		requiredCap = requiredCap + t[i]["cap"]
	end

	return t, requiredCap - curCap, requiredCap < curCap
end

-- Checks if there is enough money to buy supplies
function Hunt.checkCost()
	local requiredMoney = 0

	for suppID, supply in pairs(SUPPLIES) do
		if (supply.group == "Potions" or supply.group == "Runes" or supply.group == "Ammunition") then
			local itemCost = Item.getCost(supply.id)
			local missing = math.max(supply.max - Item.count(supply.id, true), 0)

			requiredMoney = requiredMoney + (itemCost * missing)
		end
	end

	return requiredMoney
end

--		   d888888o.   8 8888        8     ,o888888o.     8 888888888o   
--		 .`8888:' `88. 8 8888        8  . 8888     `88.   8 8888    `88. 
--		 8.`8888.   Y8 8 8888        8 ,8 8888       `8b  8 8888     `88 
--		 `8.`8888.     8 8888        8 88 8888        `8b 8 8888     ,88 
--		  `8.`8888.    8 8888        8 88 8888         88 8 8888.   ,88' 
--		   `8.`8888.   8 8888        8 88 8888         88 8 888888888P'  
--		    `8.`8888.  8 8888888888888 88 8888        ,8P 8 8888         
--		8b   `8.`8888. 8 8888        8 `8 8888       ,8P  8 8888         
--		`8b.  ;8.`8888 8 8888        8  ` 8888     ,88'   8 8888         
--		 `Y8888P ,88P' 8 8888        8     `8888888P'     8 8888         

--- Returns if there are available items to sell
function Shop.getItemSaleCount(item)
	return shopGetItemSaleCountByID(item)
end

-- Sorts items after buying
function Shop.sortItems(section, callback)
	local c = BACKPACKS["MainBackpack"].index
	local dest = BACKPACKS["SuppliesBackpack"].index

	if (section == "Potions") then
		dest = BACKPACKS["PotionBackpack"].index or dest
	elseif (section == "Runes") then
		dest = BACKPACKS["RuneBackpack"].index or dest
	elseif (section == "Ammunition") then
		dest = BACKPACKS["AmmoBackpack"].index or dest
	end
	
	if (not dest) then
		callback()
		return true
	end
	
	local function sort(section)
		Callback.setTimeout(function()
			if (Shop.sortCheck(section)) then
				sort(section)
			else
				callback()
				return true
			end
		end, Delay.pingDelay(DELAY.MOVE_ITEM))

		for suppID, supply in pairs(SUPPLIES) do
			if (supply.group == section) then
				for spot = 0, Cont.itemCount(c) - 1 do
					local item = Cont.getItemDataFromSpot(c, spot).id

					if (item == supply.id) then
						Cont.moveItemToContainer(c, dest, spot, Cont.itemCapacity(dest) - 1)
						break
					end
				end
			end
		end
	end
	
	sort(section)
end

-- Returns if there are any items to sort
function Shop.sortCheck(section)
	for suppID, supply in pairs(SUPPLIES) do
		if (supply.group == section) then
			local c = BACKPACKS["MainBackpack"].index
			local count = Cont.countItemsOfID(c, supply.id)

			if (count > 0) then
				return true
			end
		end
	end

	return false
end

-- Buys an item
function Shop.buyItem(item, count)
	local func = type(item) == "string" and shopBuyItemByName or shopBuyItemByID
	return func(item, count)
end

-- Buys items
function Shop.buyItems(dialog, sections, callback)
	local dialog = dialog and {"hi", "trade"} or {}
	local index = 1
	local indexMax = #sections
	
	local function buy(section)
		Callback.setTimeout(function()
			-- Check if there are items left to buy
			if (Shop.buyCheck(section)) then
				-- Sort any items found and continue buying
				Shop.sortItems(section, function()
					buy(section)
				end)
			else
				-- No items left to buy, check if there are any other sections to check
				Shop.sortItems(section, function()
					if (index == indexMax) then
						callback(true)
						return true
					else
						index = index + 1
						buy(sections[index])
					end
				end)
			end
		end, Delay.pingDelay(DELAY.TRADE))
		
		for suppID, supply in pairs(SUPPLIES) do
			if (supply.group == section) then
				if (Item.count(supply.id, true) < supply.max) then
					local toBuy = math.min((supply.max - Item.count(supply.id, true)), 100)
					
					if (toBuy > 0) then
						Shop.buyItem(supply.id, toBuy)
					end

					break
				end
			end
		end
	end
	
	Player.say(dialog, function()
		buy(sections[index])
	end)
end

-- Checks for number of items to buy
function Shop.buyCheck(section)
	if (SCRIPT_DATA["Balance"] and tonumber(SCRIPT_DATA["Balance"])) then
		if (tonumber(SCRIPT_DATA["Balance"]) < Hunt.checkCost()) then
			Channel.inform("Going to depot, not enough money. Missing: " ..Hunt.checkCost() - tonumber(SCRIPT_DATA["Balance"]).. " gp")

			SCRIPT_DATA["ForceRefill"] = true
			return false
		end
	end

	for suppID, supply in pairs(SUPPLIES) do
		if (supply.group == section) then
			if (Item.count(supply.id, true) < supply.max) then
				return true
			end
		end
	end

	return false
end

--- Sells an item
function Shop.sellItem(item, count)
	local func = type(item) == "string" and shopSellItemByName or shopSellItemByID
	return func(item, count)
end

--- Sells loot
function Shop.sellItems(dialog, conts)
	local dialog = dialog and {"hi", "trade"} or {"trade"}
	Player.delayWalker(5000)

	SCRIPT_DATA["IsDepositing"] = true
	
	local function sell(conts)
		Player.delayWalker(5000)

		for i = 1, #conts do
			for spot = 0, Cont.itemCount(conts[i]) - 1 do
				local item = Cont.getItemDataFromSpot(conts[i], spot).id
				local count = Cont.countItemsOfID(conts[i], item)

				if (Shop.getItemSaleCount(item) > 0 and count > 0) then
					local toSell = math.min(count, 100)

					Shop.sellItem(item, toSell)

					Callback.setTimeout(function()
						sell(conts)
					end, Delay.pingDelay(DELAY.TRADE))

					return
				end
			end
		end

		SCRIPT_DATA["IsDepositing"] = false

		HUD["Loot2"] = {}

		Player.delayWalker(0)
		return true
	end
	
	Player.say(dialog, function()
		sell(conts)
	end)
end

-- Sells flasks
function Shop.sellFlasks(dialog, callback)
	local dialog = dialog and {"hi", "trade"} or {}
	local flasks = {283, 284, 285}
	local tradeFlasks = false
	
	local function sell()
		Callback.setTimeout(function()
			if (Player.countFlasks() > 0) then
				sell()
			else
				callback(true)
			end
		end, Delay.pingDelay(DELAY.TRADE))
		
		for i = 1, #flasks do
			if (Item.count(flasks[i]) > 0) then
				local toSell = math.min(Item.count(flasks[i]), 100)

				Shop.sellItem(flasks[i], toSell)
				break
			end
		end
	end
	
	Player.say(dialog, function()
		for i = 1, #flasks do
			if (Shop.getItemSaleCount(flasks[i]) > 0) then
				tradeFlasks = true
				break
			end
		end

		if (tradeFlasks) then
			sell()
		else
			callback(true)
		end
	end)
end

-- Deposits gold
function Shop.depositGold(dialog, callback)
	local dialog = dialog and {"hi", "deposit all", "yes"} or {"deposit all", "yes"}

	Player.say(dialog, function()
		callback(true)
		return true
	end)
end

--		8 888888888o.      8 8888888888   8 888888888o       ,o888888o. 8888888 8888888888 
--		8 8888    `^888.   8 8888         8 8888    `88.  . 8888     `88.     8 8888       
--		8 8888        `88. 8 8888         8 8888     `88 ,8 8888       `8b    8 8888       
--		8 8888         `88 8 8888         8 8888     ,88 88 8888        `8b   8 8888       
--		8 8888          88 8 888888888888 8 8888.   ,88' 88 8888         88   8 8888       
--		8 8888          88 8 8888         8 888888888P'  88 8888         88   8 8888       
--		8 8888         ,88 8 8888         8 8888         88 8888        ,8P   8 8888       
--		8 8888        ,88' 8 8888         8 8888         `8 8888       ,8P    8 8888       
--		8 8888    ,o88P'   8 8888         8 8888          ` 8888     ,88'     8 8888       
--		8 888888888P'      8 888888888888 8 8888             `8888888P'       8 8888       

-- Browses field
function Depot.browseField(x, y, z)
	return selfBrowseField(x, y, z)
end

-- Opens depot
function Depot.openDepot(callback, try)
	local pos = Player.pos()
	local depotPos = Map.getPosFrom(pos, Player.lookDirection(), 1)
	
	-- More than 10 tries, something failed
	if (try > 10) then
		Channel.warn("Something went wrong with depositing, automatic restart in less than 3 minutes")
		alert()
		callback(Cont.getLast())
		return
	end

	-- Browse Field
	if (not Cont.isOpen("Browse Field")) then
		Depot.browseField(depotPos.x, depotPos.y, pos.z)
	end
	
	Callback.setTimeout(function()
		-- Browse Field went wrong, try once again
		if (not Cont.isOpen("Browse Field")) then
			Depot.openDepot(callback, try+1)
			return
		end

		local browseField = Cont.getByName("Browse Field")

		-- Browse Field went wrong, try once again
		if (not browseField) then
			Depot.openDepot(callback, try+1)
			return
		end

		-- Open depot, locker
		Cont.useItemFromContainer(browseField, Cont.findInContainer(browseField, 3499), true)
		
		Cont.onContainerUpdate(browseField, function()
			Cont.useItemFromContainer(browseField, Cont.findInContainer(browseField, 3502), true)
			Cont.onContainerUpdate(browseField, function()
				local depot = Cont.getByName("Depot Chest")

				if (not depot) then
					Depot.openDepot(callback, try+1)
					return
				end

				callback(depot)
				return
			end)
		end)
	end, Delay.pingDelay(DELAY.BROWSE_FIELD))
end

-- Opens supplies depot
function Depot.openInDepotWithdraw(depot, callback)
	Cont.useItemFromContainer(depot, SCRIPT_DATA["SuppliesDepot"], true)

	Callback.setTimeout(function()
		callback(depot)
		return true
	end, Delay.pingDelay(DELAY.USE_ITEM))
end

-- Moves items to depot
function Depot.moveItemsToDepot(from, depot, stack, nonstack, callback)
	local spot = 0
	
	local function moveItem(_spot)
		Callback.setTimeout(function()
			local itemCount = Cont.itemCount(from)
			local item = Cont.getItemDataFromSpot(from, _spot)
			
			if (Cont.compareContainers(BACKPACKS["MainBackpack"].index, from)) then
				callback(true)
				return true
			end
			
			if (itemCount == 0 or itemCount == 1 and Item.isContainer(item.id)) then
				Cont.goBack(from)
				spot = 0
				moveItem(spot)
				return
			end
			
			if (spot > itemCount - 1) then
				Cont.goBack(from)
				spot = 0
				moveItem(spot)
				return
			end
			
			if (Item.isContainer(item.id)) then
				spot = spot + 1
				moveItem(spot)
				return
			end
			
			if (Item.isStackable(item.id)) then
				Cont.moveItemToContainer(from, depot, spot, stack, -1)
				spot = spot
				moveItem(spot)
				return
			end
			
			if (Item.isNonStackable(item.id)) then
				Cont.moveItemToContainer(from, depot, spot, nonstack, -1)
				spot = spot
				moveItem(spot)
				return
			end

			spot = spot + 1
			moveItem(spot)
			return
		end, Delay.pingDelay(DELAY.MOVE_ITEM))
	end

	moveItem(spot)
end

-- Withdraws items from depot
function Depot.moveItemsFromDepot(items, from, callback)
	local containerFrom = from
	local containerTo = BACKPACKS["SuppliesBackpack"].index or BACKPACKS["MainBackpack"].index
	
	local spot = 0
	local checked = 0
	
	local function moveItem(_spot)
		Callback.setTimeout(function()
			local itemCount = Cont.itemCount(containerFrom)
			local item = Cont.getItemDataFromSpot(containerFrom, _spot)
			checked = 0
			
			if (#items > 0) then
				for i = 1, #items do
					if (items[i].group == "Ring") then
						containerTo = BACKPACKS["RingBackpack"].index or BACKPACKS["SuppliesBackpack"].index or BACKPACKS["MainBackpack"].index
					elseif (items[i].group == "Amulet") then
						containerTo = BACKPACKS["AmuletBackpack"].index or BACKPACKS["SuppliesBackpack"].index or BACKPACKS["MainBackpack"].index
					elseif (Table.contains(WEAPONS, items[i].id)) then
						containerTo = false
					end

					if (item.id == items[i].id) then
						if (not containerTo) then
							Cont.moveItemToEquipment(containerFrom, spot, "weapon", math.min(items[i].missing, item.count))
						else
							Cont.moveItemToContainer(containerFrom, containerTo, spot, Cont.itemCapacity(containerTo) - 1, math.min(items[i].missing, item.count))
						end

						items[i].missing = items[i].missing - math.min(items[i].missing, item.count)
						
						if (items[i].missing == 0) then
							table.remove(items, i)
						end
						
						spot = spot
						moveItem(spot)
						return
					end
					
					if (Cont.countItemsOfID(containerFrom, items[i].id) == 0) then
						checked = checked + 1

						if (checked == #items) then
							--[[ Open next page
							spot = 0
							moveItem(spot)
							return]]
							error("Missing items to withdraw, please resupply them in your depot")
						end
					end
				end
				
				if (spot > itemCount - 1) then
					spot = 0
					moveItem(spot)
					return
				end
				
				spot = spot + 1
				moveItem(spot)
				return
			else
				callback(true)
				return true
			end
		end, Delay.pingDelay(DELAY.MOVE_ITEM))
	end
	
	moveItem(spot)
end

-- Deposits loot
function Depot.depositLoot(callback)
	SCRIPT_DATA["IsDepositing"] = true

	local timeout = nil
	local backpacks = {}
	
	table.insert(backpacks, BACKPACKS["LootBackpack"].index or nil)
	table.insert(backpacks, BACKPACKS["StackBackpack"].index or nil)
	table.insert(backpacks, BACKPACKS["NonStackBackpack"].index or nil)
	
	timeout = Callback.setTimeout(function()
		Backpacks.resetBackpacks(true, function()
			Depot.depositLoot(callback)
		end)
	end, 180000)

	local function moveLoot(index, depot, stackDepot, nonStackDepot, callback)
		if (#backpacks == 0) then
			callback()
			return
		end
		
		Depot.moveItemsToDepot(backpacks[index], depot, stackDepot, nonStackDepot, function()
			table.remove(backpacks, index)
			moveLoot(index, depot, stackDepot, nonStackDepot, callback)
		end)
	end
	
	Depot.openDepot(function(depot)
		moveLoot(1, depot, SCRIPT_DATA["StackDepot"], SCRIPT_DATA["NonStackDepot"], function()
			closeContainer(depot)
			Callback.clearTimeout(timeout)

			callback(true)
			return true
		end)
	end, 1)
end

-- Withdraws supplies
function Depot.withdrawSupplies(callback)
	local toWithdraw = Hunt.checkToWithdraw()
	
	Depot.openDepot(function(depot)
		Cont.minimize(depot)

		Depot.openInDepotWithdraw(depot, function(suppliesDepot)
			Cont.minimize(suppliesDepot)

			Depot.moveItemsFromDepot(toWithdraw, suppliesDepot, function()
				callback(true)
				return true
			end)
		end)
	end, 1)
end

--		8 888888888o          .8.           ,o888888o.    8 8888     ,88' 8 888888888o      .8.           ,o888888o.    8 8888     ,88'    d888888o.   
--		8 8888    `88.       .888.         8888     `88.  8 8888    ,88'  8 8888    `88.   .888.         8888     `88.  8 8888    ,88'   .`8888:' `88. 
--		8 8888     `88      :88888.     ,8 8888       `8. 8 8888   ,88'   8 8888     `88  :88888.     ,8 8888       `8. 8 8888   ,88'    8.`8888.   Y8 
--		8 8888     ,88     . `88888.    88 8888           8 8888  ,88'    8 8888     ,88 . `88888.    88 8888           8 8888  ,88'     `8.`8888.     
--		8 8888.   ,88'    .8. `88888.   88 8888           8 8888 ,88'     8 8888.   ,88'.8. `88888.   88 8888           8 8888 ,88'       `8.`8888.    
--		8 8888888888     .8`8. `88888.  88 8888           8 8888 88'      8 888888888P'.8`8. `88888.  88 8888           8 8888 88'         `8.`8888.   
--		8 8888    `88.  .8' `8. `88888. 88 8888           8 888888<       8 8888      .8' `8. `88888. 88 8888           8 888888<           `8.`8888.  
--		8 8888      88 .8'   `8. `88888.`8 8888       .8' 8 8888 `Y8.     8 8888     .8'   `8. `88888.`8 8888       .8' 8 8888 `Y8.     8b   `8.`8888. 
--		8 8888    ,88'.888888888. `88888.  8888     ,88'  8 8888   `Y8.   8 8888    .888888888. `88888.  8888     ,88'  8 8888   `Y8.   `8b.  ;8.`8888 
--		8 888888888P .8'       `8. `88888.  `8888888P'    8 8888     `Y8. 8 8888   .8'       `8. `88888.  `8888888P'    8 8888     `Y8.  `Y8888P ,88P'

-- Resets backpacks
function Backpacks.resetBackpacks(reset, callback)

	Event.stopEvent("HUD")

	local reset = reset or false
	local requiredBps = Backpacks.checkRequiredBackpacks()
	local opening = false
	
	-- Open list of containers
	local function openContainer(_index, bps, conts, callback)
		local lastCont = Cont.getLast()

		for i = 0, 15 do
			if (Cont.isOpen(i)) then
				Cont.minimize(i)
			end
		end

		for i = 1, #conts do
			if (string.lower(Item.getItemName(conts[i].container)) == bps[_index]) then
				Cont.useItemFromContainer(BACKPACKS["MainBackpack"].index, conts[i].spot, false) -- open container

				Cont.onContainerUpdate(lastCont + 1, function()
					if (#bps > _index) then
						table.remove(conts, i)
						openContainer(_index + 1, bps, conts, callback)
					else
						callback()
					end
				end)

				break
			end
		end
	end
	
	-- Open one container
	local function openContainerEasy(name, index, callback)
		local foundContainers = Cont.findContainers(index)

		for i = 1, #foundContainers do
			if (name == string.lower(Item.getItemName(foundContainers[i].container))) then
				Cont.useItemFromContainer(index, foundContainers[i].spot, true)
				break
			end
		end
	end
	
	-- Fixes backpacks after depot
	local function isResetNeeded(_callback)
		local opening = false

		for k, v in pairs(BACKPACKS) do
			if (v.index and v.index ~= BACKPACKS["MainBackpack"].index and Cont.compareContainers(BACKPACKS["MainBackpack"].index, v.index)) then
				opening = true
				openContainerEasy(v.name, v.index)

				Cont.onContainerUpdate(v.index, function()
					isResetNeeded(_callback)
				end)

				break
			end

			opening = false
		end
		
		if (not opening) then
			_callback()
			return
		end
	end
	
	-- Fixes backpacks after depot
	local function fixGoldBackpack(_callback)
		if (BACKPACKS["GoldBackpack"].index and not Cont.compareContainers(BACKPACKS["MainBackpack"].index, BACKPACKS["GoldBackpack"].index)) then
			Cont.goBack(BACKPACKS["GoldBackpack"].index)

			Cont.onContainerUpdate(BACKPACKS["GoldBackpack"].index, function()
				fixGoldBackpack(_callback)
			end)
		else
			_callback()
			return
		end
	end

	-- Minimizes every container
	local function minimizeContainers(j, _callback)
		local last = nil

		if (j <= 15) then
			for i = j, 15 do
				if (Cont.isOpen(i)) then
					Cont.minimize(i)
					last = i
					break
				end

				last = i
			end
		else
			_callback()
			return
		end

		Callback.setTimeout(function()
			minimizeContainers(last+1, _callback)
		end, Delay.pingDelay(DELAY.CLOSE_CONTAINER))
	end
	
	if (reset) then
		Cont.closeContainers(function()
			Item.useFromEquipment("backpack", function()
				local contFirst = Cont.getFirst()
				local foundContainers = Cont.findContainers(contFirst)

				Callback.setTimeout(function()
					local verify = Backpacks.verifyFoundBackpacks(Backpacks.checkRequiredBackpacks(), Cont.findContainers(contFirst))
					Cont.minimize(contFirst)
					
					if (#verify == 0 or not verify[1]) then
						openContainer(1, requiredBps, foundContainers, function()
							Cont.minimize(Cont.getLast())

							local openedContainers = Cont.getContainers()

							if (#openedContainers < #requiredBps) then
								Channel.warn("Failed to open enough backpacks, retrying")
								Backpacks.resetBackpacks(reset, callback)

								return
							end

							minimizeContainers(0, function()
								Backpacks.saveBackpacks()

								if (CONFIG["Hud"] and CONFIG["Hud"]["EnableHud"]) then Event.startEvent("HUD") end

								callback(true)
								return true
							end)
						end)
					else
						local err = table.concat(verify, ", ")

						error("Not enough backpacks found, missing: " ..err.. " - Backpacks.resetBackpacks")
						return false
					end
				end, Delay.pingDelay(DELAY.USE_ITEM))
			end)
		end)
	else
		local containersCount = Cont.getContainers()

		if (#containersCount < #requiredBps) then
			Channel.warn("Failed to find enough opened backpacks, retrying")
			Backpacks.resetBackpacks(true, callback)

			return false
		else
			fixGoldBackpack(function()
				isResetNeeded(function()
					if (CONFIG["Hud"] and CONFIG["Hud"]["EnableHud"]) then Event.startEvent("HUD") end
					callback(true)

					return true
				end)
			end)
		end
	end
end

-- Saves backpacks to config
function Backpacks.saveBackpacks()
	BACKPACKS["MainBackpack"] = {name = Item.getItemName(Item.eqData("backpack").id), index = 0}

	for k, v in pairs(CONFIG["Backpacks"]) do
		if (type(v) == "string" and Item.isContainer(v)) then
			BACKPACKS[k] = {name = v:lower(), index = Cont.getByName(v:lower())}
		end
	end
end

-- Checks for required number of backpacks
function Backpacks.checkRequiredBackpacks()
	local backpacks = {}

	for k, v in pairs(CONFIG["Backpacks"]) do
		if (type(v) == "string" and Item.isContainer(v)) then
			table.insert(backpacks, string.lower(v))
		end
	end

	return backpacks
end

-- Verifies found backpacks
function Backpacks.verifyFoundBackpacks(req, found)
	for _, v in pairs(found) do
		if (Table.contains(req, string.lower(Item.getItemName(v.container)))) then
			Table.valueRemove(req, string.lower(Item.getItemName(v.container)))
		end
	end

	return req
end

-- Returns if depositing is needed after launch
function Backpacks.checkDeposit()
	local backpacks = {}

	table.insert(backpacks, BACKPACKS["LootBackpack"].index or nil)
	table.insert(backpacks, BACKPACKS["StackBackpack"].index or nil)
	table.insert(backpacks, BACKPACKS["NonStackBackpack"].index or nil)

	for i = 1, #backpacks do
		for spot = 0, Cont.itemCount(backpacks[i]) - 1 do
			local item = Cont.getItemDataFromSpot(backpacks[i], spot)

			if (not Item.isContainer(item.id)) then
				return true
			end
		end
	end

	return false
end

-- Returns if there are any duplicates in backpacks
function Backpacks.verifyNames()
	for k, v in pairs(CONFIG["Backpacks"]) do
		if (type(v) == "string" and Item.isContainer(v)) then
			for i, j in pairs(CONFIG["Backpacks"]) do
				if (type(v) == "string" and Item.isContainer(v)) then
					if (v == j and k ~= i) then
						return k, v, i, j
					end
				else
					return i, "Invalid name", "Error", "Error"
				end
			end
		else
			return k, "Invalid name", "Error", "Error"
		end
	end

	return false
end

--		8 8888 8 888888888o       ,o888888o.    
--		8 8888 8 8888    `88.    8888     `88.  
--		8 8888 8 8888     `88 ,8 8888       `8. 
--		8 8888 8 8888     ,88 88 8888           
--		8 8888 8 8888.   ,88' 88 8888           
--		8 8888 8 888888888P'  88 8888           
--		8 8888 8 8888         88 8888           
--		8 8888 8 8888         `8 8888       .8' 
--		8 8888 8 8888            8888     ,88'  
--		8 8888 8 8888             `8888888P'    

IpcPublisher.__index = IpcPublisher

-- Creates a new IPC publisher socket
function IpcPublisher.new(key, port)
	local s = {}

	setmetatable(s, IpcSubscriber)
	s._key = key
	s._socket = IpcBind(port, SOCKET_PUB)

	return s
end

setmetatable(IpcPublisher, {__call = function(_, ...) return IpcPublisher.new(...) end})

-- Publishes a message to everyone subscribing a certain topic
function IpcPublisher.publishMessage(pub, topic, message)
	pub = type(pub) == "table" and pub or IpcPublisher.new(pub)
	return IpcSendTopic(pub._socket, topic, message) == 1
end



IpcSubscriber.__index = IpcSubscriber

-- Creates a new IPC subscriber socket
function IpcSubscriber.new(key, port)
	local s = {}

	setmetatable(s, IpcSubscriber)
	s._key = key
	s._socket = IpcConnect(port, SOCKET_SUB)

	return s
end

setmetatable(IpcSubscriber, {__call = function(_, ...) return IpcSubscriber.new(...) end})

-- Subscribes to a topic
function IpcSubscriber.addTopic(sub, topic)
	sub = type(sub) == "table" and sub or IpcSubscriber.new(sub)
	return IpcSubscribe(sub._socket, topic) == 1
end

-- Receives the next message in queue
function IpcSubscriber.receive(sub)
	sub = type(sub) == "table" and sub or IpcSubscriber.new(sub)

	if (IpcPoll(sub._socket) == 0) then return false end

	local topic = IpcRecv(sub._socket, 0)		-- 0 = topic
	local message = IpcRecv(sub._socket, 1)		-- 1 = message

	return true, topic, message
end

function Ipc.init()
	SCRIPT_DATA["Vocation"] = string.lower(CONFIG["Teamhunt"]["Vocation"]) or SCRIPT_DATA["Vocation"]
	SCRIPT_DATA["PartnerName"] = CONFIG["Teamhunt"]["Partner"]

	SCRIPT_DATA["Subscriber"] = IpcSubscriber.new(SCRIPT_DATA["Vocation"].. "-sub", Ipc.compareNames(Player.name(), SCRIPT_DATA["PartnerName"]) and 15111 or 15112)
	SCRIPT_DATA["Publisher"] = IpcPublisher.new(SCRIPT_DATA["Vocation"].. "-pub", Ipc.compareNames(Player.name(), SCRIPT_DATA["PartnerName"]) and 15112 or 15111)

	IpcSubscriber.addTopic(SCRIPT_DATA["Subscriber"], SCRIPT_DATA["Topic"])

	-- Enable sio
	if (SCRIPT_DATA["Vocation"] == "druid") then
		if (CONFIG["Teamhunt"]["SioPercent"] > 0) then
			Event.startEvent("Sio")
		end

		if (CONFIG["Teamhunt"]["SafeRing"]) then
			Event.startEvent("Safering")
		end

		Event.startEvent("Wildgrowth")
	end

	-- Make sure that trade potions aren't counted as waste
	if (SCRIPT_DATA["Vocation"] == "knight") then
		local potion = CONFIG["Potions"]["TradeName"]

		if (potion) then
			HUD["LootWasteBlacklist"][tostring(Item.getItemID(potion))] = true
		end
	end

	-- Make sure that characters are in party
	if (getCreaturePartyStatus(Creatures.createNew(getSelfID())._listindex) == 0) then
		alert()
		Channel.warn("Make sure that characters are in party!")
	end

	-- Add partner loot
	if (CONFIG["Hud"] and CONFIG["Hud"]["EnableHud"]) then
		local x = Hud["Right"].centerx
		local y = HUD["Loot"].y + 15 * (Table.countLength(HUD["LootHUD"]["Items"]["Loot"]) + 1)

		local data = {
			count = 0,
			image = Hud.createNewImage(x - 115, y - 6, 3043, 8, 100),
			name = Hud.createNewText(x - 95, y, "Partner Loot", COLORS["Green"]),
			amount = Hud.createNewText(x + 30, y, "0 gp", COLORS["Green"]),
			x = x,
			y = y,
			type = "Loot"
		}

		HUD["LootHUD"]["Items"]["Loot"][3043] = data
		Hud.moveHUD()
	end

	-- Add partner waste
	if (CONFIG["Hud"] and CONFIG["Hud"]["EnableHud"]) then
		local x = Hud["Right"].centerx
		local y = HUD["Waste"].y + 15 * (Table.countLength(HUD["LootHUD"]["Items"]["Waste"]) + 1)

		local data = {
			count = 0,
			image = Hud.createNewImage(x - 115, y - 6, 3043, 8, 100),
			name = Hud.createNewText(x - 95, y, "Partner Waste", COLORS["Red"]),
			amount = Hud.createNewText(x + 30, y, "0 gp", COLORS["Red"]),
			x = x,
			y = y,
			type = "Waste"
		}

		HUD["LootHUD"]["Items"]["Waste"][3043] = data
	end

	SCRIPT_DATA["IpcReady"] = true
end

-- Compares two names to decide ports
function Ipc.compareNames(name1, name2)
	local l1 = string.len(name1)
	local l2 = string.len(name2)

	if (l1 > l2) then
		return true
	end

	for i = 1, l2 do
		local part1 = string.lower(string.sub(name1, i, i))
		local part2 = string.lower(string.sub(name2, i, i))

		if (part1 ~= part2) then
			if (part1 > part2) then
				return true
			else
				return false
			end
		end
	end
end

-- Puts a condition in queue
function Ipc.setCondition(message, callback)
	local index = #SCRIPT_DATA["IpcEvents"] + 1
	SCRIPT_DATA["IpcEvents"][index] = {callback = callback, message = message}

	return index
end

-- Removes a condition from queue
function Ipc.clearCondition(index)
	SCRIPT_DATA["IpcEvents"][index] = nil
end

-- Handles conditions
function Ipc.checkConditions(message)
	for k, v in pairs(SCRIPT_DATA["IpcEvents"]) do
		if (k and not v) then
			SCRIPT_DATA["IpcEvents"][k] = nil
			Ipc.checkConditions(message)
			return
		end

		-- Check if the message matches the one we're looking for
		if (string.match(string.lower(message), string.lower(v.message))) then
			SCRIPT_DATA["IpcEvents"][k] = nil
			v.callback(message)
			return
		end
	end
end

function Ipc.receiveMessages(sub)
	local success, topic, message = IpcSubscriber.receive(sub)

	if (success) then
		if (os.difftime(os.time(), SCRIPT_DATA["Time"]) > 5) then
			Ipc.handleMessage(message)
		end

		Ipc.receiveMessages(sub)
		return
	end
end

function Ipc.handleMessage(message)
	local msg = String.splitString(message, "|")

	if (msg[1] == "walker") then
		-- Delays walker, Arg1: Delay in seconds
		if (msg[2] == "stop") then
			Player.delayWalker(tonumber(msg[3]) * 1000)
		-- Resets delay on walker, Arg1: Empty
		elseif (msg[2] == "start") then
			Player.delayWalker(0)
		-- Continues when delay passes or another signal is received, Arg1: Delay in seconds, Arg2: Message
		elseif (msg[2] == "signal") then
			local timeout = nil
			local success = nil

			Player.delayWalker(tonumber(msg[3]) * 1000 + 1000)

			IpcPublisher.publishMessage(SCRIPT_DATA["Publisher"], SCRIPT_DATA["Topic"], msg[4])
			table.insert(SCRIPT_DATA["IpcSignals"], msg[4])

			IpcPublisher.publishMessage(SCRIPT_DATA["Publisher"], SCRIPT_DATA["Topic"], "request|signal")

			-- Make sure we don't wait for a response after longer time
			timeout = Callback.setTimeout(function()
				Ipc.clearCondition(success)

				alert()
				Channel.warn("Failed to receive a response from partner! Retrying! #" ..msg[4])

				Ipc.handleMessage(message)

				return
			end, tonumber(msg[3]) * 1000)

			success = Ipc.setCondition(msg[4], function()
				Callback.clearTimeout(timeout)

				Player.delayWalker(0)
				return
			end)
		-- Walks to a certain position from a set, Arg1: Enable targeting, Arg2: Delay in seconds on enabling, Rest: Positions
		elseif (msg[2] == "walkto") then
			local cords = {}
			local posZ = Player.pos().z

			-- Parse positions to the table
			for i = 5, #msg, 2 do
				local temp = {x = tonumber(msg[i]), y = tonumber(msg[i+1]), z = posZ}

				-- Make sure we can reach it
				if (Map.isOnScreen(temp) and Map.isTileWalkable(temp.x, temp.y, temp.z)) then
					table.insert(cords, temp)
				end
			end

			-- No walkable positions found, play an alarm and warn the user
			if (#cords == 0) then
				local pos = Player.pos()
				alert()

				local str = "Failed to find a walkable position! Retrying in 0.2s, #" ..tostring(pos.x).. " " ..tostring(pos.y).. " " ..tostring(pos.z)
				
				for i = 5, #msg do
					str = str .." ".. msg[i]
				end

				Channel.warn(str)

				Player.delayWalker(300)

				-- Retry after 0.2s
				Callback.setTimeout(function()
					Ipc.handleMessage(message)
				end, Delay.pingDelay(200))

				return
			end

			Player.delayWalker(15000)

			Player.walkTo(cords[1].x, cords[1].y, cords[1].z, function()
				Player.delayWalker(0)

				-- Do we want to stop ignoring monsters
				if (msg[3] == "true") then
					if (tonumber(msg[4]) > 0) then
						Callback.setTimeout(function()
							Player.targetingIgnoring(false)
						end, tonumber(msg[4]) * 1000)
					else
						Player.targetingIgnoring(false)
					end
				end
			end)
		-- Goes to a label
		elseif (msg[2] == "goto") then
			Map.goToLabel(table.concat(msg, "|", 3), true)
		end
	elseif (msg[1] == "targeting") then
		-- Stops ignoring monsters till all of them are dead, Arg1: Partner to check for monsters around, Arg2: Range, Arg3: Timeout in seconds, Arg4: OPTIONAL CALLBACK
		if (msg[2] == "kill") then
			local time = os.time()
			local self = false
			if (string.lower(msg[3]) == "self") then self = true end -- Vocation we're looking for monsters around

			local publish = function(m) Ipc.handleMessage(m) end

			-- Check if there's a callback to execute
			if (msg[6] and string.lower(msg[6]) == "callback") then
				if (string.lower(msg[7]) == "publish") then
					publish = function(m) IpcPublisher.publishMessage(SCRIPT_DATA["Publisher"], SCRIPT_DATA["Topic"], m) end
				end
			end

			local callback = function(index) if (msg[6]) then local str = table.concat(msg, "|", 8) publish(str.. index) end end

			local function checkMonsters()
				Player.targetingIgnoring(false)
				Player.delayWalker(5000)

				if (self) then
					Callback.setTimeout(function()
						local monsters = Creatures.findAllCreatures(false)
						local monstersAround = {}

						-- Find monsters around me
						for i = 1, #monsters do
							if (Creatures.distFromSelf(monsters[i]) <= tonumber(msg[4])) then
								table.insert(monstersAround, monsters[i])
							end
						end

						-- All of the monsters died or timeout passed
						if (#monstersAround == 0 or os.difftime(os.time(), time) > tonumber(msg[5])) then
							Player.targetingIgnoring(true)

							if (not msg[6]) then
								Player.delayWalker(0)
							end

							if (string.match(msg[#msg], "wait")) then
								callback(tostring(SCRIPT_DATA["LastWait"]))
							else
								callback("")
							end

							if (string.match(msg[#msg], "wait")) then
								Ipc.handleMessage("walker|signal|60|" ..msg[#msg].. tostring(SCRIPT_DATA["LastWait"]))
								SCRIPT_DATA["LastWait"] = SCRIPT_DATA["LastWait"] + 1
							end
						else
							checkMonsters()
						end
					end, Delay.pingDelay(4000))
				else
					-- Ask partner for monsters around him
					IpcPublisher.publishMessage(SCRIPT_DATA["Publisher"], SCRIPT_DATA["Topic"], "request|monster|" ..msg[4])

					Ipc.setCondition("monster", function(message)
						-- Get number of monster around
						local monstersAround = String.splitString(message, "|")[2]

						-- All of the monsters died or timeout passed
						if (tonumber(monstersAround) == 0 or os.difftime(os.time(), time) > tonumber(msg[5])) then
							Player.targetingIgnoring(true)
							Player.delayWalker(0)

							callback()
						else
							checkMonsters()
						end
					end)
				end
			end

			checkMonsters()
		end
	elseif (msg[1] == "action") then
		-- Places wildgrowths on certain positions, Rest: Positions
		if (msg[2] == "wildgrowth") then
			Player.delayWalker(1000)

			for i = 3, #msg, 2 do
				table.insert(SCRIPT_DATA["Wildgrowth"], {x = tonumber(msg[i]), y = tonumber(msg[i+1])})
				Player.targetingIgnoring(false)
			end
		-- Destroys wildgrowth from a certain position, Arg1: X, Arg2: Y, Arg3: Message
		elseif (msg[2] == "dwildgrowth") then
			SCRIPT_DATA["Wildgrowth"] = {}

			local function destroyWildgrowth(x, y, callback)
				Player.delayWalker(1000)

				Callback.setTimeout(function()
					local machete = Player.getMachete()
					local z = Player.pos().z

					-- Tile ID = 2130, Wildgrowth found
					if (Map.getTileID(x, y, z).id == 2130) then
						Map.useWithGround(machete, x, y, z)

						destroyWildgrowth(x, y, callback)
					else
						Player.targetingIgnoring(true)
						Player.delayWalker(0)
						callback()
					end
				end, Delay.pingDelay(400))
			end

			destroyWildgrowth(tonumber(msg[3]), tonumber(msg[4]), function()
				IpcPublisher.publishMessage(SCRIPT_DATA["Publisher"], SCRIPT_DATA["Topic"], msg[5])
			end)
		-- Places bomb rune under character
		elseif (msg[2] == "bomb") then
			SCRIPT_DATA["UseBomb"] = true
			Event.startEvent("Bombrune")

			Player.delayWalker(1000)
			Player.targetingIgnoring(false)
		-- Stops keeping the bomb under a character
		elseif (msg[2] == "sbomb") then
			SCRIPT_DATA["UseBomb"] = false
			Event.stopEvent("Bombrune")

			Player.targetingIgnoring(true)
			Player.delayWalker(0)
		-- Waits till monsters from behind get close, Arg1: Direction, Arg2: Dist, Arg3: Monsters around, Arg4: Timeout in seconds
		elseif (msg[2] == "lure") then
			local creaturesBehind = Creatures.findInOppositeDirection(nil, msg[3], false)
			local times = os.time()

			if (#creaturesBehind > 0) then
				local distances = Creatures.sortByDistance(creaturesBehind)

				if (distances[1].dist > tonumber(msg[4])) then
					Player.delayWalker(2000)

					local function waitForMonsters()
						Callback.setTimeout(function()
							local distances = Creatures.sortByDistance(creaturesBehind)
							local monstersAround = Creatures.findAllCreatures(false, 2)
							local monstersEverywhere = Creatures.findAllCreatures(false, 7)

							if (os.difftime(os.time(), time) > tonumber(msg[6])) then
								Player.delayWalker(0)
								return
							elseif (not distances[1] or distances[1].dist <= tonumber(msg[4])) then
								if (#monstersEverywhere >= tonumber(msg[5]) and #monstersAround >= tonumber(msg[5]) or #monstersEverywhere < tonumber(msg[5]) and #monstersAround >= #monstersEverywhere) then
									Player.delayWalker(0)
									return
								end
							elseif (#Map.getWalkableTiles(Player.pos(), 2, true) <= 3) then
								Player.delayWalker(0)
								return
							else
								Player.delayWalker(2000)
							end
						end, Delay.pingDelay(200))
					end

					waitForMonsters()
				end
			end
		-- Waits till partner passed certain position, Arg1: x/y/z, Arg2: X/Y/Z, Arg3: +/-, Arg4: Timeout in seconds
		elseif (msg[2] == "wait") then
			local compare = function(a, b) if (msg[5] == "+") then return a >= b else return a <= b end end
			local check = function(t) return compare(t[msg[3]], tonumber(msg[4])) end
			local time = os.time()

			local function checkPosition()
				Player.delayWalker(5000)
				IpcPublisher.publishMessage(SCRIPT_DATA["Publisher"], SCRIPT_DATA["Topic"], "request|position")

				Ipc.setCondition("position", function(message)
					local position = String.splitString(message, "|")
					local cords = {["x"] = tonumber(position[2]), ["y"] = tonumber(position[3]), ["z"] = tonumber(position[4])}	-- Parse the position to the table

					-- Check if our partner passed X position or timeout passed
					if (check(cords)) then
						Player.delayWalker(0)
					elseif (os.difftime(os.time(), time) > tonumber(msg[6])) then
						alert()
						Channel.warn("Partner failed to pass certain coordinates! Retrying! #" ..msg[3].. msg[4].. msg[5])

						Ipc.handleMessage(message)
					else
						checkPosition()
					end
				end)
			end

			checkPosition()
		-- Starts/stops magic shield event, Arg1: True/false
		elseif (msg[2] == "utamovita") then
			if (msg[3] == "true" and CONFIG["Teamhunt"]["UtamoVita"]) then
				Event.startEvent("Magicshield")
			else
				Event.stopEvent("Magicshield")
			end
		end
	elseif (msg[1] == "check") then
		-- Continues when delay passes or another signal is received, Arg1: Delay in seconds, Arg2: Supply checker index
		if (msg[2] == "supplies") then
			local timeout = nil
			local success = nil
			local success2 = nil

			Player.delayWalker(tonumber(msg[3]) * 1000)

			IpcPublisher.publishMessage(SCRIPT_DATA["Publisher"], SCRIPT_DATA["Topic"], msg[4])

			-- Make sure we don't wait for a response after longer time
			timeout = Callback.setTimeout(function()
				Ipc.clearCondition(success)
				Ipc.clearCondition(success2)

				alert()
				Channel.warn("Failed to receive a response from partner! Leaving! #supplies" ..msg[4])

				Map.goToLabel("hunt|exit" ..msg[4])

				Player.targetingIgnoring(true)
				Player.looter(false)

				if (SCRIPT_DATA["HasteSpawn"]) then
					Event.startEvent("Haster")
				end

				return
			end, tonumber(msg[3]) * 1000)

			-- Synchronise players
			success = Ipc.setCondition(msg[4], function()
				IpcPublisher.publishMessage(SCRIPT_DATA["Publisher"], SCRIPT_DATA["Topic"], msg[4])

				if (SCRIPT_DATA["Vocation"] == "druid") then
					Ipc.handleMessage("request|supplies|pick")
				else
					Ipc.handleMessage("request|supplies|trade")
				end
			end)

			-- Check supplies
			success2 = Ipc.setCondition("supplies", function(message)
				local status = String.splitString(message, "|")[2]
				local stay = Hunt.checkAll(false, true)

				-- We need to leave, our partner called leave or we are low on supplies
				if (status == "false" or not stay) then
					Player.targetingIgnoring(true)
					Player.looter(false)

					if (SCRIPT_DATA["HasteSpawn"]) then
						Event.startEvent("Haster")
					end

					Ipc.handleMessage("walker|goto|hunt|exit" ..msg[4])
				end

				Callback.clearTimeout(timeout)
				Player.delayWalker(0)
			end)
		-- Checks if we should continue through an optional route, Arg1: Delay in seconds, Arg2: Route name
		elseif (msg[2] == "route") then
			local timeout = nil
			local success = nil
			local success2 = nil

			local option = CONFIG["Route"][msg[4]]

			Player.delayWalker(tonumber(msg[3]) * 1000)

			IpcPublisher.publishMessage(SCRIPT_DATA["Publisher"], SCRIPT_DATA["Topic"], msg[4])

			-- Make sure we don't wait for a response after longer time
			timeout = Callback.setTimeout(function()
				Ipc.clearCondition(success)
				Ipc.clearCondition(success2)

				alert()
				Channel.warn("Failed to receive a response from partner! #route" ..msg[4])

				Map.goToLabel("No-" ..msg[4])

				return
			end, tonumber(msg[3]) * 1000)

			-- Synchronise players
			success = Ipc.setCondition(msg[4], function()
				IpcPublisher.publishMessage(SCRIPT_DATA["Publisher"], SCRIPT_DATA["Topic"], msg[4])
				IpcPublisher.publishMessage(SCRIPT_DATA["Publisher"], SCRIPT_DATA["Topic"], "route|" ..tostring(option))
			end)

			-- Check route option
			success2 = Ipc.setCondition("route", function(message)
				local pOption = String.splitString(message, "|")[2]

				if (pOption == "false" or not option) then
					Ipc.handleMessage("No-" ..msg[4])
				end

				Callback.clearTimeout(timeout)
				Player.delayWalker(0)
			end)
		end
	elseif (msg[1] == "request") then
		-- Requests a position from partner
		if (msg[2] == "position") then
			local pos = Player.pos()

			IpcPublisher.publishMessage(SCRIPT_DATA["Publisher"], SCRIPT_DATA["Topic"], "position|" ..tostring(pos.x).. "|" ..tostring(pos.y).. "|" ..tostring(pos.z))
		-- Requests number of monsters around partner, Arg1: Range
		elseif (msg[2] == "monster") then
			local monsters = Creatures.findAllCreatures(false)
			local monstersAround = {}

			for i = 1, #monsters do
				if (Creatures.distFromSelf(monsters[i]) <= tonumber(msg[3])) then
					table.insert(monstersAround, monsters[i])
				end
			end

			IpcPublisher.publishMessage(SCRIPT_DATA["Publisher"], SCRIPT_DATA["Topic"], "monster|" ..tostring(#monstersAround))
		-- Sents every signal recieved this round
		elseif (msg[2] == "signal") then
			for i = 1, #SCRIPT_DATA["IpcSignals"] do
				IpcPublisher.publishMessage(SCRIPT_DATA["Publisher"], SCRIPT_DATA["Topic"], SCRIPT_DATA["IpcSignals"][i])
			end
		elseif (msg[2] == "supplies") then
			if (msg[3] == "pick") then
				local dest = BACKPACKS["PotionBackpack"].index or BACKPACKS["SuppliesBackpack"].index or BACKPACKS["MainBackpack"].index
				local stop = false

				local function pickSupplies()
					if (not stop) then
						Callback.setTimeout(function()
							local pos = Player.pos()

							if (not Cont.isOpen("Browse Field")) then
								Depot.browseField(pos.x, pos.y, pos.z)
							end

							local browseField = Cont.getByName("Browse Field")

							if (not browseField) then
								pickSupplies()
								return
							end

							for spot = 0, Cont.itemCount(browseField) - 1 do
								local data = Cont.getItemDataFromSpot(browseField, spot)

								if (string.match(string.lower(Item.getItemName(data.id)), "potion")) then
									Cont.moveItemToContainer(browseField, dest, spot, Cont.itemCount(dest) - 1)
									break
								end
							end

							pickSupplies()
						end, 200)
					end
				end

				pickSupplies()

				Ipc.setCondition("pick", function()
					Callback.setTimeout(function()
						stop = true
						IpcPublisher.publishMessage(SCRIPT_DATA["Publisher"], SCRIPT_DATA["Topic"], "supplies|" ..tostring(Hunt.checkAll(false, false))) -- Send a message for supply checker
					end, Delay.pingDelay(800))
				end)				
			elseif (msg[3] == "amount") then
				local name = CONFIG["Potions"]["ManaName"]
				local max = CONFIG["Potions"]["ManaMax"]
				local cur = Item.count(name)
				local pos = Player.pos()

				local missing = math.min(tonumber(max) - cur, 100)

				if (missing > 0 and Player.cap() > getItemWeight(Item.getItemID(name)) * missing) then
					IpcPublisher.publishMessage(SCRIPT_DATA["Publisher"], SCRIPT_DATA["Topic"], "trade|" ..tostring(missing).. "|" ..tostring(pos.x).. "|" ..tostring(pos.y).. "|" ..tostring(pos.z))
				else
					IpcPublisher.publishMessage(SCRIPT_DATA["Publisher"], SCRIPT_DATA["Topic"], "trade|0")
				end
			elseif (msg[3] == "trade") then
				IpcPublisher.publishMessage(SCRIPT_DATA["Publisher"], SCRIPT_DATA["Topic"], "request|supplies|amount")

				Ipc.setCondition("trade", function(message)
					local string = String.splitString(message, "|")
					local amount = tonumber(string[2])
					local x = string[3] and tonumber(string[3]) or nil
					local y = string[4] and tonumber(string[4]) or nil
					local z = string[5] and tonumber(string[5]) or nil

					local potion = CONFIG["Potions"]["TradeName"]

					-- Trade potion not found, druid doesn't need more potions or we don't have more potions
					if (not potion or amount == 0 or Item.count(potion) < amount) then
						IpcPublisher.publishMessage(SCRIPT_DATA["Publisher"], SCRIPT_DATA["Topic"], "pick")
						IpcPublisher.publishMessage(SCRIPT_DATA["Publisher"], SCRIPT_DATA["Topic"], "supplies|" ..tostring(Hunt.checkAll(false, false))) -- Send a message for supply checker
					-- Drop potion and continue looping
					else
						local cont, spot = Cont.findInContainers(potion)
						Cont.moveItemToGround(cont, spot, x, y, z, amount)

						-- Keep looping
						Callback.setTimeout(function()
							Ipc.handleMessage("request|supplies|trade")
						end, Delay.pingDelay(400))
					end
				end)
			end
		end
	elseif (msg[1] == "hud") then
		local pProfit = tonumber(msg[2])
		local pWaste = tonumber(msg[3])

		local previousP = HUD["LootHUD"]["Items"]["Loot"][3043].count
		local previousW = HUD["LootHUD"]["Items"]["Waste"][3043].count

		HUD["LootHUD"]["Items"]["Loot"][3043].count = pProfit
		HUD["LootHUD"]["Items"]["Waste"][3043].count = pWaste

		HUD["LootHUD"]["Loot"] = HUD["LootHUD"]["Loot"] + pProfit - previousP
		HUD["LootHUD"]["Waste"] = HUD["LootHUD"]["Waste"] + math.abs(pWaste) - math.abs(previousW)
		
		Hud.setText(HUD["LootHUD"]["Items"]["Loot"][3043].amount, pProfit.. " gp")
		Hud.setText(HUD["LootHUD"]["Items"]["Waste"][3043].amount, pWaste.. " gp")
	else
		Ipc.checkConditions(message)
	end
end

--		8 8888        8 8 8888      88 8 888888888o.      
--		8 8888        8 8 8888      88 8 8888    `^888.   
--		8 8888        8 8 8888      88 8 8888        `88. 
--		8 8888        8 8 8888      88 8 8888         `88 
--		8 8888        8 8 8888      88 8 8888          88 
--		8 8888        8 8 8888      88 8 8888          88 
--		8 8888888888888 8 8888      88 8 8888         ,88 
--		8 8888        8 ` 8888     ,8P 8 8888        ,88' 
--		8 8888        8   8888   ,d8P  8 8888    ,o88P'   
--		8 8888        8    `Y88888P'   8 888888888P'      

-- Returns a new HUD pointer
function Hud.createNew(x, y, value, r, g, b, center)
	if (type(value) == "number") then
		return HUDCreateItemImage(x, y, value, r, g)
	else
		if (center) then
			x = x - (string.len(value) * 6) / 2
		end

		return HUDCreateText(x, y, value, r, g, b)
	end
end

-- Creates a HUD text
function Hud.createNewText(x, y, value, color, center)
	return Hud.createNew(x, y, value, color.r, color.g, color.b, center and true or false)
end

-- Creates a HUD image
function Hud.createNewImage(x, y, id, size, count)
	return Hud.createNew(x, y, id, size, count)
end

-- Changes HUD's text position
function Hud.setPosition(hud, x, y)
	return HUDUpdateLocation(hud, x, y)
end

-- Changes HUD's text message
function Hud.setText(hud, text)
	return HUDUpdateTextText(hud, text)
end

-- Changes HUD's text color
function Hud.setTextColor(hud, color)
	return HUDUpdateTextColor(hud, color.r, color.g, color.b)
end

-- Returns mains window dimension ( gamewindow[x/y/w/h] )
function Hud.getMainWindowSize()
	return HUDGetDimensions()
end

-- Increases y offset
function Hud.incYOffset(side, value)
	Hud[side].yoffset = Hud[side].yoffset + value
	return Hud[side].yoffset
end

-- Adds parts to the title table
function Hud.addTitle(title, side)
	table.insert(HUD[side], {[title] = {}})
	HUD[title] = {side = side}
end

-- Adds parts to the components table
function Hud.addComponent(title, name, value)
	local side = HUD[title].side == "Left" and "Left" or "Right"

	table.insert(HUD[side][#HUD[side]][title], name)
	HUD[title][name] = {pointer = nil, value = value}
end

-- Updates components
function Hud.updateText(title, name, var)
	local part = HUD[title][name]
	local var = tostring(var)

	if (part.value ~= var) then
		Hud.setText(part.pointer, var)
	end
end

-- Draws HUD
function Hud.drawHUD()
	local leftSide = Hud["Left"]
	local rightSide = Hud["Right"]

	-- Left Part
	for k, v in ipairs(HUD["Left"]) do
		-- Sections
		for title, t in pairs(v) do
			local x = leftSide.centerx
			local y = leftSide.y + Hud.incYOffset("Left", 30)

			HUD[title].pointer = Hud.createNewText(x, y, title, HUD["TitleColor"], true)
			Hud.incYOffset("Left", 5)

			-- Names
			for _, name in ipairs(t) do
				local x = Hud["Left"].x
				local y = Hud["Left"].y + Hud.incYOffset("Left", 15)

				HUD[title][name].textPointer = Hud.createNewText(x, y, name ..":", HUD["DescriptionColor"], false)
				HUD[title][name].pointer = Hud.createNewText(x + 120, y, HUD[title][name].value, HUD["InformationColor"], false)
			end
		end
	end

	-- Right Part ( Loot )
	for k, v in ipairs(HUD["Right"]) do
		-- Sections
		for title, t in pairs(v) do
			local x = rightSide.centerx
			local y = rightSide.y + Hud.incYOffset("Right", 30)

			HUD[title] = {pointer = Hud.createNewText(x, y, title, HUD["TitleColor"], true), x = x - (string.len(title) * 6) / 2, y = y}
			Hud.incYOffset("Right", 5)
		end
	end
end

-- Redraws HUD
function Hud.redrawHUD()
	local leftSide = Hud["Left"]
	local rightSide = Hud["Right"]
	leftSide.yoffset = 0

	-- Redraw left side
	for k, v in ipairs(HUD["Left"]) do
		for title, t in pairs(v) do
			local x = leftSide.centerx
			local y = leftSide.y + Hud.incYOffset("Left", 30)

			Hud.setPosition(HUD[title].pointer, x - (string.len(title) * 6) / 2, y)
			Hud.setTextColor(HUD[title].pointer, HUD["TitleColor"])

			Hud.incYOffset("Left", 5)

			for _, name in ipairs(t) do
				local x = Hud["Left"].x
				local y = Hud["Left"].y + Hud.incYOffset("Left", 15)

				Hud.setPosition(HUD[title][name].textPointer, x, y)
				Hud.setTextColor(HUD[title][name].textPointer, HUD["DescriptionColor"])

				Hud.setPosition(HUD[title][name].pointer, x + 120, y)
				Hud.setTextColor(HUD[title][name].pointer, HUD["InformationColor"])
			end
		end
	end

	local i = 1
	local hud = HUD["LootHUD"]["Items"]

	-- Redraw right side ( Loot )
	for _, data in pairs(hud["Loot"]) do
		data.x = Hud["Right"].centerx

		Hud.setPosition(data.image, data.x - 115, HUD["Loot"].y + 15 * i)
		Hud.setPosition(data.name, data.x - 95, HUD["Loot"].y + 15 * i)
		Hud.setPosition(data.amount, data.x + 30, HUD["Loot"].y + 15 * i)

		Hud.setTextColor(data.name, HUD["LootColor"])
		Hud.setTextColor(data.amount, HUD["ValueColor"])

		i = i + 1
	end

	i = 1

	for _, data in pairs(hud["Waste"]) do
		data.x = Hud["Right"].centerx

		Hud.setPosition(data.image, data.x - 115, HUD["Waste"].y + 15 * i)
		Hud.setPosition(data.name, data.x - 95, HUD["Waste"].y + 15 * i)
		Hud.setPosition(data.amount, data.x + 30, HUD["Waste"].y + 15 * i)

		Hud.setTextColor(data.name, HUD["LootColor"])
		Hud.setTextColor(data.amount, HUD["ValueColor"])

		i = i + 1
	end

	for k, v in ipairs(HUD["Right"]) do
		for title, t in pairs(v) do
			local x = rightSide.centerx

			Hud.setPosition(HUD[title].pointer, x - (string.len(title) * 6) / 2, HUD[title].y)
			Hud.setTextColor(HUD[title].pointer, HUD["TitleColor"])

			HUD[title].x = x - (string.len(title) * 6) / 2
		end
	end
end

-- Checks size
function Hud.checkSize()
	local screen = Hud.getMainWindowSize()

	-- Different dimensions, redraw
	if (screen.gamewindowx + screen.gamewindoww + 10 ~= Hud["Right"].x or
		screen.gamewindowy ~= Hud["Right"].y or
		screen.eqwindowx - 120 ~= Hud["Right"].centerx) then
		
		-- Set new dimensions
		Hud["Right"].x = screen.gamewindowx + screen.gamewindoww + 10
		Hud["Right"].y = screen.gamewindowy
		Hud["Right"].centerx = screen.eqwindowx - 120

		Hud["Left"].y = screen.gamewindowy
		Hud.redrawHUD()
	end
end

-- Checks if changes were made in the config
function Hud.checkChanges()
	local names = {"TitleColor", "DescriptionColor", "InformationColor", "LootColor", "ValueColor"}
	COLORS["Random"] = {r = math.random(0, 255), g = math.random(0, 255), b = math.random(0, 255)}
	
	local fileName = "JontorHUD"
	Ini.parseFile(fileName)

	for i = 1, #names do
		local new = COLORS[String.titleCase(CONFIG["HUD"][names[i]])]

		if (not new) then
			return false
		end

		if (new.r ~= HUD[names[i]].r or new.g ~= HUD[names[i]].g or new.b ~= HUD[names[i]].b) then
			return true
		end
	end

	return false
end

-- Saves parsed values for HUD
function Hud.saveValues()
	local names = {"TitleColor", "DescriptionColor", "InformationColor", "LootColor", "ValueColor"}

	for i = 1, #names do
		if (not COLORS[String.titleCase(CONFIG["HUD"][names[i]])]) then
			Channel.warn("Warning! Undefined color value for: " ..names[i])
		else
			HUD[names[i]] = COLORS[String.titleCase(CONFIG["HUD"][names[i]])]

			if (CONFIG["HUD"][names[i]] == "random") then
				COLORS["Random"] = {r = math.random(0, 255), g = math.random(0, 255), b = math.random(0, 255)}
			end
		end
	end
end

-- Inits HUD
function Hud.initHUD()
	local screen = Hud.getMainWindowSize()

	Hud["Right"] = {}
	Hud["Left"] = {}

	-- Set right side coordinates
	Hud["Right"] = {
		x = screen.gamewindowx + screen.gamewindoww + 10,
		y = screen.gamewindowy,
		centerx = screen.eqwindowx - 120,
		yoffset = 0
	}

	-- Set left side coordinates
	Hud["Left"] = {
		x = 10,
		y = screen.gamewindowy,
		centerx = 165,
		yoffset = 0
	}

	HUD["Experience"] = Player.experience()

	Hud.addTitle("Script Information", "Left")
	Hud.addComponent("Script Information", "Script name", "---")
	Hud.addComponent("Script Information", "Library version", "---")
	Hud.addComponent("Script Information", "Ping", "---")

	Hud.addTitle("Character Information", "Left")
	Hud.addComponent("Character Information", "Level", "---")
	Hud.addComponent("Character Information", "Stamina", "---")
	Hud.addComponent("Character Information", "Balance", "---")

	Hud.addTitle("Script State", "Left")
	Hud.addComponent("Script State", "Refilling", "---")
	Hud.addComponent("Script State", "Hunting", "---")
	Hud.addComponent("Script State", "Leaving", "---")

	Hud.addTitle("Session Information", "Left")
	Hud.addComponent("Session Information", "Time played", "---")
	Hud.addComponent("Session Information", "Time to next level", "---")
	Hud.addComponent("Session Information", "Experience gained", "---")
	Hud.addComponent("Session Information", "Time to SS", "---")

	Hud.addTitle("Botting Information", "Left")
	Hud.addComponent("Botting Information", "Exp/h", "---")
	Hud.addComponent("Botting Information", "Spawn exp/h", "---")
	Hud.addComponent("Botting Information", "Profit/h", "---")
	Hud.addComponent("Botting Information", "Loot", "---")
	Hud.addComponent("Botting Information", "Profit", "---")
	Hud.addComponent("Botting Information", "Waste", "---")

	Hud.addTitle("Loot", "Right")
	Hud.addTitle("Waste", "Right")
end

-- Updates HUD
function Hud.updateHUD()
	Hud.updateText("Script Information", "Ping", Player.ping())

	Hud.updateText("Character Information", "Level", Player.level())
	Hud.updateText("Character Information", "Stamina", Player.stamina())
	Hud.updateText("Character Information", "Balance", String.commaSplitString(SCRIPT_DATA["Balance"]))

	if (not SCRIPT_DATA["IsHunting"] and not SCRIPT_DATA["IsLeaving"]) then
		Hud.updateText("Script State", "Refilling", String.convertTime(os.time() - HUD["RefillTime"]))
		HUD["LastRefillTime"] = os.time() - HUD["RefillTime"]
	elseif (SCRIPT_DATA["IsHunting"]) then
		Hud.updateText("Script State", "Hunting", String.convertTime(os.time() - HUD["HuntTime"]))
		HUD["LastHuntTime"] = os.time() - HUD["HuntTime"]
	elseif (SCRIPT_DATA["IsLeaving"]) then
		Hud.updateText("Script State", "Leaving", String.convertTime(os.time() - HUD["LeaveTime"]))
		HUD["LastLeaveTime"] = os.time() - HUD["LeaveTime"]
	end

	Hud.updateText("Session Information", "Time played", String.convertTime(os.time() - HUD["Time"]))
	Hud.updateText("Session Information", "Time to next level", String.convertTime(((Player.experienceToNext()) / (Player.experience() - HUD["Experience"])) * (os.time() - HUD["Time"])))
	Hud.updateText("Session Information", "Experience gained", String.commaSplitString(Player.experience() - HUD["Experience"]))
	Hud.updateText("Session Information", "Time to SS", String.convertTime(Map.getTimeToServerSave()))

	Hud.updateText("Botting Information", "Exp/h", math.floor((Player.experience() - HUD["Experience"]) / ((os.time() - HUD["Time"]) / 3600)) .."/h")

	if (SCRIPT_DATA["IsHunting"]) then
		Hud.updateText("Botting Information", "Spawn exp/h", math.floor((Player.experience() - HUD["Experience"]) / ((os.time() - HUD["HuntTime"]) / 3600)) .."/h")
	end

	Hud.updateText("Botting Information", "Profit/h", math.floor((HUD["LootHUD"]["Loot"] - HUD["LootHUD"]["Waste"]) / ((os.time() - HUD["Time"]) / 3600)) .." gp/h")
	Hud.updateText("Botting Information", "Loot", String.commaSplitString(HUD["LootHUD"]["Loot"]) .." gp")
	Hud.updateText("Botting Information", "Profit", String.commaSplitString(HUD["LootHUD"]["Loot"] - HUD["LootHUD"]["Waste"]) .." gp")
	Hud.updateText("Botting Information", "Waste", String.commaSplitString(HUD["LootHUD"]["Waste"]) .." gp")
end

-- Returns current amount of items
function Hud.countItems()
	local currentAmount = {}
	local equipmentSlots = {"head", "amulet", "backpack", "armor", "shield", "weapon", "legs", "feet", "ring", "ammo"}

	-- Count equipment
	for i = 1, #equipmentSlots do
		local slot = Item.eqData(equipmentSlots[i])

		if (not HUD["LootBlacklist"][tostring(slot.id)] or not slot.id) then
			if (not currentAmount[Item.inactiveRingID(slot.id)]) then
				currentAmount[Item.inactiveRingID(slot.id)] = 0
			end

			currentAmount[Item.inactiveRingID(slot.id)] = currentAmount[Item.inactiveRingID(slot.id)] + slot.count
		end
	end
	
	-- Count items in backpacks
	for k, v in pairs(BACKPACKS) do
		if (v.index) then
			for spot = 0, Cont.itemCount(v.index) - 1 do
				local item = Cont.getItemDataFromSpot(v.index, spot)

				if (not HUD["LootBlacklist"][tostring(item.id)]) then
					if (not currentAmount[item.id]) then
						currentAmount[item.id] = 0
					end

					currentAmount[item.id] = currentAmount[item.id] + item.count
				end
			end
		end
	end

	return currentAmount
end

-- Adds items to HUD
function Hud.addItem(type, id, amount)
	local price = type == "Loot" and Item.getValue or Item.getCost
	local hud = HUD["LootHUD"]["Items"][String.titleCase(type)]
	local x = Hud["Right"].centerx

	-- HUD["Loot"] or HUD["Waste"] current Y position
	local y = HUD[type].y + 15 * (Table.countLength(hud) + 1)

	-- Item already registered
	if (hud[id]) then
		hud[id].count = hud[id].count + amount
		Hud.setText(hud[id].amount, hud[id].count.. " (" ..String.commaSplitString(price(id) * hud[id].count).. " gp)")
	-- New item
	else
		local data = {
			count = amount,
			image = Hud.createNewImage(x - 115, y - 6, id, 8),
			name = Hud.createNewText(x - 95, y, String.titleCase(String.limitLength(Item.getItemName(id), 18, "..")), HUD["LootColor"]),
			amount = Hud.createNewText(x + 30, y, amount.. " (" ..String.commaSplitString(price(id) * amount).. " gp)", HUD["ValueColor"]),
			x = x,
			y = y,
			type = type
		}

		hud[id] = data

		-- Move the HUD if adding new item to Loot
		if (type == "Loot") then
			Hud.moveHUD()
		end
	end
end

-- Moves HUD
function Hud.moveHUD()
	-- Move waste part
	for id, data in pairs(HUD["LootHUD"]["Items"]["Waste"]) do
		data.y = data.y + 15

		Hud.setPosition(data.image, data.x - 115, data.y)
		Hud.setPosition(data.name, data.x - 95, data.y)
		Hud.setPosition(data.amount, data.x + 30, data.y)
	end

	-- Move sections
	HUD["Waste"].y = HUD["Waste"].y + 15
	Hud.setPosition(HUD["Waste"].pointer, HUD["Waste"].x, HUD["Waste"].y)
end

--		8 888888888o.   8 8888888888 `8.`888b                 ,8' 8 888888888o.    8 8888 8888888 8888888888  8 8888 b.             8     ,o888888o.    
--		8 8888    `88.  8 8888        `8.`888b               ,8'  8 8888    `88.   8 8888       8 8888        8 8888 888o.          8    8888     `88.  
--		8 8888     `88  8 8888         `8.`888b             ,8'   8 8888     `88   8 8888       8 8888        8 8888 Y88888o.       8 ,8 8888       `8. 
--		8 8888     ,88  8 8888          `8.`888b     .b    ,8'    8 8888     ,88   8 8888       8 8888        8 8888 .`Y888888o.    8 88 8888           
--		8 8888.   ,88'  8 888888888888   `8.`888b    88b  ,8'     8 8888.   ,88'   8 8888       8 8888        8 8888 8o. `Y888888o. 8 88 8888           
--		8 888888888P'   8 8888            `8.`888b .`888b,8'      8 888888888P'    8 8888       8 8888        8 8888 8`Y8o. `Y88888o8 88 8888           
--		8 8888`8b       8 8888             `8.`888b8.`8888'       8 8888`8b        8 8888       8 8888        8 8888 8   `Y8o. `Y8888 88 8888   8888888 
--		8 8888 `8b.     8 8888              `8.`888`8.`88'        8 8888 `8b.      8 8888       8 8888        8 8888 8      `Y8o. `Y8 `8 8888       .8' 
--		8 8888   `8b.   8 8888               `8.`8' `8,`'         8 8888   `8b.    8 8888       8 8888        8 8888 8         `Y8o.`    8888     ,88'  
--		8 8888     `88. 8 888888888888        `8.`   `8'          8 8888     `88.  8 8888       8 8888        8 8888 8            `Yo     `8888888P'    

--- Rewrites looter settings to match backpacks
function Rewriting.looter()
	local looterStyle = CONFIG["Looter"]["LootStyle"] == "first" and 0 or 1
	local looterStart = "<panel name=\"Looter\">\n\t<control name=\"LootList\" mode=\"" ..looterStyle.. "\" minimum=\"0\" maximum=\"" ..CONFIG["Looter"]["LootIgnore"].."\" skinner=\"2\" unlisted=\"1\">\n"
	local looterEnd = "\t</control>\n</panel>"
	
	local pattern = 'ID="(.-)"'
	local whiteList = CONFIG["Looter"] and CONFIG["Looter"]["LootWhitelist"]
	
	-- Grabs items in looter
	local function grabLooterList(pattern)
		local file = io.open("../Settings/" ..SCRIPT_DATA["Name"].. ".xbst", "r")
		local list = {}

		for line in file:lines() do
			for word in string.gmatch(line, pattern) do
				table.insert(list, word)
			end
		end

		file:close()
		return list
	end
	
	-- Matches items to correct backpacks and returns complete string
	local function defineType(t)
		local str = ""
		
		local function checkType(items, change)
			for i = 1, #items do
				local item = Item.getItemID(items[i])

				if (change) then
					item = Item.getItemID(tonumber(items[i]))
				end

				if (item ~= 0) then
					if (Item.isGold(item) and BACKPACKS["GoldBackpack"].index) then
						str = str.. "\t\t<item ID=\"" ..item.. "\" action=\"" ..BACKPACKS["GoldBackpack"].index.. "\" deposit=\"0\"/>\n"
					elseif (Item.isStackable(item) and BACKPACKS["StackBackpack"].index) then
						str = str.. "\t\t<item ID=\"" ..item.. "\" action=\"" ..BACKPACKS["StackBackpack"].index.. "\" deposit=\"0\"/>\n"
					elseif (Item.isNonStackable(item) and BACKPACKS["NonStackBackpack"].index) then
						str = str.. "\t\t<item ID=\"" ..item.. "\" action=\"" ..BACKPACKS["NonStackBackpack"].index.. "\" deposit=\"0\"/>\n"
					elseif (BACKPACKS["LootBackpack"].index) then
						str = str.. "\t\t<item ID=\"" ..item.. "\" action=\"" ..BACKPACKS["LootBackpack"].index.. "\" deposit=\"0\"/>\n"
					else
						str = str.. "\t\t<item ID=\"" ..item.. "\" action=\"" ..BACKPACKS["MainBackpack"].index.. "\" deposit=\"0\"/>\n"
					end
				end
			end
		end
		
		checkType(t, true)
		

		if (whiteList) then
			if (type(whiteList) == "table" and #whiteList > 0) then
				checkType(whiteList, false)
			elseif (type(whiteList) == "string") then
				local item = Item.getItemID(whiteList)

				if (item == 0) then
					return str
				end

				if (Item.isGold(whiteList) and BACKPACKS["GoldBackpack"].index) then
					str = str.. "\t\t<item ID=\"" ..item.. "\" action=\"" ..BACKPACKS["GoldBackpack"].index.. "\" deposit=\"0\"/>\n"
				elseif (Item.isStackable(whiteList) and BACKPACKS["StackBackpack"].index) then
					str = str.. "\t\t<item ID=\"" ..item.. "\" action=\"" ..BACKPACKS["StackBackpack"].index.. "\" deposit=\"0\"/>\n"
				elseif (Item.isNonStackable(whiteList) and BACKPACKS["NonStackBackpack"].index) then
					str = str.. "\t\t<item ID=\"" ..item.. "\" action=\"" ..BACKPACKS["NonStackBackpack"].index.. "\" deposit=\"0\"/>\n"
				elseif (BACKPACKS["LootBackpack"].index) then
					str = str.. "\t\t<item ID=\"" ..item.. "\" action=\"" ..BACKPACKS["LootBackpack"].index.. "\" deposit=\"0\"/>\n"
				else
					str = str.. "\t\t<item ID=\"" ..item.. "\" action=\"" ..BACKPACKS["MainBackpack"].index.. "\" deposit=\"0\"/>\n"
				end
			end
		end

		return str
	end
	
	local file = io.open("../Settings/" ..SCRIPT_DATA["Name"].. ".xbst", "r")

	if (not file) then
		error("Please make sure to have a .xbst file named \"" ..SCRIPT_DATA["Name"].. "\" in your settings folder.")
	end

	local content = file:read("*all")

	file:close()
	
	local itemsList = grabLooterList(pattern)					-- Get current looter settings
	local stringList = defineType(itemsList)					-- Match backpacks and get new looter settings
	local looterFinish = looterStart ..stringList ..looterEnd	-- Complete the string
	
	content = string.gsub(content, '<panel%sname="Looter">(.-)</panel>', looterFinish, 1)
	
	local fileToWrite = io.open("../Settings/" ..SCRIPT_DATA["Name"].. ".xbst", "w+")
	fileToWrite:write(content)
	fileToWrite:flush()
	fileToWrite:close()
	loadSettings(SCRIPT_DATA["Name"], "Looter")
end

-- Returns exit name
function Rewriting.getSpawnExit()
	local file = io.open("../Settings/" ..SCRIPT_DATA["Name"].. ".xbst", "r")
	
	if (not file) then
		error("Please make sure to have a .xbst file named \"" ..SCRIPT_DATA["Name"].. "\" in your settings folder.")
	end

	file:close()

	-- Check every line and find an exit from town
	for line in io.lines("../Settings/" ..SCRIPT_DATA["Name"].. ".xbst") do
		if (string.find(line, "-spawn")) then
			local exit = String.splitString(line, "|")[2]
			exit = String.splitString(exit, "-")[1]

			return exit
		end
	end
end

-- Returns closest waypoints
function Rewriting.findClosestWaypoint(from, to)
	local file = io.open("../Settings/" ..SCRIPT_DATA["Name"].. ".xbst", "r")
	
	if (not file) then
		error("Please make sure to have a .xbst file named \"" ..SCRIPT_DATA["Name"].. "\" in your settings folder.")
	end
	
	local content = file:read("*all")
	local walkerWaypointsStart, walkerWaypointsStop, waypoints = string.find(content, '<panel%sname="Walker">.-<control%sname="WaypointList">(.-)</control>.-</panel>')

	file:close()

	local playerPos = Player.pos()
	local index = 1
	local pattern = "<item%stext=\"(.-)%s%((%d+),%s(%d+),%s(%d+)%)"
	local waypointsStart, waypointsStop, wpts = string.find(waypoints, '<item%stext="' ..from.. ':"%stag="255"/>(.-)<item%stext="' ..to.. ':"%stag="255"/>')
	local sorted = {}

	-- Check type of found waypoint
	local function checkType(type)
		if (string.find(type, "Node")) then
			return "node"
		elseif (string.find(type, "Stand")) then
			return "stand"
		elseif (string.find(type, "Rope")) then
			return "rope"
		elseif (string.find(type, "Ladder")) then
			return "ladder"
		elseif (string.find(type, "Hole")) then
			return "hole"
		elseif (string.find(type, "LWalk1")) then
			return "lwalk1"
		elseif (string.find(type, "LWalk3")) then
			return "lwalk3"
		elseif (string.find(type, "LWalk4")) then
			return "lwalk4"
		elseif (string.find(type, "LWalk5")) then
			return "lwalk5"
		end

		return nil
	end

	-- Keep getting waypoints from the list
	while (true) do
		local start, stop, type, posX, posY, posZ = string.find(wpts, pattern, index)

		if (not start or not posX or not posY or not posZ) then
			break
		end

		if (tostring(playerPos.z) == posZ) then
			table.insert(sorted, {x = tonumber(posX), y = tonumber(posY), z = tonumber(posZ), type = checkType(type)})
		end

		index = stop + 1
	end

	sorted = Table.sortByDistance(sorted)

	if (not sorted[1]) then
		return waypoints, waypointsStart, nil
	end

	-- Make sure you can reach the tile
	if (Map.isOnScreen(sorted[1]) and not Map.isTileReachable(Player.pos(), sorted[1], {}, {Player.pos()})) then
		for i = 2, #sorted do
			if (Map.isTileReachable(Player.pos(), sorted[i], {}, {Player.pos()})) then
				sorted[1] = sorted[i]
				break
			end
		end
	end

	return waypoints, waypointsStart, sorted
end

--- Makes a leave label
function Rewriting.insertClosestWaypoint(start, stop, label, callback)

	-- Refinds the waypoint and puts a label behind it
	local function insertLabel(start, t, waypoints)
		local waypointsList = ""
		local _start, _stop = nil, nil
		
		_start, _stop = string.find(waypoints, "<item%stext=\"" ..TAGS[t[1].type][2].. "%s%(" ..tostring(t[1].x).. ",%s" ..tostring(t[1].y).. ",%s" ..tostring(t[1].z).. "%)\"%stag=\"" ..TAGS[t[1].type][1].. "\"/>", start)

		if (not _start or not _stop) then
			return
		end

		waypointsList = "<panel name=\"Walker\"><control name=\"WaypointList\">" ..string.sub(waypoints, 1, _start - 1).. "<item text=\"" ..label.. ":\" tag=\"255\"/>\n\t\t" ..string.sub(waypoints, _start).. "</control></panel>"
		
		return waypointsList
	end

	local waypoints, start, wpts = Rewriting.findClosestWaypoint(start, stop)
	
	if (not wpts or not wpts[1]) then
		if (callback) then callback(false) end
		return
	end

	local waypointsList = insertLabel(start, wpts, waypoints)
	local tmpFileName = "tmp." ..Player.name().. ".walker." ..tostring(math.random(0, 99999))
	local tmpFile = io.open("../Settings/" ..tmpFileName.. ".xbst", "w+")

	if (tmpFile) then
		tmpFile:write(waypointsList)
		tmpFile:flush()
		tmpFile:close()
		
		loadSettings(tmpFileName, "Walker")

		Callback.setTimeout(function()
			Map.goToLabel(label, true)
			Player.walker(true)

			if (callback) then callback(true) end

			Callback.setTimeout(function()
				os.remove("../Settings/" ..tmpFileName.. ".xbst")
				return
			end, Delay.pingDelay(400))
		end, Delay.pingDelay(200))
	end
end

--		8 8888 b.             8  8 8888           8 8888888888    8 8888 8 8888         8 8888888888   
--		8 8888 888o.          8  8 8888           8 8888          8 8888 8 8888         8 8888         
--		8 8888 Y88888o.       8  8 8888           8 8888          8 8888 8 8888         8 8888         
--		8 8888 .`Y888888o.    8  8 8888           8 8888          8 8888 8 8888         8 8888         
--		8 8888 8o. `Y888888o. 8  8 8888           8 888888888888  8 8888 8 8888         8 888888888888 
--		8 8888 8`Y8o. `Y88888o8  8 8888           8 8888          8 8888 8 8888         8 8888         
--		8 8888 8   `Y8o. `Y8888  8 8888           8 8888          8 8888 8 8888         8 8888         
--		8 8888 8      `Y8o. `Y8  8 8888           8 8888          8 8888 8 8888         8 8888         
--		8 8888 8         `Y8o.`  8 8888           8 8888          8 8888 8 8888         8 8888         
--		8 8888 8            `Yo  8 8888           8 8888          8 8888 8 888888888888 8 888888888888 

-- Returns .ini file name
function Ini.getFileName()
	local vocation = SCRIPT_DATA["Vocation"] == "knight" and "EK" or SCRIPT_DATA["Vocation"] == "paladin" and "RP" or SCRIPT_DATA["Vocation"] == "sorcerer" and "MS" or SCRIPT_DATA["Vocation"] == "druid" and "ED" or SCRIPT_DATA["Vocation"] == "mage" and "M"
	local _fileName = string.match(SCRIPT_DATA["Name"], "^%[.-%]%s+(.+)$")
	local fileName = "[" ..vocation.. "][" ..Player.name().. "] " .._fileName

	return fileName
end

-- Checks if file exists
function Ini.isFileExisting(fileName)
	local file = io.open("../Configs/" ..fileName.. ".ini", "r")

	if (file) then
		file:close()
		return false
	end

	return true
end

-- Makes a table from .ini file
function Ini.parseFile(fileName)
	local t = {}
	local file = io.open("../Configs/" ..fileName.. ".ini", "r")

	if (file) then
		for line in file:lines() do
			-- Match [TITLE]
			local s = string.match(line, "%[(.+)%]")

			if (s) then
				t[s] = {}
				section = s -- current [TITLE] edited
			end

			-- Match content ( x = y ;)
			local key, value = string.match(line, "(.+)%s=%s(.+);")

			if (key and value) then
				-- Trim string
				value = string.gsub(value, "^%s*", ""):gsub("%s*$", ""):lower()

				-- If that is a number, don't do anything more with it
				if (tonumber(value)) then
					value = tonumber(value)
				else
					if (value == "true") then
						value = true
					elseif (value == "false")then
						value = false
					elseif string.find(value, ",") then
						value = String.splitString(value, ",")

						-- Trim string
						for i = 1, #value do
							value[i] = string.gsub(value[i], "^%s*", ""):gsub("%s*$", "")
						end
					end
				end

				 -- example: t["Backpacks"]["GoldBackpack"] = backpack
				t[section][key] = value
			end
		end
	end

	file:close()

	for k, v in pairs(t) do
		CONFIG[k] = v
	end
end

-- Splits the config table
function Ini.parseConfig(sectionName, arg)
	local section = CONFIG[sectionName]
	local t = {}

	-- Section isn't found in the table
	if (not section) then
		return
	end

	for key, value in pairs(section) do
		-- Look for "Name" then grab the word behind it
		local start, stop = string.find(key, "Name")

		if (start) then
			local name = string.sub(key, 1, start - 1) -- grab the word behind it that keeps repeating
			local id = type(value) == "string" and Item.getItemID(value) or tonumber(value)
			
			-- Parse arguments to the table
			for i = 1, #arg do
				local extraValue = section[name.. arg[i]]
				t[string.lower(arg[i])] = extraValue
			end

			-- Set must-have values
			t["name"] = value
			t["id"] = id
			t["group"] = sectionName

			SUPPLIES[id] = t
		end

		t = {}
	end
end

-- Saves an .ini file
function Ini.saveFile(fileName, text)
	if (Ini.isFileExisting(fileName)) then
		local file = io.open("../Configs/" ..fileName.. ".ini", "w+")

		file:write(text)
		file:flush()
		file:close()
		return false
	end

	return true
end

--		8 8888888888 `8.`888b           ,8' 8 8888888888   b.             8 8888888 8888888888 d888888o.   
--		8 8888        `8.`888b         ,8'  8 8888         888o.          8       8 8888     .`8888:' `88. 
--		8 8888         `8.`888b       ,8'   8 8888         Y88888o.       8       8 8888     8.`8888.   Y8 
--		8 8888          `8.`888b     ,8'    8 8888         .`Y888888o.    8       8 8888     `8.`8888.     
--		8 888888888888   `8.`888b   ,8'     8 888888888888 8o. `Y888888o. 8       8 8888      `8.`8888.    
--		8 8888            `8.`888b ,8'      8 8888         8`Y8o. `Y88888o8       8 8888       `8.`8888.   
--		8 8888             `8.`888b8'       8 8888         8   `Y8o. `Y8888       8 8888        `8.`8888.  
--		8 8888              `8.`888'        8 8888         8      `Y8o. `Y8       8 8888    8b   `8.`8888. 
--		8 8888               `8.`8'         8 8888         8         `Y8o.`       8 8888    `8b.  ;8.`8888 
--		8 888888888888        `8.`          8 888888888888 8            `Yo       8 8888     `Y8888P ,88P' 

function onTick()
	Callback.checkCallbacks()
	Event.handleEvents()

	-- Handle HUD loot update
	if (CONFIG["Hud"] and CONFIG["Hud"]["EnableHud"]) then
		if (Item.isCorpse(Cont.getLast())) then
			HUD["TrackLoot"] = 5
		end
	end

	-- Handle waiting for monsters
	if (CONFIG["General"] and CONFIG["General"]["WaitForInvisible"] and SCRIPT_DATA["IsHunting"]) then
		if (Creatures.targetID() > 0) then
			Player.delayWalker(1000)
		end
	end

	-- Handle receiving messages for IPC
	if (CONFIG["Teamhunt"]) then
		Ipc.receiveMessages(SCRIPT_DATA["Subscriber"])

		if (SCRIPT_DATA["IpcReady"]) then
			local profit = HUD["LootHUD"]["Loot"] - HUD["LootHUD"]["Items"]["Loot"][3043].count
			local waste = HUD["LootHUD"]["Waste"] - HUD["LootHUD"]["Items"]["Waste"][3043].count
			IpcPublisher.publishMessage(SCRIPT_DATA["Publisher"], SCRIPT_DATA["Topic"], "hud|" ..tostring(profit).. "|" ..tostring(waste))
		end
	end		
end

function onGenericMessage(message)
	local balance = string.match(message, "Your account balance is now (%d+) gold.")

	if (balance) then
		SCRIPT_DATA["Balance"] = balance
	end
end

function onNpcMessage(name, message)
	-- Says trade if message was found ( Carlin magic shop )
	if (string.find(string.lower(message), "intelligent people")) then
		Player.say({"trade"}, function() end)
	end
end

function onErrorMessage(message)
	-- Handles invisible monsters
	if (CONFIG["General"] and CONFIG["General"]["WaitForInvisible"] and message == "Target lost." and SCRIPT_DATA["IsHunting"]) then
		local currentCreatures = #Creatures.getSpectators(false)
		local time = os.time()

		local function waitForInvisible()
			Player.delayWalker(2000)

			Callback.setTimeout(function()
				if (currentCreatures >= #Creatures.getSpectators(false) + 1 or os.difftime(os.time(), time) > 5 or Creatures.targetID() > 0) then
					Player.delayWalker(0)
					return
				end

				Player.delayWalker(2000)
				waitForInvisible()
			end, Delay.pingDelay(500))
		end

		waitForInvisible()
	end
end

function onLootMessage(message)
	-- Handles mana restoring
	if (CONFIG["General"] and CONFIG["General"]["RestoreMana"] and CONFIG["General"]["RestoreMana"] > 0 and SCRIPT_DATA["IsHunting"]) then
		Player.restoreMana(CONFIG["Potions"]["ManaName"], CONFIG["General"]["RestoreMana"], function()
			
		end)
	end
end

function onNewContainer(index, name, id)
	Callback.checkConditions(EVENT_CONTAINER, index, name, id)

	if (CONFIG["Hud"] and CONFIG["Hud"]["EnableHud"]) then
		if (Item.isCorpse(index)) then
			HUD["trackLoot"] = 5
		end
	end
end

--		8 8888888888 `8.`888b           ,8' 8 8888888888   b.             8 8888888 8888888888 d888888o.   
--		8 8888        `8.`888b         ,8'  8 8888         888o.          8       8 8888     .`8888:' `88. 
--		8 8888         `8.`888b       ,8'   8 8888         Y88888o.       8       8 8888     8.`8888.   Y8 
--		8 8888          `8.`888b     ,8'    8 8888         .`Y888888o.    8       8 8888     `8.`8888.     
--		8 888888888888   `8.`888b   ,8'     8 888888888888 8o. `Y888888o. 8       8 8888      `8.`8888.    
--		8 8888            `8.`888b ,8'      8 8888         8`Y8o. `Y88888o8       8 8888       `8.`8888.   
--		8 8888             `8.`888b8'       8 8888         8   `Y8o. `Y8888       8 8888        `8.`8888.  
--		8 8888              `8.`888'        8 8888         8      `Y8o. `Y8       8 8888    8b   `8.`8888. 
--		8 8888               `8.`8'         8 8888         8         `Y8o.`       8 8888    `8b.  ;8.`8888 
--		8 888888888888        `8.`          8 888888888888 8            `Yo       8 8888     `Y8888P ,88P' 

Event.createEvent("SupplyChecker", function()
	-- Make sure we didn't just reconnect
	if (Cont.isOpen(0)) then
		-- Check if we're missing supplies, we were forced to refill or server-save is coming
		if (not Hunt.checkAll(false, false)) then
			-- If we're place-luring, wait for us to finish if needed
			if (CONFIG["PlaceLurer"] and CONFIG["PlaceLurer"]["PlaceLureActive"] and CONFIG["General"] and not CONFIG["General"]["IgnoreMonsters"]) then
				if (Creatures.targetID() > 0) then
					if (not SCRIPT_DATA["IsReadyLeave"]) then
						Channel.log("Proceeding to leave once the monster is dead")
					end

					SCRIPT_DATA["IsReadyLeave"] = true
					return
				end
			end

			-- Insert a label between hunt|check and hunt|leave, make sure we succeded
			Rewriting.insertClosestWaypoint("hunt|check", "hunt|leave", "leave", function(success)
				if (not success) then Channel.warn("Failed to find an exit! Retrying! Please pass me the coordinates: " ..Player.pos().x.. ", " ..Player.pos().y.. ", " ..Player.pos().z.. " and the script name through a private message on forum!") return end

				-- Print a message
				Hunt.checkAll(false, true)

				-- Set correct values
				SCRIPT_DATA["IsHunting"] = false
				SCRIPT_DATA["IsLeaving"] = true
				SCRIPT_DATA["IsReadyLeave"] = false

				-- Update HUD
				HUD["LeaveTime"] =  os.time() - HUD["LastLeaveTime"]

				-- Stop most of the events, so they don't cause incompatibility
				Event.stopEvent("AntiLure")
				Event.stopEvent("PlaceLure")
				Event.stopEvent("SupplyChecker")

				-- Set most of their values to false
				SCRIPT_DATA["IsAntiLuring"] = false
				SCRIPT_DATA["IsPlaceLuring"] = false
				SCRIPT_DATA["IsKillingEvent"] = false

				-- Set our targeting style
				if (CONFIG["General"] and CONFIG["General"]["IgnoreMonsters"]) then
					Event.stopEvent("Lurer")

					Player.targetingIgnoring(true)
					Player.looter(false)
				else
					Player.normalTargeting()
				end
			end)
		end
	end
end, Delay.pingDelay(3000), false)

Event.createEvent("Lurer", function()
	local dir = Player.lookDirection()
	
	-- Killing monsters ( lured enough )
	if (SCRIPT_DATA["IsKillingEvent"]) then
		Event.stopEvent("Lurer")			-- Stop lurer
		Player.normalTargeting()			-- Set normal targeting

		local time = os.time()

		LURER.BLACKLIST = {}				-- Clear blacklist

		-- Keep checking if all of the monsters were killed
		local function checkMonsters()
			Callback.setTimeout(function()
				local creaturesAll = Creatures.findCreatures(CONFIG["Lurer"]["LureMonsters"], true)

				-- 10 seconds passed, we didn't want to freeze the client earlier
				if (os.difftime(os.time(), time) > 10) then
					for i = 1, #creaturesAll do
						-- Make sure the creature is on screen, so we don't check if we can reach it pointlessly
						if (Creatures.isOnScreen(creaturesAll[i])) then
							-- Check if the creature is reachable
							if (not Map.isTileReachable(Player.pos(), Creatures.position(creaturesAll[i]), {}, {Player.pos()})) then
								-- Add to Blacklist
								if (not LURER.BLACKLIST[Creatures.ID(creaturesAll[i])]) then
									LURER.BLACKLIST[Creatures.ID(creaturesAll[i])] = 1
								-- Add 1 to Blacklist
								else
									LURER.BLACKLIST[Creatures.ID(creaturesAll[i])] = LURER.BLACKLIST[Creatures.ID(creaturesAll[i])] + 1
								end
							end
						end
					end
				end

				-- No more creatures or 45 seconds passed
				if (#creaturesAll == 0 or os.difftime(os.time(), time) > 45) then
					local resume = not SCRIPT_DATA["IsLeaving"] or CONFIG["General"] and not CONFIG["General"]["IgnoreMonsters"] and SCRIPT_DATA["IsLeaving"]

					SCRIPT_DATA["IsKillingEvent"] = false
					Player.lureTargeting(CONFIG["Lurer"]["LureKill"])

					-- Resume if not leaving or leaving and not ignoring monsters
					if (resume) then
						Event.startEvent("Lurer")
					end
				else
					checkMonsters()
				end
			end, Delay.pingDelay(3000))
		end

		checkMonsters()

	-- Luring monsters
	else
		-- Get creatures behind, creatures on screen, preferred distance to keep ( saving memory )
		local creatures, creaturesAll, distance = Creatures.findInOppositeDirection(CONFIG["Lurer"]["LureMonsters"], dir, true)

		-- Not enough monsters found, set targeting
		if (#creatures < CONFIG["Lurer"]["LureFrom"] and not SCRIPT_DATA["IsKillingEvent"]) then
			-- Enable targeting if-stuck, so we don't die
			if (getWalkerStuck()) then
				Player.normalTargeting()
			-- Keep luring settings
			else
				Player.lureTargeting(CONFIG["Lurer"]["LureKill"])
			end

		-- More than enough monsters found, start killing
		elseif (#creaturesAll >= CONFIG["Lurer"]["LureTo"]) then
			Player.normalTargeting()
			SCRIPT_DATA["IsKillingEvent"] = true

		-- Not enough and not too much, wait for monsters
		elseif (#creatures >= CONFIG["Lurer"]["LureFrom"] and #creatures < CONFIG["Lurer"]["LureTo"] and not SCRIPT_DATA["IsKillingEvent"]) then
			-- Stuck, set normal targeting and return
			if (getWalkerStuck()) then
				Player.normalTargeting()
				return
			end

			Player.lureTargeting(CONFIG["Lurer"]["LureKill"])

			local distances = Creatures.sortByDistance(creatures)

			-- Every creature died/went invisible while luring
			if (not distances[1]) then
				return
			end

			-- Could be a special distance to keep from a certain creature
			distance = LURER.WHITELIST[Creatures.name(distances[1].creature)] or distance

			-- Remove whitelist monsters from table
			local function removeMonsters(t)
				for k, v in pairs(LURER.WHITELIST) do
					for i = 1, #t do
						local name = Creatures.name(t[i])

						if (string.lower(name) == string.lower(k)) then
							table.remove(t, i)
							break
						end
					end
				end
			end

			-- Check what should be the minimum range for monster to be when luring
			local function checkDistance(close)
				if (close) then
					if (CONFIG["Lurer"]["LureClose"]) then
						local monstersAround = Creatures.findCreaturesAround(CONFIG["Lurer"]["LureMonsters"], true, 2)
						local creatures, creaturesAll, _distance = Creatures.findInOppositeDirection(CONFIG["Lurer"]["LureMonsters"], dir, true)

						removeMonsters(monstersAround)
						removeMonsters(creatures)

						if (#monstersAround < CONFIG["Lurer"]["LureClose"] and #Map.getWalkableTiles(Player.pos(), 1, true) >= 3) then
							if (#creatures >= CONFIG["Lurer"]["LureClose"] or #creatures < CONFIG["Lurer"]["LureClose"] and #monstersAround < #creatures) then
								return true
							end
						end

						return false
					end
				else
					if (LURER.WHITELIST[Creatures.name(distances[1].creature)]) then
						return distances[1].dist > distance
					else
						return distances[1].dist >= 2
					end
				end
			end

			-- Monster distance is bigger than it should be
			if (checkDistance() or checkDistance(true)) then
				if (distances[1].dist > distance or checkDistance(true)) then
					local resume = not SCRIPT_DATA["IsLeaving"] or CONFIG["General"] and not CONFIG["General"]["IgnoreMonsters"] and SCRIPT_DATA["IsLeaving"]

					local time = os.time()

					local sPos = Creatures.position(distances[1].creature)	-- Set the starting position of creature to check with blacklist
					local sID = Creatures.ID(distances[1].creature)			-- Creature ID
					local sDist = distances[1].dist							-- Starting distance
					local sTime = 1.3										-- Start time, +1.3

					local function waitForMonsters()
						Event.stopEvent("Lurer")
						Player.delayWalker(5000)

						local creatures, creaturesAll, _distance = Creatures.findInOppositeDirection(CONFIG["Lurer"]["LureMonsters"], dir, true)

						distances = Creatures.sortByDistance(creatures)

						-- Every creature died/went invisible while luring
						if (not distances[1]) then
							if (not SCRIPT_DATA["IsKillingEvent"] and resume) then
								Event.startEvent("Lurer")
							end

							Player.delayWalker(0)
							return
						end

						-- Check distance
						if (os.difftime(os.time(), time) < 4 and not SCRIPT_DATA["IsKillingEvent"] and distances[1].dist > distance or os.difftime(os.time(), time) < 4 and not SCRIPT_DATA["IsKillingEvent"] and checkDistance(true)) then
							local cPos = Creatures.position(distances[1].creature)
							local cID = Creatures.ID(distances[1].creature)

							-- Creature unreachable, instant blacklist
							if (not Map.isTileReachable(Player.pos(), cPos, {}, {Player.pos()})) then
								LURER.BLACKLIST[cID] = 3

								sPos = cPos						-- new pos
								sID = cID						-- new id
								sDist = distances[1].dist		-- new dist
								sTime = sTime + 1.3

							-- 1.3s + sTime passed
							elseif (os.difftime(os.time(), time) > sTime) then
								-- Make sure the ID matches the first creature found
								if (cID == sID) then
									-- Distance increased or didn't change position
									if (sDist >= distances[1].dist or sPos.x == cPos.x and sPos.y == cPos.y) then
										LURER.BLACKLIST[cID] = 3
									end
								else
									sPos = cPos					-- new pos
									sID = cID					-- new id
									sDist = distances[1].dist	-- new dist
									sTime = sTime + 1.3
								end
							end

							-- Continue looping
							Callback.setTimeout(function()
								if (not SCRIPT_DATA["IsKillingEvent"]) then
									waitForMonsters()
								end
							end, Delay.pingDelay(400))
						else
							local cID = Creatures.ID(distances[1].creature)

							-- Add to blacklist if 4 seconds passed
							if (os.difftime(os.time(), time) > 4) then
								if (not LURER.BLACKLIST[cID]) then
									LURER.BLACKLIST[cID] = 1
								else
									LURER.BLACKLIST[cID] = LURER.BLACKLIST[cID] + 1
								end
							end

							-- Resume if not leaving or leaving and not ignoring monsters
							if (not SCRIPT_DATA["IsKillingEvent"] and resume) then
								Event.startEvent("Lurer")
							end

							Player.delayWalker(0)
							return
						end
					end

					waitForMonsters()
				else
					Event.stopEvent("Lurer")
					Player.delayWalker(5000)

					Callback.setTimeout(function()
						local resume = not SCRIPT_DATA["IsLeaving"] or CONFIG["General"] and not CONFIG["General"]["IgnoreMonsters"] and SCRIPT_DATA["IsLeaving"]

						if (not SCRIPT_DATA["IsKillingEvent"] and resume) then
							Event.startEvent("Lurer")
						end

						Player.delayWalker(0)
						return
					end, Delay.pingDelay(200))
				end
			end
		end
	end
end, Delay.pingDelay(300), false)

Event.createEvent("AntiLure", function()
	-- Already anti-luring
	if (SCRIPT_DATA["IsAntiLuring"]) then
		return
	end

	local creatures = Creatures.findCreatures(CONFIG["AntiLure"]["AntiLureMonsters"], false)

	-- More than enough monsters
	if (#creatures >= CONFIG["AntiLure"]["AntiLureFrom"]) then
		Channel.warn("Too many monsters ( Found: " ..tostring(#creatures).. " ) ! Anti Lure triggered")
		alert()

		Rewriting.insertClosestWaypoint("special|antilure|start", "special|antilure|stop", "antilure")
		
		Player.targetingIgnoring(true)
		SCRIPT_DATA["IsAntiLuring"] = true
	end
end, Delay.pingDelay(1000), false)

Event.createEvent("PlaceLure", function()
	-- Already luring to a place or anti-luring
	if (SCRIPT_DATA["IsPlaceLuring"] or SCRIPT_DATA["IsAntiLuring"]) then
		return
	end

	local creatures = Creatures.findCreatures(CONFIG["PlaceLurer"]["PlaceLureMonsters"], false)

	-- More than enough monsters
	if (#creatures >= CONFIG["PlaceLurer"]["PlaceLureFrom"]) then
		-- Check that this is the monster we need ( and we're targeting too )
		if (type(CONFIG["PlaceLurer"]["PlaceLureMonsters"]) == "table" and Table.contains(CONFIG["PlaceLurer"]["PlaceLureMonsters"], string.lower(Creatures.name(Creatures.targetID()))) or type(CONFIG["PlaceLurer"]["PlaceLureMonsters"]) == "string" and CONFIG["PlaceLurer"]["PlaceLureMonsters"] == string.lower(Creatures.name(Creatures.targetID()))) then
			Rewriting.insertClosestWaypoint("special|placelure|start", "special|placelure|stop", "placelure")
			
			Player.targetingLuring(true)
			SCRIPT_DATA["IsPlaceLuring"] = true
		end
	end
end, Delay.pingDelay(500), false)

Event.createEvent("RingEquipper", function()
	local cont = BACKPACKS["RingBackpack"].index or BACKPACKS["SuppliesBackpack"].index or BACKPACKS["MainBackpack"].index
	
	for suppID, supply in pairs(SUPPLIES) do
		if (supply.group == "Ring") then
			local creatures = Creatures.findCreatures(supply.creatures, false)

			-- More creatures than intended or our HP is low
			if (#creatures >= supply.creature or Player.percentHp() <= supply.health) then
				Item.equip(supply.id, "ring", 1)
				return
			end

			-- Dequip, we don't need to use it for now
			Item.dequip("ring", cont)
		end
	end
end, Delay.pingDelay(500), false)

Event.createEvent("AmuletEquipper", function()
	local cont = BACKPACKS["AmuletBackpack"].index or BACKPACKS["SuppliesBackpack"].index or BACKPACKS["MainBackpack"].index
	
	for suppID, supply in pairs(SUPPLIES) do
		if (supply.group == "Amulet") then
			local creatures = Creatures.findCreatures(supply.creatures, false)

			-- More creatures than intended or our HP is low
			if (#creatures >= supply.creature or Player.percentHp() <= supply.health) then
				-- If we had an amulet equipped, dequip it first
				if (SCRIPT_DATA["DefaultAmulet"] > 0 and Item.eqData("amulet").id == SCRIPT_DATA["DefaultAmulet"] and Item.eqData("amulet").id ~= supply.id) then
					Item.dequip("amulet", cont)
					return
				end

				-- Equip desired amulet
				Item.equip(supply.id, "amulet", 1)
				return
			end

			-- Equip/dequip old amulet
			if (SCRIPT_DATA["DefaultAmulet"] > 0 and Item.eqData("amulet").id == 0 and SCRIPT_DATA["DefaultAmulet"] ~= supply.id) then
				Item.equip(SCRIPT_DATA["DefaultAmulet"], "amulet", 1)
			elseif (Item.eqData("amulet").id ~= SCRIPT_DATA["DefaultAmulet"]) then
				Item.dequip("amulet", cont)
			end
		end
	end
end, Delay.pingDelay(500), false)

Event.createEvent("GoldChanger", function()
	-- HUD is tracking loot, disable changing gold for now
	if (HUD["TrackLoot"] > 0) then
		return
	end

	local mainBp = BACKPACKS["MainBackpack"].index
	local goldBp = BACKPACKS["GoldBackpack"].index or BACKPACKS["LootBackpack"].index
	local backpacks = {}

	table.insert(backpacks, mainBp)
	table.insert(backpacks, goldBp)

	-- Check main and gold backpack for gold to change
	for i = 1, #backpacks do
		for spot = 0, Cont.itemCount(backpacks[i]) - 1 do
			local data = Cont.getItemDataFromSpot(backpacks[i], spot)

			if (Item.isGold(data.id) and data.id ~= 3043 and data.count >= 100) then
				Cont.useItemFromContainer(backpacks[i], spot, false, false)
				break
			end
		end
	end
end, Delay.pingDelay(500), false)

Event.createEvent("HUD", function()
	local newAmount = Hud.countItems()
	local length = 0
	local diff = {["Loot"] = {}, ["Waste"] = {}}		

	-- Make sure there's any loot to check
	if (Table.countLength(HUD["Loot2"], 1) > 0) then
		-- Items went down to 0
		for id, count in pairs(HUD["Loot2"]) do
			if (not newAmount[id]) then
				newAmount[id] = 0
			end
		end

		-- Update main loot table with differences
		for id, count in pairs(newAmount) do
			if (not HUD["Loot2"][id]) then
				HUD["Loot2"][id] = 0
			end

			local difference = count - HUD["Loot2"][id]

			-- Profit
			if (difference > 0 and HUD["TrackLoot"] > 0 and not Item.isContainer(id)) then
				diff["Loot"][id] = difference
			-- Waste
			elseif (difference < 0 and not SCRIPT_DATA["IsDepositing"] and not HUD["LootWasteBlacklist"][tostring(id)] and not Item.isContainer(id)) then
				diff["Waste"][id] = difference
				length = length + 1
			end
		end

		-- Update profit part of HUD
		for id, difference in pairs(diff["Loot"]) do
			HUD["LootHUD"]["Loot"] = HUD["LootHUD"]["Loot"] + difference * Item.getValue(id)
			Hud.addItem("Loot", id, difference)
		end

		-- Update waste part of HUD
		if (length <= 3) then
			for id, difference in pairs(diff["Waste"]) do
				if (difference >= -10) then
					HUD["LootHUD"]["Waste"] = HUD["LootHUD"]["Waste"] + math.abs(difference) * Item.getCost(id)
					Hud.addItem("Waste", id, math.abs(difference))
				end
			end
		end
	end

	HUD["TrackLoot"] = HUD["TrackLoot"] - 1
	HUD["Loot2"] = newAmount

	Hud.updateHUD()

	if (Hud.checkChanges()) then
		Hud.saveValues()
		Hud.redrawHUD()
	end

	Hud.checkSize()
end, Delay.pingDelay(1000), false)

Event.createEvent("BpReset", function()
	-- Main backpack isn't open, we just reconnected
	if (not Cont.isOpen(0)) then

		-- Stop most of the events
		Event.stopEvent("HUD")
		Event.stopEvent("BpReset")
		Event.stopEvent("SupplyChecker")

		-- Stop walker/targeting/looter
		Player.walker(false)
		Player.targeting(false)
		Player.looter(false)

		-- Reset backpacks
		Backpacks.resetBackpacks(true, function()
			-- Make sure the backpacks match the looter
			Rewriting.looter()

			if (CONFIG["Hud"] and CONFIG["Hud"]["EnableHud"]) then Event.startEvent("HUD") end

			Event.startEvent("BpReset")

			if (SCRIPT_DATA["IsHunting"]) then
				Event.startEvent("SupplyChecker")
			end

			Player.walker(true)
			Player.targeting(true)
			Player.looter(true)
		end)
	end
end, Delay.pingDelay(1000), false)

Event.createEvent("Haster", function()
	-- Knight/Paladin, cast 'utani hur'
	if (SCRIPT_DATA["Vocation"] == "knight" or SCRIPT_DATA["Vocation"] == "paladin") then
		local spell = "utani hur"

		if (Player.spellCooldown(spell) == 0 and not getSelfFlag("hasted") and Player.mp(false) >= 60) then
			selfSay(spell)
		end
	-- Sorcerer/Druid, cast 'utani gran hur'
	else
		local spell = "utani gran hur"

		if (Player.spellCooldown(spell) == 0 and not getSelfFlag("hasted") and Player.mp(false) >= 100) then
			selfSay(spell)
		end
	end
end, Delay.pingDelay(3000), false)

Event.createEvent("Skinning", function()
	local c = BACKPACKS["MainBackpack"].index

	for spot = 0, Cont.itemCount(c) - 1 do
		local item = Cont.getItemDataFromSpot(c, spot).id

		-- Look for the item in the list
		if (Table.contains(SKINNING, item)) then
			local dCont = BACKPACKS["LootBackpack"].index or BACKPACKS["StackBackpack"].index or BACKPACKS["NonStackBackpack"].index or nil

			if (not dCont) then
				Event.stopEvent("Skinning")
				return
			end

			Cont.moveItemToContainer(c, dCont, spot, Cont.itemCapacity(dCont) - 1, -1)
			break
		end
	end
end, Delay.pingDelay(5000), false)

Event.createEvent("Screenshooter", function()
	if (Player.level() > SCRIPT_DATA["Level"]) then
		screenshot(SCRIPT_DATA["Name"].. "_name_" ..Player.name().. "_level_" ..Player.level().. "_date_" ..os.date("%d.%m.%Y").. "_time_" ..os.date("%H.%M"))
		SCRIPT_DATA["Level"] = Player.level()
	end
end, Delay.pingDelay(1000), false)

Event.createEvent("Sio", function()
	for n, c in Creatures.iPlayers() do
		if (string.lower(n) == string.lower(SCRIPT_DATA["PartnerName"])) then
			if (getCreatureHealthPercent(c._listindex) <= CONFIG["Teamhunt"]["SioPercent"]) then
				if (Player.spellCooldown("exura sio") == 0) then
					selfSay('exura sio "' ..n)
				end

				break
			end
		end
	end
end, Delay.pingDelay(200), false)

Event.createEvent("Wildgrowth", function()
	for i = 1, #SCRIPT_DATA["Wildgrowth"] do
		Player.delayWalker(1000)

		local bList = {}
		local monsters = Creatures.findAllCreatures(false)

		-- Check if monsters are standing on tiles for wildgrowth
		for j = 1, #monsters do
			if (Creatures.distFromSelf(monsters[j]) == 1) then
				local pos = Creatures.position(monsters[j])

				if (pos.x == SCRIPT_DATA["Wildgrowth"][i].x and pos.y == SCRIPT_DATA["Wildgrowth"][i].y) then
					table.insert(bList, i)
					break
				end
			end
		end

		-- Check if we should use a wildgrowth
		if (not Table.contains(bList, i) and Map.isTileWalkable(SCRIPT_DATA["Wildgrowth"][i].x, SCRIPT_DATA["Wildgrowth"][i].y, Player.pos().z) and Map.getTileID(SCRIPT_DATA["Wildgrowth"][i].x, SCRIPT_DATA["Wildgrowth"][i].y, Player.pos().z).id ~= 2130 and Player.spellCooldown("utani hur") == 0) then
			Map.useWithGround(3156, SCRIPT_DATA["Wildgrowth"][i].x, SCRIPT_DATA["Wildgrowth"][i].y, Player.pos().z)
			break
		end
	end
end, Delay.pingDelay(200), false)

Event.createEvent("Bombrune", function()
	local playerPos = Player.pos()
	
	if (not SCRIPT_DATA["IsIgnoring"]) then
		Player.delayWalker(1000)
	end

	if (SCRIPT_DATA["UseBomb"]) then
		local bomb = CONFIG["Runes"]["BombName"] or CONFIG["Withdraw"]["BombName"]
		if (not bomb) then return end

		-- Check if there is a bomb on every possible position around
		for _x = -1, 1 do
			for _y = -1, 1 do
				local tile = Map.getTileID(playerPos.x + _x, playerPos.y + _y, playerPos.z).id

				if (not Table.contains({2118, 2119, 2121, 2122, 2131, 2132, 2134, 2135}, tile) and Map.isTileWalkable(playerPos.x + _x, playerPos.y + _y, playerPos.z)) then
					break
				end

				if (_x == 1 and _y == 1) then
					SCRIPT_DATA["UseBomb"] = false
				end
			end
		end

		-- Use bomb
		if (Player.spellCooldown("utani hur") == 0 and SCRIPT_DATA["UseBomb"]) then
			Map.useWithGround(Item.getItemID(bomb), playerPos.x, playerPos.y, playerPos.z)
			return
		end
	end

	if (not SCRIPT_DATA["IsIgnoring"]) then
		-- Dodge the monster if there is any
		local monsters = Creatures.findAllCreatures(false)
		local dodge = {}

		for i = 1, #monsters do
			if (Creatures.distFromSelf(monsters[i]) == 1) then
				local monsterPos = Creatures.position(monsters[i])

				local dirs = {
					["north"] = 0,
					["east"] = 1,
					["south"] = 2,
					["west"] = 3,
					["southwest"] = 4,
					["southeast"] = 5,
					["northwest"] = 6,
					["northeast"] = 7
				}

				for _x = -1, 1 do
					for _y = -1, 1 do
						local pos = {x = playerPos.x + _x, y = playerPos.y + _y}
						local diff = math.abs(monsterPos.x - pos.x) + math.abs(monsterPos.y - pos.y)

						if (Map.isTileWalkable(pos.x, pos.y, playerPos.z)) then
							-- Diagonal
							if (diff == 3) then
								table.insert(dodge, dirs[Map.getDirectionTo(playerPos, pos)])
							-- Straight
							elseif (playerPos.x == pos.x or playerPos.y == pos.y) then
								-- Make sure the tile isn't adjacent
								if (math.abs(monsterPos.x - pos.x) == 2 or math.abs(monsterPos.y - pos.y) == 2) then
									table.insert(dodge, dirs[Map.getDirectionTo(playerPos, pos)])
								end
							end
						end
					end
				end

				break
			end
		end

		-- Make a dodge
		if (#dodge > 0) then
			table.sort(dodge, function(a, b) return a < b end)

			local dirs = {
				[0] = "north",
				[1] = "east",
				[2] = "south",
				[3] = "west",
				[4] = "southwest",
				[5] = "southeast",
				[6] = "northwest",
				[7] = "northeast"
			}

			local dest = Map.getDirection(dirs[dodge[1]])

			Event.stopEvent("Bombrune")

			-- Walk to a destination, wait 200ms and walk back to center of the bomb
			Player.walkTo(dest.x, dest.y, dest.z, function()
				Callback.setTimeout(function()
					Player.walkTo(playerPos.x, playerPos.y, playerPos.z, function() if (not SCRIPT_DATA["IsIgnoring"]) then Event.startEvent("Bombrune") end end, 5)
				end, Delay.pingDelay(200))
			end, 5)
		end
	end
end, Delay.pingDelay(200), false)

Event.createEvent("Magicshield", function()
	if (not getSelfFlag("mshielded")) then
		if (Player.spellCooldown("utamo vita") == 0) then
			selfSay("utamo vita")
		end
	end
end, Delay.pingDelay(200), false)

Event.createEvent("Safering", function()
	local monstersAround = Creatures.findAllCreatures(false, 1)

	if (#monstersAround >= 1 and not getSelfFlag("mshielded")) then
		Item.equip(3051, "ring", 1)
	elseif (Item.eqData("ring").id == 3088 and #monstersAround == 0) then
		local cont = BACKPACKS["RingBackpack"].index or BACKPACKS["SuppliesBackpack"].index or BACKPACKS["MainBackpack"].index

		Item.dequip("ring", cont)
	end
end, Delay.pingDelay(200), false)

--		    ,o888888o.    8 8888        8          .8.          b.             8 b.             8 8 8888888888   8 8888         
--		   8888     `88.  8 8888        8         .888.         888o.          8 888o.          8 8 8888         8 8888         
--		,8 8888       `8. 8 8888        8        :88888.        Y88888o.       8 Y88888o.       8 8 8888         8 8888         
--		88 8888           8 8888        8       . `88888.       .`Y888888o.    8 .`Y888888o.    8 8 8888         8 8888         
--		88 8888           8 8888        8      .8. `88888.      8o. `Y888888o. 8 8o. `Y888888o. 8 8 888888888888 8 8888         
--		88 8888           8 8888        8     .8`8. `88888.     8`Y8o. `Y88888o8 8`Y8o. `Y88888o8 8 8888         8 8888         
--		88 8888           8 8888888888888    .8' `8. `88888.    8   `Y8o. `Y8888 8   `Y8o. `Y8888 8 8888         8 8888         
--		`8 8888       .8' 8 8888        8   .8'   `8. `88888.   8      `Y8o. `Y8 8      `Y8o. `Y8 8 8888         8 8888         
--		   8888     ,88'  8 8888        8  .888888888. `88888.  8         `Y8o.` 8         `Y8o.` 8 8888         8 8888         
--		    `8888888P'    8 8888        8 .8'       `8. `88888. 8            `Yo 8            `Yo 8 888888888888 8 888888888888 

function Channel.log(message)
	luaSendChannelMessage(SCRIPT_DATA["Channel"], CHANNEL_YELLOW, ":", message)
end

function Channel.inform(message)
	luaSendChannelMessage(SCRIPT_DATA["Channel"], CHANNEL_ORANGE, ":", message)
end

function Channel.warn(message)
	luaSendChannelMessage(SCRIPT_DATA["Channel"], CHANNEL_RED, ":", message)
end

function error(message)
	if (type(message) == "string") then
		luaSendChannelMessage(SCRIPT_DATA["Channel"], CHANNEL_RED, ":", "ERROR: " ..message)
		alert()
		Player.walker(false)

		Channel.warn(message)
		assert(false, message)
	else
		return false
	end
end

function Channel.wait(message, callback)
	Channel.log(message)

	Callback.setCondition(EVENT_CHANNEL, nil, function(response)
		callback(response)
	end)
end

function Channel.channelCreate()
	SCRIPT_DATA["Channel"] = luaOpenCustomChannel("Script Channel")

	Channel.inform("Thanks for using my script, " ..getUserName())
	Channel.inform("Type /help for every available command")
	Channel.inform("Selling loot is disabled by default. If the script supports it and you want to change it, please type \"/loot\"")
	Channel.inform("Hasting to and from spawn is disabled by default. Please type \"/haste\" if you want to change it")
	if (isRealTibia() == 0) then Channel.warn("OT detected, please type \"/ot\" if you are not on an OTS") end

	onChannelSpeak(SCRIPT_DATA["Channel"], "/help")
end

function onChannelSpeak(channel, message)
	luaSendChannelMessage(SCRIPT_DATA["Channel"], CHANNEL_YELLOW, Player.name(), message)
	local msg = string.sub(message, 1, 1)

	if (msg == "/") then
		local params = String.splitString(string.sub(message, 2), " ")
		local command = params and params[1]

		if (command == "help") then
			Channel.inform([[Available commands:
        /help = Show every available command.
        /config = Edit config via text editor.
        /hudconfig = Edit HUD's config via text editor.
        /hudcolors = Show every available color for the HUD.
        /ot = Enable OT mode, different NPC follower and a Gold Changer.
        /loot = Enable loot selling after every hunt if possible.
        /haste = Enable hasting to and from spawn.
        /leave = Force bot to leave.]])
		elseif (command == "config") then
			showConfigEditor(Ini.getFileName())
		elseif (command == "hudconfig") then
			local fileName = "JontorHUD"

			showConfigEditor(fileName)
		elseif (command == "hudcolors") then
			Channel.inform("List of available colors for HUD:")

			Channel.inform("White")
			Channel.inform("Gray")
			Channel.inform("Black")

			for k, v in pairs(COLORS) do
				if (not string.match(k, "Dark") and not string.match(k, "Light")) then
					if (not string.match("White Gray Black Random", k)) then
						Channel.inform(k.. ", Light" ..k.. ", Dark" ..k)
					end
				end
			end

			Channel.inform("Random")
		elseif (command == "leave") then
			SCRIPT_DATA["ForceRefill"] = true
			Channel.inform("Bot will leave as fast as it is possible")
		elseif (command == "ot") then
			SCRIPT_DATA["Ot"] = not SCRIPT_DATA["Ot"]

			if (SCRIPT_DATA["Ot"]) then
				Event.startEvent("GoldChanger")
				Channel.inform("OT mode enabled")
			else
				Event.stopEvent("GoldChanger")
				Channel.inform("OT mode disabled")
			end
		elseif (command == "loot") then
			SCRIPT_DATA["SellLoot"] = not SCRIPT_DATA["SellLoot"]

			if (SCRIPT_DATA["SellLoot"]) then
				Channel.inform("Selling loot enabled")
			else
				Channel.inform("Selling loot disabled")
			end
		elseif (command == "haste") then
			SCRIPT_DATA["HasteSpawn"] = not SCRIPT_DATA["HasteSpawn"]

			if (SCRIPT_DATA["HasteSpawn"]) then
				Channel.inform("Hasting enabled")
			else
				Channel.inform("Hasting disabled")
			end
		end
	else
		Callback.checkConditions(EVENT_CHANNEL, message)
	end
end

function onChannelClose(channel)
	Channel.channelCreate()
end

--		8 8888 b.             8  8 8888 8888888 8888888888 
--		8 8888 888o.          8  8 8888       8 8888       
--		8 8888 Y88888o.       8  8 8888       8 8888       
--		8 8888 .`Y888888o.    8  8 8888       8 8888       
--		8 8888 8o. `Y888888o. 8  8 8888       8 8888       
--		8 8888 8`Y8o. `Y88888o8  8 8888       8 8888       
--		8 8888 8   `Y8o. `Y8888  8 8888       8 8888       
--		8 8888 8      `Y8o. `Y8  8 8888       8 8888       
--		8 8888 8         `Y8o.`  8 8888       8 8888       
--		8 8888 8            `Yo  8 8888       8 8888       

function init()
	-- Disable cavebot
	Player.walker(false)
	Player.targeting(false)
	Player.looter(false)

	-- Set basic values
	SCRIPT_DATA["Ot"] = isRealTibia() == 0 and true or false
	SCRIPT_DATA["Level"] = Player.level()
	SCRIPT_DATA["Vocation"] = Player.vocation()
	SCRIPT_DATA["DefaultAmulet"] = Item.eqData("amulet").id
	SCRIPT_DATA["Exit"] = Rewriting.getSpawnExit()

	BACKPACKS["MainBackpack"] = {name = Item.getItemName(Item.eqData("backpack").id), index = 0}

	local fileName = Ini.getFileName()
	local configFound = Ini.saveFile(fileName, SCRIPT_CONFIG)

	-- Open config editor
	if (configFound) then
		Ini.parseFile(fileName)

		-- Parse specific configurations in config
		Ini.parseConfig("Potions", {"Max", "Min"})
		Ini.parseConfig("Runes", {"Max", "Min"})
		Ini.parseConfig("Ammunition", {"Max", "Min"})
		Ini.parseConfig("Ring", {"Max", "Min", "Creature", "Creatures", "Health"})
		Ini.parseConfig("Amulet", {"Max", "Min", "Creature", "Creatures", "Health"})
		Ini.parseConfig("Withdraw", {"Max", "Min"})
	else
		showConfigEditor(fileName)

		Channel.wait("Type 'start' after you're done editing config file", function(response)
			if (string.find(string.lower(response), "start")) then
				init()
				return
			end
		end)

		return
	end

	local bp1, name1, bp2, name2 = Backpacks.verifyNames()

	-- Verify backpacks
	if (bp1 and name1 and bp2 and name2) then
		Channel.warn("Backpacks can't have identical names!")
		Channel.warn("[" ..bp1.. "] = " ..name1.. " and [" ..bp2.. "] = " ..name2)

		showConfigEditor(fileName)

		Channel.wait("Type 'start' after you're done editing config file", function(response)
			if (string.find(string.lower(response), "start")) then
				init()
				return
			end
		end)

		return
	end

	-- Draw HUD
	if (CONFIG["Hud"] and CONFIG["Hud"]["EnableHud"]) then
		local fileName = "JontorHUD"
		local fileFound = Ini.saveFile(fileName, HUD_CONFIG)

		if (not fileFound) then
			Channel.inform("A special config for the HUD was created in the configs directory, for more information such as available colors to edit, please refer to my forum thread or type /colors. Note: Colors are updated real time :)")
		end

		if (Hud.checkChanges()) then
			Hud.saveValues()
		end

		Hud.initHUD()
		Hud.drawHUD()
	end

	-- Open backpacks
	Backpacks.resetBackpacks(true, function()

		-- Rewrite looter settings to match backpacks
		Rewriting.looter()

		-- Start resetting backpacks for reconnecting
		Event.startEvent("BpReset")

		-- Check Blessed Wooden Stake, Obisidian Knife and a fishing rod
		if (Item.count(5942) > 0 or Item.count(5908) > 0 or Item.count(3483) > 0) then
			Event.startEvent("Skinning")
		end

		-- Passed resetting backpacks, setting HUD values
		if (CONFIG["Hud"] and CONFIG["Hud"]["EnableHud"]) then
			HUD["RefillTime"] = HUD["RefillTime"] + os.time()
			HUD["Time"] = os.time()

			Event.startEvent("HUD")

			local scriptName = string.match(SCRIPT_DATA["Name"], "^%[.-%]%s+(.+)$")

			Hud.updateText("Script Information", "Script name", scriptName)
			Hud.updateText("Script Information", "Library version", SCRIPT_DATA["Version"])

			Hud.updateText("Botting Information", "Spawn exp/h", "0/h")
		end

		-- Ring/Amulet equipper if needed
		for suppID, supply in pairs(SUPPLIES) do
			if (supply.group == "Ring" and supply.max > 0) then
				Event.startEvent("RingEquipper")
			end
			if (supply.group == "Amulet" and supply.max > 0) then
				Event.startEvent("AmuletEquipper")
			end
		end

		-- Depots
		SCRIPT_DATA["StackDepot"] = CONFIG["Depot"] and tonumber(CONFIG["Depot"]["StackDepot"]) - 1 or 0
		SCRIPT_DATA["NonStackDepot"] = CONFIG["Depot"] and tonumber(CONFIG["Depot"]["NonStackDepot"]) - 1 or 1
		SCRIPT_DATA["SuppliesDepot"] = CONFIG["Depot"] and tonumber(CONFIG["Depot"]["SuppliesDepot"]) - 1 or 2

		-- Enable gold changer if we're on OT
		if (SCRIPT_DATA["Ot"]) then
			Event.startEvent("GoldChanger")
		end

		-- Go to depot if loot was found at the beggining
		if (Backpacks.checkDeposit()) then
			Channel.inform("Loot detected, going to deposit items")
		end

		-- Choose next location
		local currentTown = Town.getTown().name
		local currentPlace = Town.getTownPlace().name
		local destination = Town.checkNextLocation()

		if (not currentPlace) then
			Channel.warn("Please make sure to start the script in correct town and valid position")
			return
		end

		Player.walker(true)
		Player.targeting(true)
		Player.looter(true)

		Map.goToLabel(currentTown.. "|" ..currentPlace.. "-" ..destination)

		-- Capacity checker after the intial Player.walker
		local t, required, state = Hunt.checkInitialCap()

		if (not state) then
			Player.walker(false)
			Channel.inform("Missing cap, printing informations:")
			
			Channel.warn("Missing cap: " ..tostring(required))

			for i = 1, #t do
				Channel.warn("[" ..t[i]["section"].. "] " .. t[i]["supply"].. " - missing amount: " ..tostring(t[i]["missing"]).. ", required cap: " ..tostring(t[i]["cap"]))
			end

			Channel.inform("Please edit the config and lower maximum supplies values, stopping walker.")
			
			showConfigEditor(fileName)

			Channel.wait("Please restart the script after you're done editing the config file.")
			return
		end

		-- IPC
		if (CONFIG["Teamhunt"]) then
			Ipc.init()
		end
	end)
end

Event.registerNewEvent(WALKER_SELECTLABEL, "onLabel")
Event.registerNewEvent(TIMER_TICK, "onTick")
Event.registerNewEvent(GENERIC_TEXT_MESSAGE, "onGenericMessage")
Event.registerNewEvent(NPC_MESSAGE, "onNpcMessage")
Event.registerNewEvent(ERROR_MESSAGE, "onErrorMessage")
Event.registerNewEvent(LOOT_MESSAGE, 'onLootMessage')
Event.registerNewEvent(CONTAINER_OPEN, "onNewContainer")
Event.registerNewEvent(EVENT_SELF_CHANNELSPEECH, "onChannelSpeak")
Event.registerNewEvent(EVENT_SELF_CHANNELCLOSE, "onChannelClose")

Channel.channelCreate()
init()