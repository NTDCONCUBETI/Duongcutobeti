
local player = game.Players.LocalPlayer
local camera = workspace.CurrentCamera
local playerGui = player.PlayerGui
local indexTouch = 1000
function tab(x,y)
	wait(0.1)
	game:GetService("VirtualInputManager"):SendTouchEvent(indexTouch,0,x,y + 36)
	--wait(0.1)
	game:GetService("VirtualInputManager"):SendTouchEvent(indexTouch,1,x,y + 36)
	--wait(0.1)
	game:GetService("VirtualInputManager"):SendTouchEvent(indexTouch,2,x,y + 36)
	wait(0.1)
	indexTouch = indexTouch + 1
end

function presskey(keycode)
	game:GetService("VirtualInputManager"):SendKeyEvent(true,keycode,false,game:GetService("Players").LocalPlayer.PlayerGui)
	game:GetService("VirtualInputManager"):SendKeyEvent(false,keycode,false,game:GetService("Players").LocalPlayer.PlayerGui)
end



function clickToaDo(x,y, object)
	game:GetService("VirtualInputManager"):SendMouseButtonEvent(x,y,0,true,object,1)
	game:GetService("VirtualInputManager"):SendMouseButtonEvent(x,y,0,false,object,1)
	print("click",x,y)
end

--loadstring(game:HttpGet("https://raw.githubusercontent.com/NTDCONCUBETI/Duongcutobeti/refs/heads/main/Anime/CreateTable"))()

------- FPSBOOTER and LowMap

loadstring(game:HttpGet("https://raw.githubusercontent.com/NTDCONCUBETI/Duongcutobeti/refs/heads/main/FPSBOOTER"))()


