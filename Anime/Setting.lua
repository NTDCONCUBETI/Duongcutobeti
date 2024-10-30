------------ Setting
local args = {
  [1] = "Mute Music",
  [2] = true
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ChangeSetting"):FireServer(unpack(args))
wait(2)

local args = {
  [1] = "Vibrations",
  [2] = false
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ChangeSetting"):FireServer(unpack(args))
wait(2)

local args = {
  [1] = "Auto Skip Wave",
  [2] = true
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ChangeSetting"):FireServer(unpack(args))
wait(2)

local args = {
  [1] = "Camera Shake",
  [2] = false
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ChangeSetting"):FireServer(unpack(args))
wait(2)

local args = {
  [1] = "Low Quality",
  [2] = true
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ChangeSetting"):FireServer(unpack(args))
wait(2)

local args = {
  [1] = "Skills Enabled",
  [2] = false
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ChangeSetting"):FireServer(unpack(args))
wait(2)

local args = {
  [1] = "Unit Info Position",
  [2] = 3
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ChangeSetting"):FireServer(unpack(args))
wait(2)

local args = {
  [1] = "Unit Visibility",
  [2] = 2
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ChangeSetting"):FireServer(unpack(args))
wait(2)

local args = {
  [1] = "Auto Sell Deletes Shinies",
  [2] = true
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ChangeSetting"):FireServer(unpack(args))
