local admin = getgenv().admin
local prefix = getgenv().prefix
local crasher = getgenv().crasher

local adverbmsg = getgenv().adverbmsg

local alts = getgenv().alts


local adminpositions = {{-870,-38,-550},{-870,-38,-570},{-870,-38,-590},{-870,-38,-610}}

--local adminpositionspremium = {(-870,-38,-550),(-870,-38,-570),(-870,-38,-590),(-870,-38,-610),(-900,-38,-550),(-900,-38,-570),(-900,-38,-590),(-900,-38,-610)}

local adverb = false

local dropping = false
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local Plr = game:GetService("Players").LocalPlayer
_G.dropper = instance
local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)

if table.find(alts, player.name) then
game:GetService("RunService"):Set3dRenderingEnabled(false)
end

local withlimit = false

local cashdropped = 0
local stopcash = 0

-- 
--loadstring(game:HttpGet(("https://raw.githubusercontent.com/Raycodex/Exploiting/main/Roblox/Da%20Hood%20Auto%20Cash%20Drop"), true))()

local function onChatted(p,msg)
            print(msg)
    if player.name==admin then
     return
    end
     
    if p.name==admin then

        if msg == prefix.."drop" then
            withlimit = false
            dropping = true
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Start","All")
        end
        if msg:match(prefix.."cdrop") then
            stopcash = tonumber(string.split(msg," ")[2])
            withlimit = true
            dropping = true
            print("Started dropping "..stopcash)
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Start","All")
        end
        if msg == prefix.."advert" then
            adverb = not adverb
        end
        if msg == prefix.."stop" then
            dropping = false
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("End","All")
            cashdropped = 0
            print("Stopped")
        end
         if msg == prefix.."dropped" then
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(cashdropped,"All")
        end
        if msg == prefix.."crash" then
            if player.name == crash then
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
        if msg == prefix.."host" then
            print("Moving to admin.")
            local targetPlayer = Players:FindFirstChild(admin)
            Players.LocalPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
            player.Character.HumanoidRootPart.Rotation = Vector3.new(0,0,0)
        end
        if msg:match(prefix.."tpto") then
            local targetPlayer = Players:FindFirstChild(string.split(msg," ")[2])
            Players.LocalPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
            player.Character.HumanoidRootPart.Rotation = Vector3.new(0,0,0)
        end
         if msg:match(prefix.."bring") then
            local targetPlayer = Players:FindFirstChild(string.split(msg," ")[2])
            Players.LocalPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
            player.Character.HumanoidRootPart.lookAt(targetPlayer.Character.HumanoidRootPart.Position)
            if Plr.Backpack:FindFirstChild("Combat") and Plr.Character:FindFirstChild("Combat") == nil then
                        local tool = Plr.Backpack:FindFirstChild("Combat")
                        Plr.Character.Humanoid:EquipTool(tool)
                        Plr.Character.Humanoid:Activate(tool)
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


for _,p in ipairs(Players:GetPlayers()) do
    p.Chatted:Connect(function(msg) onChatted(p,msg) end)
end

Players.PlayerAdded:Connect(function(p)
    p.Chatted:Connect(function(msg) onChatted(p,msg) end)
end)

while wait() do
    if dropping == true then
    cashdropped = cashdropped + 7000
    if withlimit == true then
        if stopcash > cashdropped then
            game.ReplicatedStorage.MainEvent:FireServer("DropMoney",10000)
            wait(15)
        else
            dropping = false
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("End","All")
            cashdropped = 0
        end
    end
    if withlimit == false then
        game.ReplicatedStorage.MainEvent:FireServer("DropMoney",10000)
        wait(15)
end
end
end
while wait() do
    if adverb == true then
        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(adverbmsg,"All")
        wait(9.5)
    end
end
