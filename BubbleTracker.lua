local EventFrame = CreateFrame("frame", "EventFrame")
EventFrame:RegisterEvent("PLAYER_XP_UPDATE")

local currentBubbleCount = math.ceil((UnitXPMax("player") - UnitXP("player")) / (UnitXP("player") / 20))

--RUN A TEST TO SEE IF LOGGING OUT IS SUFFICIENT OR IF YOU NEED TO EXIT THE CLIENT EACH TIME

EventFrame:SetScript("OnEvent", function(self, event, ...)
  if event == "PLAYER_XP_UPDATE" then
    local playerXP = UnitXP("player")
    local playerMaxXP = UnitXPMax("player")
    local remainingXP = playerMaxXP - playerXP
    local totalBubbles = math.ceil(remainingXP / (playerMaxXP / 20))

    if currentBubbleCount ~= totalBubbles then
      currentBubbleCount = totalBubbles
      print("You got XP, nice.")
      message("You have passed another bubble.")
    end
  end
end)

