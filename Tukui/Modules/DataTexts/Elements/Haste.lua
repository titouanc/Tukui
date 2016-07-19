local T, C, L = select(2, ...):unpack()

local DataText = T["DataTexts"]
local format = format
local Class = select(2, UnitClass("player"))

local Update = function(self)
	local Value = GetCombatRating(18)

	self.Text:SetFormattedText("%s: %s", DataText.NameColor .. L.DataText.Haste .. "|r", DataText.ValueColor .. T.Comma(Value) .. "|r")
end

local Enable = function(self)
	self:RegisterEvent("UNIT_STATS")
	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	self:SetScript("OnEvent", Update)
	self:Update()
end

local Disable = function(self)
	self.Text:SetText("")
	self:UnregisterAllEvents()
	self:SetScript("OnEvent", nil)
end

DataText:Register(L.DataText.Haste, Enable, Disable, Update)
