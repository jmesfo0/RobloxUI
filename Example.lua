--// BlackTrap UI Example by jmes
local Config = {
	Toggle = false;
	TextBox = "Default Text";
	Dropdown = "Default";
	DeleteNumber = "";
	Slider = 1;
	Entry = "Text To Add";
	Bind = Enum.KeyCode.End;
	DropdownItems = {"Default"; "Select 1"; "Select 2"; "Select 3";},
	TestTable = {}
}
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


--//Add Dropdown
Home:Dropdown("Select item", Config.Dropdown, Config.DropdownItems, function(Value)
	Config.Dropdown = Value
	print('Selected:', Value)
end)

--//Add Toggle
Home:Toggle("This is a toggle", Config.Toggle, function(Value)
	Config.Toggle = Value
	print('Toggle:', Value)
end)

--//Add Text Box
Home:Label("Type and press ENTER to set value")
Home:TextBox("This is a textbox", Config.TextBox, function(Value)
	Config.TextBox = Value
	print('Text Box Value:', Value)
end)

--//Destroy Gui Button
Home:Button("Destroy Gui", function()
	game:GetService("CoreGui"):FindFirstChild("BlackTrap"):Destroy()
end)

--//Add Slider
Home:Slider("This is a slider", 0, 10, Config.Slider, function(Value)
	Config.Slider = Value
	print('Slider Value:', Value)
end)

--//Keybind
Home:Bind("Set key to hide/show menu", Config.Bind, function()
	Minimize()
end)

--//Initialize TestTable
for i=1,100 do
	table.insert(Config.TestTable, "This is a test entry for a list.")
end


--//Add Paragraph
local Paragraph = Home:CreateParagraph({Title = "Paragraph", Content = "\n"})

--//Set SaveNumber
local SaveNumber = #Config.TestTable + 1

--//Set Paragraph
if #Config.TestTable > 1 then
    local TempTable = {}
    for i,v in pairs(Config.TestTable) do
        table.insert(TempTable, "["..i.."] "..v)
    end
	Paragraph:Set({Title = "Paragraph", Content = table.concat(TempTable, "\n")})
end

--// TextBox
Home:TextBox("Enter Text", Config.Entry, function(Value)
	Config.Entry = Value
end)

--// Button
Home:Button("Add Entry", function()
	Config.TestTable[SaveNumber] = Config.Entry
	local TempTable = {}
	for i,v in pairs(Config.TestTable) do
		table.insert(TempTable, "["..i.."] "..v)
	end
	Paragraph:Set({Title = "Paragraph", Content = table.concat(TempTable, "\n")})
	SaveNumber = #Config.TestTable + 1
end)

--// TextBox
Home:TextBox("Entry # to Delete", Config.DeleteNumber, function(Value)
	Config.DeleteNumber = Value
end)

--// Button
Home:Button("Delete Entry", function()
	local ListToReAdd = {}
	for i,v in pairs(Config.TestTable) do
		task.spawn(function()
			if i ~= tonumber(Config.DeleteNumber) then
				table.insert(ListToReAdd, v) 
			end
		end)
	end
	Config.TestTable = ListToReAdd
	local TempTable = {}
	for i,v in pairs(Config.TestTable) do
		table.insert(TempTable, "["..i.."] "..v)
	end
	Paragraph:Set({Title = "Paragraph", Content = table.concat(TempTable, "\n")})
	SaveNumber = #TempTable + 1
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
