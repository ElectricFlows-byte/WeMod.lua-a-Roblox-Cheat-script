local UICorner = Instance.new("UICorner")
local NewGames = Instance.new("ScrollingFrame")
local UIGridLayout = Instance.new("UIGridLayout")
local Mods = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local TopBar = Instance.new("Frame")
local Close = Instance.new("TextButton")
local Title = Instance.new("TextLabel")
local Research = Instance.new("TextBox")
local UICorner_2 = Instance.new("UICorner")
local s = Instance.new("ScreenGui")
local bg = Instance.new("Frame")
local as = Instance.new("CanvasGroup")
local ts = game:GetService("TweenService")
local hs = game:GetService("HttpService")
local edition = "Normal Edition"
local charset = "azertyuiopqsdfghjklmwxcvbn0123456789"
local function Rayane(l:number)
	local r = ""
	for i=1,l do
		local rr = math.random(1,#charset)
		r = r .. charset:sub(rr,rr)
	end
	return r
end
local function GetParent()
	local sus,err = pcall(function()
		return game.CoreGui.RobloxGui
	end)
	if sus then
		return game.CoreGui
	else
		return game.Players.LocalPlayer.PlayerGui
	end
end
local function CreateStoke(parent:Instance,stokemode,color:Color3,linijoin,thick,trans)
	local Stroke = Instance.new("UIStroke")
	Stroke.Parent = parent
	Stroke.ApplyStrokeMode = stokemode
	Stroke.Color = color
	Stroke.LineJoinMode = linijoin
	Stroke.Thickness = thick
	Stroke.Transparency = trans
end
local Warnings = Instance.new("Frame")
Warnings.Name = "Warnings"
Warnings.Parent = s
Warnings.Position = UDim2.fromScale(0,0)
Warnings.Size = UDim2.fromScale(0.15,1)
Warnings.Transparency = 1
local UIList = Instance.new("UIListLayout")
UIList.Parent = Warnings
UIList.VerticalAlignment = Enum.VerticalAlignment.Bottom
local BigAndClose = TweenInfo.new(0.5,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut)
local SoundGroups = {}
local SoundGroupsFolder = Instance.new("Folder",GetParent())
SoundGroupsFolder.Name = Rayane(100)
local ActiveSound = Instance.new("Folder",SoundGroupsFolder)
ActiveSound.Name = "ActiveSound"
local function InitializeSoundGroupe(NAme)
	local SoundGroup = Instance.new("SoundGroup",SoundGroupsFolder)
	SoundGroup.Volume = 0.5
	SoundGroup.Name = NAme
	SoundGroups[NAme] = SoundGroup
end
InitializeSoundGroupe("PopUp")
local function PlaySound(soundid,parent)
	task.spawn(function()
		local sous = Instance.new("Sound",ActiveSound)
		sous.SoundId = soundid 
		sous.Volume = 1
		sous.SoundGroup = SoundGroups[parent]
		sous:Play()
		sous.Ended:Connect(function()
			sous:Destroy()
		end)
	end)
end
local function Message(title:string,desc:string,image,duration:number)
	task.spawn(function()
		local FrameMessage = Instance.new("Frame")
		local Icoen = Instance.new("ImageLabel")
		local Titlee = Instance.new("TextLabel")
		local Textt = Instance.new("TextLabel")
		FrameMessage.Parent = Warnings
		FrameMessage.BorderSizePixel = 0
		FrameMessage.BackgroundColor3 = Color3.fromRGB(76, 0, 76)
		FrameMessage.BackgroundTransparency = 0.25
		CreateStoke(FrameMessage,Enum.ApplyStrokeMode.Border,Color3.fromRGB(171,171,171),Enum.LineJoinMode.Round,1,0)
		local caca = Instance.new("UICorner",FrameMessage)
		caca.CornerRadius = UDim.new(0.1,0)
		Icoen.Parent = FrameMessage
		Icoen.BackgroundTransparency = 1
		Icoen.AnchorPoint = Vector2.new(0.5,0.5)
		Icoen.Position = UDim2.new(0.1,0,0.5,0)
		Icoen.Size = UDim2.new(0.5,0,0.5,0)
		Icoen.Image = image
		Titlee.Parent = FrameMessage
		Titlee.Text = title
		Titlee.Position = UDim2.new(0.1,0,0,0)
		Titlee.Size = UDim2.new(0.9,0,0.25,0)
		Titlee.BackgroundTransparency = 1
		Titlee.TextColor3 = Color3.fromRGB(255,255,255)
		Titlee.TextScaled = true
		Textt.Parent = FrameMessage
		Textt.Text = desc
		Textt.Position = UDim2.new(0.2,0,0.25,0)
		Textt.Size = UDim2.new(0.8,0,0.7,0)
		Textt.BackgroundTransparency = 1
		Textt.TextColor3 = Color3.fromRGB(255,255,255)
		Textt.TextScaled = true
		Instance.new("UIAspectRatioConstraint",Icoen)
		ts:Create(FrameMessage,BigAndClose,{Size = UDim2.new(1,0,0,75)}):Play()
		PlaySound("rbxassetid://428495297","PopUp")
		task.wait(duration)
		ts:Create(FrameMessage,BigAndClose,{Size = UDim2.fromScale(0,0.0)}):Play()
		task.wait(0.5)
		FrameMessage:Destroy()
	end)
end
local function RobloxMessage(title:string,desc:string,image,duration:number)
	game:GetService("StarterGui"):SetCore("SendNotification",{
		Title = title,
		Text = desc,
		Icon = image,
		Duration = duration
	})
end
s.Name = Rayane(100)
s.Parent = GetParent()
s.IgnoreGuiInset = true
s.Enabled = true
s.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
bg.Name = "bg"
bg.Parent = s
bg.Active = true
bg.Draggable = true
bg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
bg.BackgroundTransparency = 1.000
bg.BorderColor3 = Color3.fromRGB(0, 0, 0)
bg.BorderSizePixel = 0
bg.Position = UDim2.new(0.222849086, 0, 0.105802044, 0)
bg.Size = UDim2.new(0.553455591, 0, 0.787713289, 0)
as.Name = "AS"
as.Size = UDim2.new(1,0,1,0)
as.BorderSizePixel = 0
as.BackgroundColor3 = Color3.fromRGB(76,0,76)
as.BackgroundTransparency = 0.25
as.Parent = bg
UICorner.CornerRadius = UDim.new(0.0250000004, 0)
UICorner.Parent = as
NewGames.Name = "Games"
NewGames.Parent = as
NewGames.Active = true
NewGames.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NewGames.BackgroundTransparency = 1.000
NewGames.BorderColor3 = Color3.fromRGB(0, 0, 0)
NewGames.BorderSizePixel = 0
NewGames.Position = UDim2.new(0.2, 0, 0.236135066, 0)
NewGames.Size = UDim2.new(0.8, 0, 0.763864934, 0)
NewGames.Visible = true
NewGames.ScrollBarThickness = 7
CreateStoke(NewGames,Enum.ApplyStrokeMode.Border,Color3.fromRGB(171,171,171),Enum.LineJoinMode.Round,1,0)
UIGridLayout.Parent = NewGames
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout.CellSize = UDim2.new(0, 200, 0, 275)
Mods.Name = "Mods"
Mods.Parent = as
Mods.Active = true
Mods.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Mods.BackgroundTransparency = 1.000
Mods.BorderColor3 = Color3.fromRGB(0, 0, 0)
Mods.BorderSizePixel = 0
Mods.Position = UDim2.new(0.2, 0, 0.236135066, 0)
Mods.Size = UDim2.new(0.8, 0, 0.763864934, 0)
Mods.ScrollBarThickness = 7
Mods.Visible = false
UIListLayout.Parent = Mods
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
TopBar.Name = "TopBar"
TopBar.Parent = as
TopBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TopBar.BackgroundTransparency = 1.000
TopBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
TopBar.BorderSizePixel = 0
TopBar.Position = UDim2.new(0, 0, 0, 0)
TopBar.Size = UDim2.new(1, 0, 0.0545008704, 0)
CreateStoke(TopBar,Enum.ApplyStrokeMode.Border,Color3.fromRGB(171,171,171),Enum.LineJoinMode.Round,1,0)
Close.Name = "Close"
Close.Parent = TopBar
Close.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
Close.BackgroundTransparency = 1.000
Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
Close.BorderSizePixel = 0
Close.Position = UDim2.new(0.950547993, 0, 0, 0)
Close.Size = UDim2.new(0.0489934348, 0, 1, 0)
Close.Font = Enum.Font.SourceSans
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.TextScaled = true
Close.TextSize = 14.000
Close.TextWrapped = true
Close.AutoButtonColor = false
Title.Name = "Title"
Title.Parent = TopBar
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0, 0, 0, 0)
Title.Size = UDim2.new(0.941637456, 0, 1.00000012, 0)
Title.Font = Enum.Font.SourceSans
Title.Text = "WeMod (v1.0).lua " .. edition
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextWrapped = true
Title.TextXAlignment = Enum.TextXAlignment.Left
Research.Name = "Research"
Research.Parent = as
Research.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Research.BorderColor3 = Color3.fromRGB(0, 0, 0)
Research.BorderSizePixel = 0
Research.Position = UDim2.new(0.2318550691, 0, 0.095320642, 0)
Research.Size = UDim2.new(0.737155902, 0, 0.0724923685, 0)
Research.Font = Enum.Font.SourceSans
Research.PlaceholderColor3 = Color3.fromRGB(81, 81, 81)
Research.PlaceholderText = "Put the game ID or the game name here."
Research.Text = ""
Research.TextColor3 = Color3.fromRGB(193, 193, 193)
Research.TextScaled = true
Research.TextSize = 14.000
Research.TextWrapped = true
Research.TextXAlignment = Enum.TextXAlignment.Left
Research.ClearTextOnFocus = false
CreateStoke(Research,Enum.ApplyStrokeMode.Border,Color3.fromRGB(171,171,171),Enum.LineJoinMode.Round,1,0)
CreateStoke(as,Enum.ApplyStrokeMode.Border,Color3.fromRGB(171,171,171),Enum.LineJoinMode.Round,1,0)
UICorner_2.CornerRadius = UDim.new(0.200000003, 0)
UICorner_2.Parent = Research
Close.MouseEnter:Connect(function()
	ts:Create(Close,TweenInfo.new(0.1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0),{["BackgroundTransparency"] = 0}):Play()
end)
Close.MouseLeave:Connect(function()
	ts:Create(Close,TweenInfo.new(0.1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0),{["BackgroundTransparency"] = 1}):Play()
end)
local Reopen = Instance.new("TextButton")
Reopen.Text = "Open"
Reopen.Position  = UDim2.fromScale(0.9,0.95)
Reopen.Size = UDim2.fromScale(0.1,0.05)
Reopen.Visible = false
Reopen.TextScaled = true
Reopen.BackgroundColor3 = Color3.fromRGB(50,50,50)
Reopen.BackgroundTransparency = 0.5
Reopen.TextColor3 = Color3.new(1,1,1)
Reopen.Font = Enum.Font.Code
Reopen.Parent = s
bg.Visible = false
CreateStoke(Reopen,Enum.ApplyStrokeMode.Border,Color3.fromRGB(171,171,171),Enum.LineJoinMode.Round,1,0)
Close.MouseButton1Click:Connect(function()
	bg.Visible = false
	Reopen.Visible = true
end)
Reopen.MouseButton1Click:Connect(function()
	bg.Visible = true
	Reopen.Visible = false
end)
local function stringToHex(str)
	local hex = ""
	for i = 1, #str do
		local byte = string.byte(str, i)
		hex = hex .. string.format("%02X", byte) -- 2 chiffres en majuscules
	end
	return hex
