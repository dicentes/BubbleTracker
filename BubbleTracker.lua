-- Create a frame for the bubble count display
local bubbleFrame = CreateFrame("Frame", nil, UIParent)
bubbleFrame:SetSize(100, 40)
bubbleFrame:SetPoint("CENTER", 0, 0)
bubbleFrame:SetMovable(true)
bubbleFrame:EnableMouse(true)
bubbleFrame:RegisterForDrag("LeftButton")
bubbleFrame:SetScript("OnDragStart", bubbleFrame.StartMoving)
bubbleFrame:SetScript("OnDragStop", bubbleFrame.StopMovingOrSizing)

-- Create a text object to display the bubble count
local bubbleText = bubbleFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
bubbleText:SetAllPoints()
bubbleText:SetText("0/20")

-- Update the bubble count
local function UpdateBubbleCount()
  local playerXP = UnitXP("player")
  local playerMaxXP = UnitXPMax("player")
  local remainingXP = playerMaxXP - playerXP
  local totalBubbles = math.ceil(remainingXP / (playerMaxXP / 20))
  bubbleText:SetText(totalBubbles .. "/20 remaining.")
end

-- Register for the event and update the bubble count on PLAYER_XP_UPDATE
local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_XP_UPDATE")
frame:SetScript("OnEvent", UpdateBubbleCount)
