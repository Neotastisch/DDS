local admin = getgenv().admin

local bringer = getgenv().bringer

local prefix = getgenv().prefix
local crasher = getgenv().crasher

local adverbmsg = getgenv().adverbmsg

local alts = getgenv().alts

local fps = getgenv().fps

local webhook = getgenv().webhook

local SetupsTable = {
	Bank = {
		Origin = CFrame.new(-386.826202, 21.2503242, -325.340912, 0.998742342, 0, -0.0501373149, 0, 1, 0, 0.0501373149, 0, 0.998742342)*CFrame.new(0,0,-3),
		ZMultiplier = 3,
		XMultiplier = 8,
		PerRow = 10,
		Rows = 4,
	},
	Admin = {
		Origin = CFrame.new(-884.12915, -38.3972931, -545.291809, -0.99998939, 2.69316498e-08, -0.00460755778, 2.6944301e-08, 1, -2.68358624e-09, 0.00460755778, -2.80770518e-09, -0.99998939),
		ZMultiplier = 3,
		XMultiplier = 8,
		PerRow = 10,
		Rows = 4,
	},
	Klub = {
		Origin = CFrame.new(-237.016571, -4.87585974, -411.940063, 0.994918466, -1.5840282e-08, -0.100683607, 6.8329018e-09, 1, -8.9807088e-08, 0.100683607, 8.86627731e-08, 0.994918466),
		ZMultiplier = 6,
		XMultiplier = -12,
		PerRow = 10,
		Rows = 4,
	},
	Vault = {
		Origin = CFrame.new(-519.201355, 23.1994667, -292.362, -0.0597927198, 6.70288927e-08, -0.998210788, 2.96872589e-08, 1, 6.53707701e-08, 0.998210788, -2.57254467e-08, -0.0597927198),
		ZMultiplier = -2.5,
		XMultiplier = 4,
		PerRow = 10,
		Rows = 4,
	},
	Train = {
		Origin = CFrame.new(606.527588, 34.5070801, -159.083542, 0.0376962014, -7.60452892e-08, 0.999289274, 6.54496404e-08, 1, 7.36304173e-08, -0.999289274, 6.26275352e-08, 0.0376962014),
		ZMultiplier = 5,
		XMultiplier = -7,
		PerRow = 10,
		Rows = 4,
	}
}




local adminpositions = {{-870,-38,-550},{-870,-38,-570},{-870,-38,-590},{-870,-38,-610},{-900,-38,-550},{-900,-38,-570},{-900,-38,-590},{-900,-38,-610}}
local BringLocations = {
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
while true do
if bringname != "" then
Players:FindFirstChild(bringname).Character:FindFirstChild("Humanoid").Running:Connect(function(speed)
	if speed > 0.1 then
		bringnamemoving = true
		else
		bringnamemoving = false		
		
	end
end)
end
wait()
end
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
			if not c:FindFirstChild("Combat") then
				c.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack.Combat)     
			end
			Root.CFrame = CFrame.new(TargetChar.HumanoidRootPart.Position)*CFrame.new(0,0,3)
			bringname = Target.name
			wait(1)
			repeat wait(0)
			if bringnamemoving == true then
			Root.CFrame = CFrame.new(TargetChar.HumanoidRootPart.Position)*CFrame.new(0,0,3)
			bringnamemoving = false	
			wait(1)
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
            Duration = 5
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
     return
    end
     
    if p.name==admin then

        if msg == prefix.."drop" then
	                if player.name == crasher then return end
            withlimit = false
            dropping = true
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Start","All")
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
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(cashdropped.."$","All")
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
           local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
           humanoid.Jump = true
	   player.Character.HumanoidRootPart.Rotation = Vector3.new(0,0,0)
           wait(0.3)
           game.Players.LocalPlayer.Character.Head.Anchored = true
	end
        end
        if msg == prefix.."unlock" then
           game.Players.LocalPlayer.Character.Head.Anchored = false
        end
        if msg == prefix.."lock" then
           game.Players.LocalPlayer.Character.Head.Anchored = true
	   player.Character.HumanoidRootPart.Rotation = Vector3.new(0,0,0)
        end
        if msg == prefix.."host" then
            print("Moving to admin.")
            local targetPlayer = Players:FindFirstChild(admin)
            Players.LocalPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
            player.Character.HumanoidRootPart.Rotation = Vector3.new(0,0,0)
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
                    player.Character.HumanoidRootPart.CFrame = CFrame.new(adminpositions[i][1],adminpositions[i][2],adminpositions[i][3])
                    player.Character.HumanoidRootPart.Rotation = Vector3.new(0,0,0)
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

