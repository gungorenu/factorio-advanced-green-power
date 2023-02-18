local config = require("prototypes.config")
local IMGPATH = "__advanced-green-power__/graphics/"

local accumulators = {}
local solarPanels = {}

local function tech(name, icon, color, techDetails)
  local t = {
    type = "technology",
    name = name,
    icon = IMGPATH.."technology/"..icon.."_"..color..".png",
    icon_size = 256,
    prerequisites = techDetails["prerequisites"],
    unit = { 
      count=techDetails["count"], 
      ingredients = techDetails.science, 
      time = techDetails["time"]
    },
    order = techDetails["order"],
    effects = {
      { type="unlock-recipe", recipe=name}
    },
  }
  return t
end


-- accumulators

for mk,details in pairs(config.accumulators) do
  table.insert(accumulators, tech("agp-accumulator-"..mk, "electric-energy-acumulators", details["color"], details.technology) )
end

-- solar panels

for mk,details in pairs(config.solarPanels) do
  table.insert(solarPanels, tech("agp-solar-panel-"..mk, "solar-energy", details["color"], details.technology) )
end


data:extend(solarPanels)
data:extend(accumulators)