end
local saves,_ = pcall(function()
	isfolder(WeModCache)
	isfile(WeMod.."\\Main.m")
end)
local errors = 0
local maxerrors = 3
if not saves then
	errors += 1;
	Message("WeMod.lua","Your executor doesn't look like to support file functions, most of the important features cant be used.","rbxassetid://88822035066157",15)
end
local accepthttp,_ = pcall(function()
	game:HttpGet("https://github.com")
end)
if not accepthttp then
	errors += 1;
	Message("WeMod.lua","Your executor does not accept http requests.","rbxassetid://88822035066157",15)
end
local coregui,_ = pcall(function()
	if s.Parent == game.Players.LocalPlayer.PlayerGui then
		error()
	else
		return true
	end
end)
if not coregui then
	errors += 1;
	Message("WeMod.lua","Your executor wont let the script acces the CoreGui, are you executing this on studio ?","rbxassetid://88822035066157",15)
	if game["Run Service"]:IsStudio() then
		Message("WeMod.lua","Oh my days why are you executing this on studio ?","rbxassetid://88822035066157",60)
		task.spawn(function()
			task.wait(20)
			--SoundGroups["PopUp"].Volume = 1.5
			--Instance.new("DistortionSoundEffect",SoundGroups["PopUp"],{Level = 1})
			for inin=1,500 do
				Message("WeMod.lua","Why are you executing this on studio ?","rbxassetid://88822035066157",1)
				task.wait(math.random(1,5)/10)
			end
			task.wait(1)
			Message("WeMod.lua","Nah, seriously, are you really trying to find my source code ?","rbxassetid://88822035066157",10)
		end)
	end
