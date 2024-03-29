local guiEnabled = false


RegisterNUICallback('escape', function(data, cb)
    EnableGui(false)

    cb('ok')
end)

RegisterNetEvent('es_carshop:closeWindow')
AddEventHandler('es_carshop:closeWindow', function()
	EnableGui(false)
end)

function EnableGui(enable)
    SetNuiFocus(enable)
    guiEnabled = enable

    SendNUIMessage({
        type = "enableui",
        enable = enable
    })
end

local carshops = {
	
	{['x'] = -15.20, ['y'] = -1082.81, ['z'] = 26.67},

}

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

Citizen.CreateThread(function()
	for k,v in ipairs(carshops) do
		TriggerEvent('es_carshop:createBlip', 50, v.x, v.y, v.z)
	end
end)


RegisterNetEvent("es_carshop:createBlip")
AddEventHandler("es_carshop:createBlip", function(type, x, y, z)
	local blip = AddBlipForCoord(x, y, z)
	SetBlipSprite(blip, type)
	SetBlipScale(blip, 0.8)
	SetBlipAsShortRange(blip, true)

	if(type == 50)then
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Araç Kataloğu")
		EndTextCommandSetBlipName(blip)
	end
end)

local selected = 1
local keyboard = false
local tkeyboard = nil
local vehicleLocked = false

local selected = 1
local keyboard = false
local tkeyboard = nil

local showFixMessage = false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if(showFixMessage)then
			Citizen.Wait(3000)
			showFixMessage = false
		end
	end
end)

Citizen.CreateThread(function()
    while true do
			Citizen.Wait(1)

			

			local pos = GetEntityCoords(GetPlayerPed(-1), true)

				for k,v in ipairs(carshops) do
					if(Vdist(pos.x, pos.y, pos.z, v.x, v.y, v.z) < 100.0)then
						DrawMarker(1, v.x, v.y, v.z - 1, 0, 0, 0, 0, 0, 0, 3.0001, 3.0001, 1.5001, 255, 165, 0,165, 0, 0, 0,0)

						if(Vdist(pos.x, pos.y, pos.z, v.x, v.y, v.z) < 2.0 and showFixMessage == false)then
							if(not IsPedInAnyVehicle(GetPlayerPed(-1), false))then
								DisplayHelpText("Kataloga erişmek için ~b~~INPUT_CONTEXT~~w~ basınız.")

								if(IsControlJustReleased(1, 51))then
									EnableGui(true)
								end
							end
						end
					end
				end

        if guiEnabled then
			DisableControlAction(1, 18, true)
			DisableControlAction(1, 24, true)
			DisableControlAction(1, 69, true)
			DisableControlAction(1, 92, true)
			DisableControlAction(1, 106, true)
			DisableControlAction(1, 122, true)
			DisableControlAction(1, 135, true)
			DisableControlAction(1, 142, true)
			DisableControlAction(1, 144, true)
			DisableControlAction(1, 176, true)
			DisableControlAction(1, 223, true)
			DisableControlAction(1, 229, true)
			DisableControlAction(1, 237, true)
			DisableControlAction(1, 257, true)
			DisableControlAction(1, 329, true)
	
			DisableControlAction(1, 14, true)
			DisableControlAction(1, 16, true)
			DisableControlAction(1, 41, true)
			DisableControlAction(1, 43, true)
			DisableControlAction(1, 81, true)
			DisableControlAction(1, 97, true)
			DisableControlAction(1, 180, true)
			DisableControlAction(1, 198, true)
			DisableControlAction(1, 39, true)
			DisableControlAction(1, 50, true)

			DisableControlAction(1, 22, true)
			DisableControlAction(1, 55, true)
			DisableControlAction(1, 76, true)
			DisableControlAction(1, 102, true)
			DisableControlAction(1, 114, true)
			DisableControlAction(1, 143, true)
			DisableControlAction(1, 179, true)
			DisableControlAction(1, 193, true)
			DisableControlAction(1, 203, true)
			DisableControlAction(1, 216, true)
			DisableControlAction(1, 255, true)
			DisableControlAction(1, 298, true)
			DisableControlAction(1, 321, true)
			DisableControlAction(1, 328, true)
			DisableControlAction(1, 331, true)

            if IsDisabledControlJustReleased(0, 142) then -- MeleeAttackAlternate
                SendNUIMessage({
                    type = "click"
                })
            end
        end
    end
end)

EnableGui(false)