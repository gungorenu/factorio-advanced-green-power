local config = require("prototypes.config")

local accumulators = {}
local solarPanels = {}

local function recipe(name, recipe )
  return {
    type = "recipe",
    name = name,
    energy_required = recipe["energy_required"],
    enabled = false,
    ingredients = recipe.ingredients,
    result = name,
    result_count = 1
  }
end

-- accumulators

for mk,details in pairs(config.accumulators) do
  table.insert(accumulators, recipe("agp-accumulator-"..mk, details.recipe ) )
end

-- solar panels

for mk,details in pairs(config.solarPanels) do
  table.insert(solarPanels, recipe("agp-solar-panel-"..mk, details.recipe ) )
end

-- 

data:extend(accumulators)
data:extend(solarPanels)
