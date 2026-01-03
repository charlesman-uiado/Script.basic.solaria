-- Serviços necessários
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- Configurações
local PLAYER = Players.LocalPlayer
local GUI_SETTINGS = {
    MainColor = Color3.fromRGB(25, 25, 30),
    SecondaryColor = Color3.fromRGB(35, 35, 45),
    AccentColor = Color3.fromRGB(0, 170, 255),
    TextColor = Color3.fromRGB(240, 240, 240),
    BorderColor = Color3.fromRGB(60, 60, 70)
}

-- Criar a interface
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ScriptExecutorUI"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = PLAYER:WaitForChild("PlayerGui")

-- Frame principal
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 400, 0, 500)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = GUI_SETTINGS.MainColor
MainFrame.BackgroundTransparency = 0.1
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

-- Efeito de borda
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = GUI_SETTINGS.BorderColor
UIStroke.Thickness = 2
UIStroke.Parent = MainFrame

-- Efeito de brilho
local Glow = Instance.new("ImageLabel")
Glow.Name = "Glow"
Glow.Size = UDim2.new(1, 40, 1, 40)
Glow.Position = UDim2.new(0, -20, 0, -20)
Glow.BackgroundTransparency = 1
Glow.Image = "rbxassetid://8992231221"
Glow.ImageColor3 = GUI_SETTINGS.AccentColor
Glow.ImageTransparency = 0.8
Glow.ScaleType = Enum.ScaleType.Slice
Glow.SliceCenter = Rect.new(100, 100, 100, 100)
Glow.Parent = MainFrame

-- Barra superior
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0, 40)
TopBar.BackgroundColor3 = GUI_SETTINGS.SecondaryColor
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local TopBarCorner = Instance.new("UICorner")
TopBarCorner.CornerRadius = UDim.new(0, 12)
TopBarCorner.Parent = TopBar

