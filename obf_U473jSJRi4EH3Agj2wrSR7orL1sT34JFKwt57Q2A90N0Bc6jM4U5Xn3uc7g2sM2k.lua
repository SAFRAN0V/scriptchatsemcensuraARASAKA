local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SoundService = game:GetService("SoundService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local player = Players.LocalPlayer
local targetGui = (pcall(function() return gethui() end) and gethui()) or (pcall(function() return CoreGui end) and CoreGui) or player:WaitForChild("PlayerGui")
local uiName = "ArasakaChat_Gui"
if targetGui:FindFirstChild(uiName) then
targetGui[uiName]:Destroy()
end
local clickSound = Instance.new("Sound", SoundService)
clickSound.SoundId = "rbxassetid://4499400560"
clickSound.Volume = 0.6
clickSound.Name = "ButtonClickSound"
local function playClickSound()
pcall(function() clickSound:Play() end)
end
local WebSocket = WebSocket or syn and syn.websocket or Krnl and Krnl.WebSocket
if not WebSocket then
warn("Seu executor não suporta WebSocket!")
return
end
local successWs, ws = pcall(function()
return WebSocket.connect("wss://chatprivado-cwu3.onrender.com")
end)
if not successWs or not ws then
warn("Falha ao conectar no servidor WebSocket.")
return
end
local userId = player.UserId
local successThumb, thumbUrl = pcall(function()
return Players:GetUserThumbnailAsync(userId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
end)
if not successThumb then thumbUrl = "" end
local screenGui = Instance.new("ScreenGui", targetGui)
screenGui.Name = uiName
screenGui.ResetOnSpawn = false
local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 320, 0, (275 - 35))
frame.Position = UDim2.new(0.5, -(80 + 80), 0.5, -120)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.ClipsDescendants = true
local uiCornerMain = Instance.new("UICorner", frame)
uiCornerMain.CornerRadius = UDim.new(0, 10)
local uiStrokeMain = Instance.new("UIStroke", frame)
uiStrokeMain.Color = Color3.fromRGB(215, (25 + 25), (200 / 4))
uiStrokeMain.Thickness = 1.8
local titleBar = Instance.new("Frame", frame)
titleBar.Size = UDim2.new(1, 0, 0, (117 - 79))
titleBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
titleBar.BorderSizePixel = 0
local uiCornerTitle = Instance.new("UICorner", titleBar)
uiCornerTitle.CornerRadius = UDim.new(0, (27 - 17))
local decalImage = Instance.new("ImageLabel", titleBar)
decalImage.Size = UDim2.new(0, (91 - 67), 0, (96 / 4))
decalImage.Position = UDim2.new(0, 8, 0.5, -(36 / 3))
decalImage.BackgroundTransparency = 1
decalImage.Image = "rbxassetid://(66198612481334 + 66198612481334)"
local titleText = Instance.new("TextLabel", titleBar)
titleText.Size = UDim2.new(1, 0, 1, 0)
titleText.BackgroundTransparency = 1
titleText.Text = "ARASAKA CHAT"
titleText.TextColor3 = Color3.fromRGB(215, (25 + 25), 50)
titleText.Font = Enum.Font.GothamBold
titleText.TextSize = 14
local btnMinimizar = Instance.new("TextButton", titleBar)
btnMinimizar.Size = UDim2.new(0, 30, 0, (15 + 15))
btnMinimizar.Position = UDim2.new(1, -34, 0.5, -(45 / 3))
btnMinimizar.BackgroundColor3 = Color3.fromRGB(15, 15, (45 / 3))
btnMinimizar.Text = "-"
btnMinimizar.TextColor3 = Color3.fromRGB(215, (100 / 2), (133 - 83))
btnMinimizar.Font = Enum.Font.GothamBold
btnMinimizar.TextSize = 16
btnMinimizar.BorderSizePixel = 0
btnMinimizar.ZIndex = 2
local uiCornerMin = Instance.new("UICorner", btnMinimizar)
uiCornerMin.CornerRadius = UDim.new(0, 6)
local container = Instance.new("Frame", frame)
container.Size = UDim2.new(1, 0, 1, -38)
container.Position = UDim2.new(0, 0, 0, (89 - 51))
container.BackgroundTransparency = 1
local scrollingFrame = Instance.new("ScrollingFrame", container)
scrollingFrame.BackgroundTransparency = 1
scrollingFrame.Position = UDim2.new(0, 8, 0, (4 + 4))
scrollingFrame.Size = UDim2.new(0, 304, 0, (276 / 2))
scrollingFrame.CanvasSize = UDim2.new(0, 0, 2, 0)
scrollingFrame.ScrollBarThickness = 4
local uiListLayout = Instance.new("UIListLayout", scrollingFrame)
uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout.Padding = UDim.new(0, 6)
local textBox = Instance.new("TextBox", container)
textBox.BackgroundColor3 = Color3.fromRGB((7 + 8), (7 + 8), (7 + 8))
textBox.Position = UDim2.new(0, (23 - 15), 0, (77 + 77))
textBox.Size = UDim2.new(0, (110 + 110), 0, 32)
textBox.Font = Enum.Font.Gotham
textBox.PlaceholderText = "Digite sua mensagem..."
textBox.Text = ""
textBox.TextColor3 = Color3.fromRGB(255, (278 - 23), 255)
textBox.TextSize = (57 - 44)
local uiStrokeBox = Instance.new("UIStroke", textBox)
uiStrokeBox.Color = Color3.fromRGB(50, 50, (200 / 4))
uiStrokeBox.Thickness = 1
local uiCornerBox = Instance.new("UICorner", textBox)
uiCornerBox.CornerRadius = UDim.new(0, 6)
local textButton = Instance.new("TextButton", container)
textButton.BackgroundColor3 = Color3.fromRGB((232 - 17), (100 / 2), 50)
textButton.Position = UDim2.new(0, (702 / 3), 0, (462 / 3))
textButton.Size = UDim2.new(0, 78, 0, (16 + 16))
textButton.Font = Enum.Font.GothamBold
textButton.Text = "ENVIAR"
textButton.TextColor3 = Color3.fromRGB(255, 255, 255)
textButton.TextSize = (6 + 6)
textButton.BorderSizePixel = 0
local uiCornerBtn = Instance.new("UICorner", textButton)
uiCornerBtn.CornerRadius = UDim.new(0, (70 - 64))
local minimizado = false
btnMinimizar.MouseButton1Click:Connect(function()
playClickSound()
minimizado = not minimizado
container.Visible = not minimizado
local targetSize = minimizado and UDim2.new(0, (362 - 42), 0, (19 + 19)) or UDim2.new(0, 320, 0, (120 + 120))
btnMinimizar.Text = minimizado and "+" or "-"
TweenService:Create(frame, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = targetSize}):Play()
end)
local function adicionarMensagem(autor, texto, avatar)
local msgContainer = Instance.new("Frame", scrollingFrame)
msgContainer.BackgroundTransparency = 1
msgContainer.Size = UDim2.new(1, 0, 0, (64 / 2))
local imageIcon = Instance.new("ImageLabel", msgContainer)
imageIcon.BackgroundTransparency = 1
imageIcon.Size = UDim2.new(0, 28, 0, 28)
imageIcon.Image = avatar or ""
local uiCornerImg = Instance.new("UICorner", imageIcon)
uiCornerImg.CornerRadius = UDim.new(1, 0)
local msgLabel = Instance.new("TextLabel", msgContainer)
msgLabel.BackgroundTransparency = 1
msgLabel.Position = UDim2.new(0, (48 - 14), 0, 0)
msgLabel.Size = UDim2.new(1, -34, 1, 0)
msgLabel.Font = Enum.Font.Gotham
msgLabel.Text = '<font color="#d73232"><b>' .. autor .. ':</b></font> ' .. texto
msgLabel.RichText = true
msgLabel.TextColor3 = Color3.fromRGB(220, (660 / 3), 220)
msgLabel.TextSize = 12
msgLabel.TextXAlignment = Enum.TextXAlignment.Left
msgLabel.TextYAlignment = Enum.TextYAlignment.Center
msgLabel.TextWrapped = true
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, uiListLayout.AbsoluteContentSize.Y + (10 + 10))
end
ws.OnMessage:Connect(function(rawMsg)
pcall(function()
local split = string.split(rawMsg, "||")
if #split >= 3 then
adicionarMensagem(split[1], split[3], split[2])
end
end)
end)
local function enviar()
if textBox.Text ~= "" then
playClickSound()
local payload = player.Name .. "||" .. thumbUrl .. "||" .. textBox.Text
ws:Send(payload)
textBox.Text = ""
end
end
textButton.MouseButton1Click:Connect(enviar)
textBox.FocusLost:Connect(function(enterPressed)
if enterPressed then enviar() end
end)
