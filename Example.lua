--// BlackTrap UI Example by jmes

--//Load UI
local Blacklib = loadstring(game:HttpGet("https://raw.githubusercontent.com/jmesfo0/RobloxUI/main/blacktrap"))()

--//Initiate Window
local Win = Blacklib:Window()

--//Add Tabs
local Main_Home = Win:Tab("• Home", "rbxassetid://8825667942")

--//Add Sections
local Home = Main_Home:NewSection("This is a section")

--//Timer and Client FPS Label
Time = Home:Label("Server Time")
Client = Home:Label("User")

--//Add Label
Home:Label("This is a label")

--//Add Line
Home:Line()

--//Button
Home:Button("This is a button",function()
	Blacklib:Notification("This is a notification", "This is notification text")
end)

--//Table for Dropdown
local DropdownItems = {"Default"; "Select 1"; "Select 2"; "Select 3";}

--//Add Dropdown
Home:Dropdown("Select item", "Default", DropdownItems, function(Value)
	print('Selected:', Value)
end)

--//Add Toggle
Home:Toggle("This is a toggle", false, function(Value)
	print('Toggle:', Value)
end)

--//Add Text Box
Home:Label("Type and press ENTER to set value")
Home:TextBox("This is a textbox", "", function(Value)
	print('Text Box Value:', Value)
end)

--//Destroy Gui Button
Home:Button("Destroy Gui", function()
	game:GetService("CoreGui"):FindFirstChild("BlackTrap"):Destroy()
end)

--//Add Slider
Home:Slider("This is a slider", 0, 10, 1, function(Value)
	print('Slider Value:', Value)
end)

--//Keybind
Home:Bind("Set key to hide/show menu", Enum.KeyCode.End, function()
	Minimize()
end)

--//Keybind Function
local menutoggle = false
function Minimize()
	if menutoggle == false then
		menutoggle = true
		game:GetService("CoreGui").BlackTrap.Points.WindowFrame.Visible = false
	else
		menutoggle = false
		game:GetService("CoreGui").BlackTrap.Points.WindowFrame.Visible = true
	end
end

--//Update Timer
function UpdateTime()
    local GameTime = math.floor(workspace.DistributedGameTime+0.5)
    local Hour = math.floor(GameTime/(60^2))%24
    local Minute = math.floor(GameTime/(60^1))%60
    local Second = math.floor(GameTime/(60^0))%60
    Time:Refresh("Hour : "..Hour.." Minute : "..Minute.." Second : "..Second)
end

task.spawn(function()
    while true do task.wait(.3)
        UpdateTime()
    end
end)

TestTable = {}
for i=1,100 do
table.insert(TestTable, "["..i.."] Test Value")
end
local Paragraph = Home:CreateParagraph({Title = "Paragraph", Content = "\n"})
Paragraph:Set({Title = "Paragraph", Content = table.concat(TestTable, "\n")})
--//Update FPS and Ping
function UpdateClient()
    local Ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
    local Fps = workspace:GetRealPhysicsFPS()
    Client:Refresh("Fps : "..Fps.." Ping : "..Ping)
end

task.spawn(function()
    while true do task.wait(.3)
        UpdateClient()
    end
end)