------- The end FPSBOOTER and LowMap
if game.PlaceId == 17017769292 or game.PlaceId == 17764698696 then

	function click(a)
		game:GetService("VirtualInputManager"):SendMouseButtonEvent(a.AbsolutePosition.X+a.AbsoluteSize.X/2,a.AbsolutePosition.Y+a.AbsoluteSize.Y/2+40,0,true,a,1)
		game:GetService("VirtualInputManager"):SendMouseButtonEvent(a.AbsolutePosition.X+a.AbsoluteSize.X/2,a.AbsolutePosition.Y+a.AbsoluteSize.Y/2+40,0,false,a,1)
	end
	-- Chờ cho đến khi trò chơi được tải hoàn toàn
	repeat
		task.wait()
	until game:IsLoaded()

	-- Chờ cho đến khi PlaceId đã được gán
	repeat
		task.wait()
	until game.PlaceId ~= nil

	-- Đảm bảo LocalPlayer tồn tại
	local player = game:GetService("Players").LocalPlayer

	-- Sử dụng WaitForChild với giới hạn thời gian
	local playerGui = player:WaitForChild("PlayerGui")

	-- Kiểm tra PAGES trong vòng 30 giây
	local pages
	local timeout = 30 -- thời gian tối đa là 30 giây
	local startTime = tick() -- thời điểm bắt đầu đếm thời gian

	while not pages and tick() - startTime < timeout do
		pages = playerGui:FindFirstChild("PAGES") -- Thử tìm PAGES
		if not pages then
			task.wait(0.5) -- đợi 0.5 giây trước khi kiểm tra lại
		end
	end

	if pages then
		print("[CLIENT] MatchPage đã được tải")
	else
		print("[CLIENT] Không tìm thấy MatchPage trong 30 giây, bỏ qua...")
		wait(1)
		for _, player in pairs(game.Players:GetPlayers()) do
			player:Kick("Game is shutting down.")
		end
		game:Shutdown()
	end

	-- Thực hiện các hành động tiếp theo tại đây
	---- Tắt bảng update
	local update = playerGui.PAGES.UpdatesUI
	wait(2)
	update.Visible = false
	--Nhận quà tuần
	playerGui.PAGES.QuestPage.Visible = true
	local btnWeekly = playerGui.PAGES.QuestPage.CategoryHolder.Weekly
	wait(3)
	click(btnWeekly)
	wait(3)
	tab( 240 , 180 )
	wait(2)
	tab( 240 , 180 )
	wait(2)
	playerGui.PAGES.QuestPage.Visible = false
	wait(2)
	playerGui.TopBar.HolderFrame.Visible = false
	wait(1)
	wait(1)
	local args = {
		[1] = "Auto Skip Wave",
		[2] = false
	}
	game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ChangeSetting"):FireServer(unpack(args))
	wait(2)
	------- The end  ClosePeopeoAndChat

	for i, v in pairs(game:GetService("StarterGui"):GetChildren()) do
		if v:IsA("ScreenGui") then
			v.Enabled = false
		end
	end


	for i, v in pairs(game:GetService("CoreGui"):GetChildren()) do
		if v:IsA("ScreenGui") then
			v.Enabled = false
		end
		if v.Name == "Codex" then
			game:GetService("CoreGui").Codex.gui.Enabled = false ------Tắt menu codex
			game:GetService("CoreGui").Codex.popups.Enabled = false ------Tắt menu code
		end
	end

	wait(1)

	-------The end ClosePeopeoAndChat

	wait(2)
	local tableGateStory = {
		{-182.67401123046875, 11.280637741088867, -281.1835632324219},
		{-216.95391845703125, 11.280628204345703, -317.7225646972656},
		{-211.7581329345703, 11.280643463134766, -252.09901428222656},
		{-244.71670532226562, 11.280635833740234, -289.96307373046875},
		{-239.5617218017578, 11.280637741088867, -224.29452514648438},
		{-275.15618896484375, 11.280635833740234, -259.5493469238281}
	}

	wait(2)
	function Hide4World ()
		local MatchPage = playerGui.PAGES.MatchPage
		local ScrollingFrame = MatchPage.WorldSelectFrame.ScrollingFrame -- có 8 cái _WorldHolder

		local tableWorld = {
		}
		for i, child in ipairs(ScrollingFrame:GetChildren()) do --GetDescendants | GetChildren
			print(child.Name, "--", child.ClassName)
			if child.ClassName == "Frame"  then
				table.insert(tableWorld,child)
				child.Visible = false
			end
		end
		tableWorld[7].Visible = true
	end

	wait(2)
	for i = 1,5 do

		while true do
			local indexGate = math.random(1,6)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(tableGateStory[indexGate][1], tableGateStory[indexGate][2], tableGateStory[indexGate][3])
			wait(5)
			if playerGui.PAGES.MatchPage.Visible == true then
				Hide4World()
				break	
			end
		end
		wait(2)
		local FriendsOnly = playerGui.PAGES.MatchPage.Frame.FriendsOnlyHolder.FriendsOnlyButton
		click(FriendsOnly)

		tab(246,143) wait(1)--chọn bản đồ 1
		tab(246,143) wait(1)--chọn bản đồ 1

		--tab( 416 , 116 ) wait(0.5)--Chương 1

		--tab( 416 , 151 ) wait(0.5)--Chương 2

		--tab( 416 , 186 ) wait(0.5)--Chương 3

		--tab( 416 , 221 ) wait(0.5)--Chương 4

		--tab( 416 , 256 ) wait(0.5)--Chương 5

		--tab( 416 , 291 ) wait(0.5)--Chương 6
		--- Ẩn Chapter 1

		for i, child in ipairs(playerGui.PAGES.MatchPage.Frame.Main.LeftSide.ScrollingFrame:GetChildren()) do
			print(child.Name, "--", child.ClassName)  -- In tên và loại phần tử

			if child.Name == "_ChapterTemplate" and child:FindFirstChild("ChapterButton") then
				local chapterButton = child:FindFirstChild("ChapterButton")
				if chapterButton:FindFirstChild("TextLabel") and chapterButton.TextLabel.Text == "Elemental" then
					child.Visible = false  -- Ẩn phần tử nếu điều kiện thỏa mãn
				end
			end
		end
		wait(2)


		--Click Inffineti
		tab( 416 , 326 ) wait(0.5)-- Chương Infineti 
		tab( 416 , 326 ) wait(0.5)-- Chương Infineti 
		tab( 416 , 326 ) wait(0.5)-- Chương Infineti  

		-----Click Inffineti 
		--[[
		for i, child in ipairs(playerGui.PAGES.MatchPage.Frame.Main.LeftSide.ScrollingFrame:GetChildren()) do --GetDescendants | GetChildren
			--print(child.Name,"--", child.ClassName, child.parent)
			if child.Name == "_ChapterTemplate" and child:FindFirstChild("ChapterButton")  then
				if child.ChapterButton.TextLabel.Text == "Infinite Mode" then
					click(child.ChapterButton.TextLabel)
					wait(1)
					click(child.ChapterButton)
					click(child.ChapterButton.TextLabel)
					wait(1)
					click(child.ChapterButton)
					click(child.ChapterButton.TextLabel)
					wait(1)
					click(child.ChapterButton)
					click(child.ChapterButton.TextLabel)
					wait(1)
					click(child.ChapterButton)
					click(child.ChapterButton.TextLabel)
					wait(1)
					click(child.ChapterButton)
					click(child.ChapterButton.TextLabel)
					wait(1)
					click(child.ChapterButton)
				end
			end
		end
		]]
		wait(3)
		click(playerGui.PAGES.MatchPage.Frame.OptionsHolder._ButtonHolder.ConfirmButton)
		wait(1)
		click(playerGui.PAGES.MatchPage.Frame.OptionsHolder._ButtonHolder.ConfirmButton)
		wait(1)
		click(playerGui.HUD.MatchDisplayHolder.MatchDisplayFrame.OptionsHolder.StartButtonHolder.ConfirmButton)
		wait(1)
		click(playerGui.HUD.MatchDisplayHolder.MatchDisplayFrame.OptionsHolder.StartButtonHolder.ConfirmButton)

		tab(483,391) wait(1)---tab confim
		tab(483,391) wait(1)---tab confim
		tab(736, 314)  wait(0.5)---tab Star
		tab(736, 314)  wait(0.5)---tab Star
		tab(736, 314)  wait(0.5)---tab Star
		tab(736, 314)  wait(0.5)---tab Star
		wait(30)
	end
	local TeleportService = game:GetService("TeleportService")
	local placeId = 17017769292
	TeleportService:Teleport(placeId, player)