end
local function GetErrors()
	local detected = {}
	if not saves then
		table.insert(detected,"File functions off")
	end
	if not accepthttp then
		table.insert(detected,"Http functions off")
	end
	if not coregui then
		table.insert(detected,"CoreGui not working")
	end
	return detected
end
local function GetDate()
	return os.date("%d/%m/%Y")
end
if errors == 1 then
	Title.Text = Title.Text .. " | " .. GetErrors()[1] .. " |"
elseif errors > 1 then
	local tac = GetErrors()
	Title.Text = Title.Text .. " | "
	for index, value in tac do
		if index == #tac then
			Title.Text = Title.Text .. value
		else
			Title.Text = Title.Text .. value .. ", "
		end
	end
	Title.Text = Title.Text .. string.format(" | (%d/%d errors)",errors,maxerrors)
else
	Title.Text = Title.Text .. string.format(" | (%d/%d errors fully working)",errors,maxerrors)
end
local WeModCache = "WeModCache"
local WeMod = "WeMod"
local ElectricFlows = "ElectricFlows"
local WriteCacheFile = WeModCache.."\\"
local WriteFile = WeMod.."\\"
local WriteElectricFlowsFile = ElectricFlows.."\\"
if saves then
	if not isfolder(ElectricFlows) then
		makefolder(ElectricFlows)
	end
	if not isfolder(WeModCache) then
		makefolder(WeModCache)
	end
	if not isfolder(WeMod) then
		makefolder(WeMod)
	end
	if not isfile(WeMod.."\\Main.m") then
		writefile(WriteFile.."Main.m","Ca va mec ? petit problème de save...")
	end
	if not isfolder(WeMod.."\\Configuration") then
		makefolder(WeMod.."\\Configuration")
	end
	writefile(WriteCacheFile..stringToHex("DefStartUp")..".cache","Powered on at :"..GetDate())
	writefile(WriteCacheFile.."IconCache.jpg",game:HttpGet("https://tr.rbxcdn.com/180DAY-725162ec27fede7a961e6303d9daf177/150/150/Image/Webp/noFilter"))
end
task.wait(5)
RobloxMessage("WeMod.lua",string.format("WeMod (%s) loaded!",edition),"rbxassetid://88822035066157",5)
Reopen.Visible = true
Message("Uzi","Bite me! :3","rbxassetid://89524052498183",1)
