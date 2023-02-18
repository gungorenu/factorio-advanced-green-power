local config = require("prototypes.config")
local IMGPATH = "__advanced-green-power__/graphics/"

local accumulators = {}
local solarPanels = {}

-- accumulators

for mk,details in pairs(config.accumulators) do
  local accName = "agp-accumulator-"..mk
  local acc= util.table.deepcopy(data.raw["item"]["accumulator"])
  acc.name = accName
  acc.subgroup = "energy"
  acc.icon = IMGPATH.."icon/accumulator_"..details["color"]..".png"
  acc.place_result = accName
  acc.order = "e[accumulator]-a[accumulator]-b"..mk

  table.insert(accumulators,acc)
end

-- solar panels

for mk,details in pairs(config.solarPanels) do
  local spName = "agp-solar-panel-"..mk
  local sp= util.table.deepcopy(data.raw["item"]["solar-panel"])
  sp.name = spName
  sp.subgroup = "energy"
  sp.icon = IMGPATH.."icon/solar-panel_"..details["color"]..".png"
  sp.place_result = spName
  sp.order = "d[solar-panel]-a[solar-panel]-b"..mk

  table.insert(solarPanels,sp)
end


-- 

data:extend(accumulators)
data:extend(solarPanels)
