--// BlackTrap UI Example by jmes

--//Load UI
local Blacklib = loadstring(game:HttpGet("https://raw.githubusercontent.com/jmesfo0/RobloxUI/main/Blacktrap_Lib1.3"))()

--//Initiate Window
local Win = Blacklib:Window()

--//Add Tabs
local Main_Home = Win:Tab("• Home", "rbxassetid://8825667942")

--//Add Sections
local Home = Main_Home:NewSection("This is a section")

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

--//Add Slider
Home:Slider("This is a slider", 0, 10, 1, function(Value)
	print('Slider Value:', Value)
end)

--//Destroy Gui Button
Home:Button("Destroy Gui", function()
	game:GetService("CoreGui"):FindFirstChild("BlackTrap"):Destroy()
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