end

if game.PlaceId == 17018663967 then
	local function click(a, offsetY)
		local x = a.AbsolutePosition.X + a.AbsoluteSize.X / 2
		local y = a.AbsolutePosition.Y + a.AbsoluteSize.Y / 2 + (offsetY or 0)
		-- Gửi sự kiện nhấn chuột
		game:GetService("VirtualInputManager"):SendMouseButtonEvent(x, y, 0, true, a, 1)
		game:GetService("VirtualInputManager"):SendMouseButtonEvent(x, y, 0, false, a, 1)
	end

	-- Thiết lập camera thành Scriptable để điều khiển bằng script
	camera.CameraType = Enum.CameraType.Scriptable
	-- Đặt vị trí và hướng của camera
	local cameraPosition = Vector3.new(-185.77420043945312, 80.580604553222656, -157.67546081542969) -- Vị trí của camera ở trên cao
	local lookAtPosition = Vector3.new(-185.77420043945312, 0, -157.67546081542969) -- Vị trí mà camera sẽ nhìn vào
	-- Tạo CFrame từ vị trí và hướng nhìn
	local cameraCFrame = CFrame.new(cameraPosition, lookAtPosition)
	-- Xoay camera 90 độ quanh trục Y (trục đứng)
	local rotation = CFrame.Angles(0, 0, 0) -- Xoay 90 độ quanh trục Y
	camera.CFrame = cameraCFrame * rotation


	local player = game.Players.LocalPlayer
	local camera = workspace.CurrentCamera
	local playerGui = player.PlayerGui
	local frame_MatchResult = playerGui.PAGES.MatchResultPage -- Frame
	local btnReplay = frame_MatchResult.Main.Options.ReplayButton
	local btnLobby = frame_MatchResult.Main.Options.BackToLobbyButton
	local btnPlace = playerGui.HUD.MobileButtonHolder.PlaceButton

	local tableUnit = {}
	for i, child in ipairs(playerGui.HUD.Toolbar.UnitBar.UnitHolder:GetChildren()) do --GetDescendants | GetChildren
		print(child.Name, child.ClassName)
		if child.Name == "UnitGridPrefab"  then
			table.insert(tableUnit,child.Button)
			--print(child)
		end
	end

	local UnitsInWS = #game.Workspace.Units:GetChildren()
	local btnUpgrade = playerGui.HUD.LocalUnitHolder.MainFrame.HolderButtons.UpgradeButton.TextLabel




	function SpawmTroop (i,x,y)
		while true do
			camera.CFrame = cameraCFrame * rotation
			wait(1)
			click(tableUnit[i], 60)
			wait(1)
			tab( x , y )
			wait(1)
			presskey(119)
			presskey(115)
			wait(1)
			presskey(101)
			tab( x , y )
			wait(1)
			if #game.Workspace.Units:GetChildren() > UnitsInWS then
				UnitsInWS = #game.Workspace.Units:GetChildren()
				break
			end
		end
	end



	function ugradeUnit(x,y)
		camera.CFrame = cameraCFrame * rotation
		wait(0.5)
		wait(1)
		tab( x , y )
		wait(1)
		click(btnUpgrade, 20)
		wait(1)
		tab( x , y )
		wait(1)
		click(btnUpgrade, 40)
		wait(1)
		tab( x , y )
		wait(1)
		click(btnUpgrade, 60)
		wait(1)
	end

	spawn(function()
		pcall(function()
			while true do wait(5)
				if playerGui.PAGES.MatchResultPage.Visible == true  then
					tab( 476.79998779296875 , 280.3999938964844 ) --- Tab back bảng Oop
					wait(2)
					tab( 476.79998779296875 , 298.3999938964844 ) --- Tab back bảng Oop
					wait(2)
					click(btnLobby)
					wait(1)
					local TeleportService = game:GetService("TeleportService")
					local placeId = 17017769292
					TeleportService:Teleport(placeId, player)
				end
			end
		end)
	end)

	local wave = playerGui.WaveTopBar.Wave.WaveFrame.TextLabel.Text


	spawn(function()
		pcall(function()
			while true do
				wait(300)
				if wave == playerGui.WaveTopBar.Wave.WaveFrame.TextLabel.Text then
					-- về loppy
					local TeleportService = game:GetService("TeleportService")
					local placeId = 17017769292
					TeleportService:Teleport(placeId, player)
				end
				wave = playerGui.WaveTopBar.Wave.WaveFrame.TextLabel.Text
			end
		end)
	end)
	local wavenumber = playerGui.HUD.WaveNumberNotification.WaveNumberText.Text
	spawn(function()
		pcall(function()
			while true do
				wait(5)
				if wavenumber == "Wave 47 Started" then
					---- Rejoin
					local TeleportService = game:GetService("TeleportService")
					local placeId = 17017769292
					TeleportService:Teleport(placeId, player)
				end
				wavenumber = playerGui.HUD.WaveNumberNotification.WaveNumberText.Text
			end
		end)
	end)

	local startTime = tick()
	spawn(function()
		pcall(function()
			while true do wait(30)
				if tick() - startTime  > 60  then
					if UnitsInWS == 0 then
						local TeleportService = game:GetService("TeleportService")
						local placeId = 17017769292
						TeleportService:Teleport(placeId, player)
					end

					break
				end
			end
		end)
	end)
	spawn(function()
		pcall(function()
			while true do
				wait(30) 				
				if playerGui.TopBar.HolderFrame.Visible == true  then
					wait(2)
					playerGui.TopBar.HolderFrame.Visible = false

				end
			end
		end)
	end)
	playerGui.TopBar.HolderFrame.Visible = false
	wait(1)
	wait(1)
	local args = {
		[1] = "Auto Skip Wave",
		[2] = true
	}
	game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ChangeSetting"):FireServer(unpack(args))
	wait(2)

	------Spam 1 Aether Knight
	wait(2)
	SpawmTroop(5, 368 , 130 )

	playerGui.TopBar.HolderFrame.Visible = true
	wait(2)
	tab(822.4 , -18.4)-- tab x2 speed
	wait(4)
	tab(822.4 , -18.4)-- tab x2 speed
	playerGui.TopBar.HolderFrame.Visible = false
	wait(1)
	------- ClosePeopeoAndChat

	for i, v in pairs(game:GetService("StarterGui"):GetChildren()) do
		if v:IsA("ScreenGui") then
			v.Enabled = false
		end
	end


	for i, v in pairs(game:GetService("CoreGui"):GetChildren()) do
		if v:IsA("ScreenGui") then
			v.Enabled = false
		end
		if v.Name == "Codex" then
			game:GetService("CoreGui").Codex.gui.Enabled = false ------Tắt menu codex
			game:GetService("CoreGui").Codex.popups.Enabled = false ------Tắt menu code
		end
	end
	game.Workspace.DescendantAdded:Connect(function(v)
		pcall(function()
			if v:IsA("BasePart") and not v:IsA("MeshPart") then
				v.Material = "Plastic"
				v.Reflectance = 0
				v.Transparency = 1
			elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
				v.Transparency = 1
			elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
				v.Lifetime = NumberRange.new(0)
			elseif v:IsA("Explosion") then
				v.BlastPressure = 1
				v.BlastRadius = 1
			elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
				v.Enabled = false
			elseif v:IsA("MeshPart") and decalsyeeted then
				v.Material = "Plastic"
				v.Reflectance = 0
				v.TextureID = 0
				v.Transparency = 1
			elseif v:IsA("SpecialMesh") and decalsyeeted then
				v.TextureId=0
			elseif v:IsA("ShirtGraphic") and decalsyeeted then
				v.ShirtGraphic=1
			elseif (v:IsA("Shirt") or v:IsA("Pants")) and decalsyeeted then
				v[v.ClassName.."Template"]=1
			end
		end)
	end)
	-------  The end ClosePeopeoAndChat


	------Spam 4 Aether Knight
	wait(2)
	SpawmTroop(5, 368 , 160 )
	wait(2)
	SpawmTroop(5, 368 , 190 )
	wait(2)
	SpawmTroop(5, 368 , 220 )
	wait(2)
	SpawmTroop(5, 368 , 250 )
	wait(2)

	------Spam 4 Jadefire Knight
	SpawmTroop(6, 438 , 160 )
	wait(2)
	SpawmTroop(6, 438 , 190 )
	wait(2)
	SpawmTroop(6, 438 , 220 )
	wait(2)
	SpawmTroop(6, 438 , 250 )
	wait(2)
	--game:GetService("RunService"):Set3dRenderingEnabled(false)--- Tắt 3D
	wait(2)
	playerGui.HUD.UnitList.Visible = false--- Ân các Unit đã đặt xuống
	playerGui.HUD.LocalUnitHolder.MainFrame.HolderTop.Visible = false ---- Ẩn bảng chỉ số update Unit
	playerGui.HUD.LocalUnitHolder.MainFrame.ViewportFrame.Visible = false -- Ẩn hình ảnh Unit của bảng Update
	playerGui.HUD.Toolbar.Visible = false --- Ẩn hàng ngang 6 ô Unit 
	wait(60)
	------- Update Aether Knight
	tab(368 , 130)------Tab hiện bảng update
	wait(1)
	for i =1 ,15 do
		wait(4)

		if btnUpgrade.Text == "3,000" then
			break
		else
			ugradeUnit( 368 , 130 )
		end
	end
	tab(368 , 160)------Tab hiện bảng update
	wait(1)
	for i =1 ,15 do
		wait(4)

		if btnUpgrade.Text == "3,000" then
			break
		else
			ugradeUnit( 368 , 160 )
		end
	end
	tab(368 , 190)------Tab hiện bảng update
	wait(1)
	for i =1 ,15 do
		wait(4)

		if btnUpgrade.Text == "3,000" then
			break
		else
			ugradeUnit( 368 , 190 )
		end
	end
	tab(368 , 220)------Tab hiện bảng update
	wait(1)
	for i =1 ,15 do
		wait(4)

		if btnUpgrade.Text == "3,000" then
			break
		else
			ugradeUnit( 368 , 220 )
		end
	end
	tab(368 , 250)------Tab hiện bảng update
	wait(1)
	for i =1 ,15 do
		wait(4)

		if btnUpgrade.Text == "3,000" then
			break
		else
			ugradeUnit( 368 , 250 )
		end
	end

	------- Update Jadefire Knight
	for i =1 ,4 do
		wait(7)
		ugradeUnit( 438 , 160 )
		wait(7)
		ugradeUnit( 438 , 190 )
		wait(7)
		ugradeUnit( 438 , 220 )
		wait(7)
		ugradeUnit( 438 , 250 )
	end
	wait(1)

	tab(438 , 160)------Tab hiện bảng update
	wait(1)
	for i =1 ,15 do
		wait(4)

		if btnUpgrade.Text == "5,500" then
			break
		else
			ugradeUnit( 438 , 160 )
		end
	end
	tab(438 , 190)------Tab hiện bảng update
	wait(1)
	for i =1 ,15 do
		wait(4)

		if btnUpgrade.Text == "5,500" then
			break
		else
			ugradeUnit( 438 , 190 )
		end
	end
	tab(438 , 220)------Tab hiện bảng update
	wait(1)
	for i =1 ,15 do
		wait(4)

		if btnUpgrade.Text == "5,500" then
			break
		else
			ugradeUnit( 438 , 220 )
		end
	end
	tab(438 , 250)------Tab hiện bảng update
	wait(1)
	for i =1 ,15 do
		wait(4)

		if btnUpgrade.Text == "5,500" then
			break
		else
			ugradeUnit( 438 , 250 )
		end
	end

	tab(438 , 250)------Tab hiện bảng update
	wait(1)
	for i =1 ,15 do
		wait(4)

		if btnUpgrade.Text == "9,500" then
			break
		else
			ugradeUnit( 438 , 250 )
		end
	end
	tab(438 , 220)------Tab hiện bảng update
	wait(1)
	for i =1 ,15 do
		wait(4)

		if btnUpgrade.Text == "9,500" then
			break
		else
			ugradeUnit( 438 , 220 )
		end
	end
	tab(438 , 160)------Tab hiện bảng update
	wait(1)
	for i =1 ,15 do
		wait(4)

		if btnUpgrade.Text == "9,500" then
			break
		else
			ugradeUnit( 438 , 160 )
		end
	end
	tab(438 , 190)------Tab hiện bảng update
	wait(1)
	for i =1 ,15 do
		wait(4)

		if btnUpgrade.Text == "9,500" then
			break
		else
			ugradeUnit( 438 , 190 )
		end
	end
	------- Update Aether Knight
	tab(368 , 130)------Tab hiện bảng update
	wait(1)
	for i =1 ,25 do
		wait(4)

		if btnUpgrade.Text == "6,000" then
			break
		else
			ugradeUnit( 368 , 130 )
		end
	end
	tab(368 , 160)------Tab hiện bảng update
	wait(1)
	for i =1 ,25 do
		wait(4)

		if btnUpgrade.Text == "6,000" then
			break
		else
			ugradeUnit( 368 , 160 )
		end
	end
	tab(368 , 190)------Tab hiện bảng update
	wait(1)
	for i =1 ,25 do
		wait(4)

		if btnUpgrade.Text == "6,000" then
			break
		else
			ugradeUnit( 368 , 190 )
		end
	end
	tab(438 , 160)------Tab hiện bảng update
	wait(1)
	for i =1 ,25 do
		wait(4)

		if btnUpgrade.Text == "6,000" then
			break
		else
			ugradeUnit( 368 , 220 )
		end
	end
	tab(368 , 250)------Tab hiện bảng update
	wait(1)
	for i =1 ,25 do
		wait(4)

		if btnUpgrade.Text == "6,000" then
			break
		else
			ugradeUnit( 368 , 250 )
		end
	end



	for i =1 ,50 do
		wait(5)
		ugradeUnit( 438 , 160 )
		wait(5)
		ugradeUnit( 438 , 190 )
		wait(5)
		ugradeUnit( 438 , 220 )
		wait(5)
		ugradeUnit( 438 , 250 )

		wait(5)
		ugradeUnit( 368 , 130 )
		wait(5)
		ugradeUnit( 368 , 160 )
		wait(5)
		ugradeUnit( 368 , 190 )
		wait(5)
		ugradeUnit( 368 , 220 )
		wait(5)
		ugradeUnit( 368 , 250 )
	end

end