-- Botão fechar
local CloseButton = Instance.new("ImageButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -35, 0.5, -15)
CloseButton.AnchorPoint = Vector2.new(0, 0.5)
CloseButton.BackgroundTransparency = 1
CloseButton.Image = "rbxassetid://3926305904"
CloseButton.ImageRectOffset = Vector2.new(284, 4)
CloseButton.ImageRectSize = Vector2.new(24, 24)
CloseButton.ImageColor3 = Color3.fromRGB(200, 200, 200)
CloseButton.Parent = TopBar

CloseButton.MouseEnter:Connect(function()
    TweenService:Create(CloseButton, TweenInfo.new(0.2), {ImageColor3 = Color3.fromRGB(255, 100, 100)}):Play()
end)

CloseButton.MouseLeave:Connect(function()
    TweenService:Create(CloseButton, TweenInfo.new(0.2), {ImageColor3 = Color3.fromRGB(200, 200, 200)}):Play()
end)

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Título
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(0, 200, 0, 30)
Title.Position = UDim2.new(0, 15, 0.5, -15)
Title.AnchorPoint = Vector2.new(0, 0.5)
Title.BackgroundTransparency = 1
Title.Text = "EXECUTOR PREMIUM"
Title.TextColor3 = GUI_SETTINGS.TextColor
Title.TextSize = 18
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TopBar

-- Ícone do título
local TitleIcon = Instance.new("ImageLabel")
TitleIcon.Name = "TitleIcon"
TitleIcon.Size = UDim2.new(0, 20, 0, 20)
TitleIcon.Position = UDim2.new(1, 5, 0.5, -10)
TitleIcon.AnchorPoint = Vector2.new(1, 0.5)
TitleIcon.BackgroundTransparency = 1
TitleIcon.Image = "rbxassetid://3926305904"
TitleIcon.ImageRectOffset = Vector2.new(964, 324)
TitleIcon.ImageRectSize = Vector2.new(36, 36)
TitleIcon.ImageColor3 = GUI_SETTINGS.AccentColor
TitleIcon.Parent = Title

-- Container de informações do usuário
local UserInfoFrame = Instance.new("Frame")
UserInfoFrame.Name = "UserInfoFrame"
UserInfoFrame.Size = UDim2.new(1, -30, 0, 100)
UserInfoFrame.Position = UDim2.new(0, 15, 0, 55)
UserInfoFrame.BackgroundColor3 = GUI_SETTINGS.SecondaryColor
UserInfoFrame.BackgroundTransparency = 0.2
UserInfoFrame.BorderSizePixel = 0
UserInfoFrame.Parent = MainFrame

local UserInfoCorner = Instance.new("UICorner")
UserInfoCorner.CornerRadius = UDim.new(0, 8)
UserInfoCorner.Parent = UserInfoFrame

-- Avatar do usuário
local Avatar = Instance.new("ImageLabel")
Avatar.Name = "Avatar"
Avatar.Size = UDim2.new(0, 60, 0, 60)
Avatar.Position = UDim2.new(0, 15, 0.5, -30)
Avatar.AnchorPoint = Vector2.new(0, 0.5)
Avatar.BackgroundColor3 = GUI_SETTINGS.MainColor
Avatar.BorderSizePixel = 0
Avatar.Image = PLAYER:GetFriendThumbnailAsync(
    Enum.ThumbnailType.HeadShot,
    Enum.ThumbnailSize.Size420x420
)
Avatar.Parent = UserInfoFrame

local AvatarCorner = Instance.new("UICorner")
AvatarCorner.CornerRadius = UDim.new(0, 8)
AvatarCorner.Parent = Avatar

-- Nome do usuário
local Username = Instance.new("TextLabel")
Username.Name = "Username"
Username.Size = UDim2.new(0, 250, 0, 25)
Username.Position = UDim2.new(0, 85, 0, 20)
Username.BackgroundTransparency = 1
Username.Text = "@" .. PLAYER.Name
Username.TextColor3 = GUI_SETTINGS.TextColor
Username.TextSize = 16
Username.Font = Enum.Font.GothamBold
Username.TextXAlignment = Enum.TextXAlignment.Left
Username.Parent = UserInfoFrame

-- DisplayName do usuário
local DisplayName = Instance.new("TextLabel")
DisplayName.Name = "DisplayName"
DisplayName.Size = UDim2.new(0, 250, 0, 20)
DisplayName.Position = UDim2.new(0, 85, 0, 45)
DisplayName.BackgroundTransparency = 1
DisplayName.Text = PLAYER.DisplayName
DisplayName.TextColor3 = Color3.fromRGB(180, 180, 180)
DisplayName.TextSize = 14
DisplayName.Font = Enum.Font.Gotham
DisplayName.TextXAlignment = Enum.TextXAlignment.Left
DisplayName.Parent = UserInfoFrame

-- Container de status
local StatusFrame = Instance.new("Frame")
StatusFrame.Name = "StatusFrame"
StatusFrame.Size = UDim2.new(1, -30, 0, 80)
StatusFrame.Position = UDim2.new(0, 15, 0, 170)
StatusFrame.BackgroundColor3 = GUI_SETTINGS.SecondaryColor
StatusFrame.BackgroundTransparency = 0.2
StatusFrame.BorderSizePixel = 0
StatusFrame.Parent = MainFrame

local StatusCorner = Instance.new("UICorner")
StatusCorner.CornerRadius = UDim.new(0, 8)
StatusCorner.Parent = StatusFrame

-- Título do status
local StatusTitle = Instance.new("TextLabel")
StatusTitle.Name = "StatusTitle"
StatusTitle.Size = UDim2.new(1, 0, 0, 25)
StatusTitle.Position = UDim2.new(0, 0, 0, 5)
StatusTitle.BackgroundTransparency = 1
StatusTitle.Text = "STATUS DO SERVIDOR"
StatusTitle.TextColor3 = GUI_SETTINGS.AccentColor
StatusTitle.TextSize = 14
StatusTitle.Font = Enum.Font.GothamBold
StatusTitle.Parent = StatusFrame

-- Tempo no servidor
local ServerTime = Instance.new("TextLabel")
ServerTime.Name = "ServerTime"
ServerTime.Size = UDim2.new(0.5, -10, 0, 25)
ServerTime.Position = UDim2.new(0, 10, 0, 35)
ServerTime.BackgroundTransparency = 1
ServerTime.Text = "Tempo: 00:00"
ServerTime.TextColor3 = GUI_SETTINGS.TextColor
ServerTime.TextSize = 14
ServerTime.Font = Enum.Font.Gotham
ServerTime.TextXAlignment = Enum.TextXAlignment.Left
ServerTime.Parent = StatusFrame

-- FPS
local FPS = Instance.new("TextLabel")
FPS.Name = "FPS"
FPS.Size = UDim2.new(0.5, -10, 0, 25)
FPS.Position = UDim2.new(0.5, 0, 0, 35)
FPS.BackgroundTransparency = 1
FPS.Text = "FPS: 60"
FPS.TextColor3 = GUI_SETTINGS.TextColor
FPS.TextSize = 14
FPS.Font = Enum.Font.Gotham
FPS.TextXAlignment = Enum.TextXAlignment.Left
FPS.Parent = StatusFrame

-- Container do script
local ScriptFrame = Instance.new("Frame")
ScriptFrame.Name = "ScriptFrame"
ScriptFrame.Size = UDim2.new(1, -30, 0, 200)
ScriptFrame.Position = UDim2.new(0, 15, 0, 265)
ScriptFrame.BackgroundColor3 = GUI_SETTINGS.SecondaryColor
ScriptFrame.BackgroundTransparency = 0.2
ScriptFrame.BorderSizePixel = 0
ScriptFrame.Parent = MainFrame

local ScriptCorner = Instance.new("UICorner")
ScriptCorner.CornerRadius = UDim.new(0, 8)
ScriptCorner.Parent = ScriptFrame

-- Título do script
local ScriptTitle = Instance.new("TextLabel")
ScriptTitle.Name = "ScriptTitle"
ScriptTitle.Size = UDim2.new(1, 0, 0, 25)
ScriptTitle.Position = UDim2.new(0, 0, 0, 5)
ScriptTitle.BackgroundTransparency = 1
ScriptTitle.Text = "EXECUTOR DE SCRIPT"
ScriptTitle.TextColor3 = GUI_SETTINGS.AccentColor
ScriptTitle.TextSize = 14
ScriptTitle.Font = Enum.Font.GothamBold
ScriptTitle.Parent = ScriptFrame

-- Caixa de texto do script
local ScriptBox = Instance.new("TextBox")
ScriptBox.Name = "ScriptBox"
ScriptBox.Size = UDim2.new(1, -20, 1, -40)
ScriptBox.Position = UDim2.new(0, 10, 0, 35)
ScriptBox.BackgroundColor3 = GUI_SETTINGS.MainColor
ScriptBox.BackgroundTransparency = 0.3
ScriptBox.TextColor3 = GUI_SETTINGS.TextColor
ScriptBox.TextSize = 12
ScriptBox.Font = Enum.Font.RobotoMono
ScriptBox.Text = "-- Cole seu script aqui\nprint('Hello, World!')"
ScriptBox.TextXAlignment = Enum.TextXAlignment.Left
ScriptBox.TextYAlignment = Enum.TextYAlignment.Top
ScriptBox.ClearTextOnFocus = false
ScriptBox.MultiLine = true
ScriptBox.Parent = ScriptFrame

local ScriptBoxCorner = Instance.new("UICorner")
ScriptBoxCorner.CornerRadius = UDim.new(0, 6)
ScriptBoxCorner.Parent = ScriptBox

-- Botões
local ExecuteButton = Instance.new("TextButton")
ExecuteButton.Name = "ExecuteButton"
ExecuteButton.Size = UDim2.new(0.5, -20, 0, 40)
ExecuteButton.Position = UDim2.new(0, 15, 1, -55)
ExecuteButton.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
ExecuteButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecuteButton.Text = "EXECUTAR"
ExecuteButton.TextSize = 14
ExecuteButton.Font = Enum.Font.GothamBold
ExecuteButton.Parent = MainFrame

local ExecuteButtonCorner = Instance.new("UICorner")
ExecuteButtonCorner.CornerRadius = UDim.new(0, 8)
ExecuteButtonCorner.Parent = ExecuteButton

local ClearButton = Instance.new("TextButton")
ClearButton.Name = "ClearButton"
ClearButton.Size = UDim2.new(0.5, -20, 0, 40)
ClearButton.Position = UDim2.new(0.5, 5, 1, -55)
ClearButton.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
ClearButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ClearButton.Text = "LIMPAR"
ClearButton.TextSize = 14
ClearButton.Font = Enum.Font.GothamBold
ClearButton.Parent = MainFrame

local ClearButtonCorner = Instance.new("UICorner")
ClearButtonCorner.CornerRadius = UDim.new(0, 8)
ClearButtonCorner.Parent = ClearButton

-- Efeitos de hover nos botões
local function setupButtonHover(button, defaultColor, hoverColor)
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = hoverColor}):Play()
    end)
    
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = defaultColor}):Play()
    end)
