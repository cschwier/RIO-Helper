---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Panzerbüchse-Blackrock.
--- DateTime: 09-Apr-22 13:27
---
---
local RioHelper = LibStub("AceAddon-3.0"):GetAddon("RioHelper")
RioHelper.Data = {}

---
local DungeonAbbreviations = {
    [375] = "mots",
    [376] = "nw",
    [377] = "dos",
    [378] = "hoa",
    [379] = "pf",
    [380] = "sd",
    [381] = "soa",
    [382] = "top",
    [391] = "strt",
    [392] = "gmbt"
}
RioHelper.Data.DungeonAbbreviations = {
}
for id, abbr in pairs(DungeonAbbreviations) do
    RioHelper.Data.DungeonAbbreviations[id] = abbr
    RioHelper.Data.DungeonAbbreviations[abbr] = id
end
RioHelper.Data.ValidDungeonAbbreviationList = ""
for k, v in pairs(DungeonAbbreviations) do
    if (type(k) == "number") then
        RioHelper.Data.ValidDungeonAbbreviationList = RioHelper.Data.ValidDungeonAbbreviationList .. "\"" .. v .. "\", "
    end
end
RioHelper.Data.ValidDungeonAbbreviationList = string.sub(RioHelper.Data.ValidDungeonAbbreviationList, 1, -3)

---
RioHelper.Data.WeeklyAffixAbbreviations = {
    Tyrannical = "Tyrannical",
    Fortified = "Fortified"
}
for abbr, name in pairs(RioHelper.Data.WeeklyAffixAbbreviations) do
    local capital = strsub(abbr, 1, 1)
    RioHelper.Data.WeeklyAffixAbbreviations[capital] = name
    RioHelper.Data.WeeklyAffixAbbreviations[strsub(abbr, 1, 3)] = name
    local lower = string.lower(capital)
    RioHelper.Data.WeeklyAffixAbbreviations[lower] = name
    RioHelper.Data.WeeklyAffixAbbreviations[lower..strsub(abbr, 2, 3)] = name
    RioHelper.Data.WeeklyAffixAbbreviations[lower..strsub(abbr, 2, -1)] = name
end
RioHelper.Data.ValidWeeklyAffixAbbreviationsList = ""
for k, v in pairs(RioHelper.Data.WeeklyAffixAbbreviations) do
    RioHelper.Data.ValidWeeklyAffixAbbreviationsList = RioHelper.Data.ValidWeeklyAffixAbbreviationsList .. "\"" .. k .. "\", "
end
RioHelper.Data.ValidWeeklyAffixAbbreviationsList = string.sub(RioHelper.Data.ValidWeeklyAffixAbbreviationsList, 1, -3)

--- computed base scores for key level 1 to 10 based on affix activation at 4,7,10
RioHelper.Data.DungeonBaseScores = { 0, 40, 45, 55, 60, 65, 75, 80, 85, 100 };

---
RioHelper.Data.TimerConstants = {
    ---@type number bonus and malus are capped at 40% faster or slower than par time
    Threshold = 0.4,
    ---@type number maximum bonus/malus points for being faster/slower than the par time
    MaxModifier = 5,
    ---@type number maximum bonus/malus points for being faster/slower than the par time
    KeyDepletionMalus = 5,
}