end

setupButtonHover(ExecuteButton, Color3.fromRGB(0, 180, 0), Color3.fromRGB(0, 220, 0))
setupButtonHover(ClearButton, Color3.fromRGB(180, 0, 0), Color3.fromRGB(220, 0, 0))

-- Função para executar script
ExecuteButton.MouseButton1Click:Connect(function()
    local scriptText = ScriptBox.Text
    local success, error = pcall(function()
        loadstring(scriptText)()
    end)
    
    if not success then
        warn("Erro ao executar script:", error)
    end
end)

-- Função para limpar script
ClearButton.MouseButton1Click:Connect(function()
    ScriptBox.Text = ""
end)

-- Variáveis para cálculo de FPS e tempo
local startTime = tick()
local frameCount = 0
local fps = 60
local lastUpdate = tick()

-- Função para atualizar informações
local function updateInfo()
    -- Atualizar tempo no servidor
    local elapsed = tick() - startTime
    local minutes = math.floor(elapsed / 60)
    local seconds = math.floor(elapsed % 60)
    ServerTime.Text = string.format("Tempo: %02d:%02d", minutes, seconds)
    
    -- Atualizar FPS
    frameCount = frameCount + 1
    if tick() - lastUpdate >= 1 then
        fps = math.floor(frameCount / (tick() - lastUpdate))
        frameCount = 0
        lastUpdate = tick()
        FPS.Text = string.format("FPS: %d", fps)
    end
    
    -- Efeito de pulso no glow
    local pulse = math.sin(tick() * 3) * 0.1 + 0.7
    Glow.ImageTransparency = pulse
end

-- Conectar ao Heartbeat para atualizações
RunService.Heartbeat:Connect(updateInfo)

-- Sistema de arrastar
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

TopBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- Animação de entrada
MainFrame.Position = UDim2.new(0.5, -200, 0.3, -250)
MainFrame.BackgroundTransparency = 1
Glow.ImageTransparency = 1

local entranceTween = TweenService:Create(MainFrame, TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Position = UDim2.new(0.5, -200, 0.5, -250),
    BackgroundTransparency = 0.1
})

local glowTween = TweenService:Create(Glow, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    ImageTransparency = 0.7
})

entranceTween:Play()
glowTween:Play()

-- Efeito de sombra
local Shadow = Instance.new("ImageLabel")
Shadow.Name = "Shadow"
Shadow.Size = UDim2.new(1, 40, 1, 40)
Shadow.Position = UDim2.new(0, -20, 0, -20)
Shadow.BackgroundTransparency = 1
Shadow.Image = "rbxassetid://5554236805"
Shadow.ImageTransparency = 0.8
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(23, 23, 277, 277)
Shadow.ZIndex = -1
Shadow.Parent = MainFrame

print("Interface do Executor carregada com sucesso!")
