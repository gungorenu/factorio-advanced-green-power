local config = require("prototypes.config")
local IMGPATH = "__advanced-green-power__/graphics/"

local function agp_accumulator_picture(color, tint, repeat_count)
  return
  {
    layers =
    {
      {
        filename =  IMGPATH.."entity/accumulator_"..color..".png",
        priority = "high",
        width = 66,
        height = 94,
        repeat_count = repeat_count,
        shift = util.by_pixel(0, -10),
        tint = tint,
        animation_speed = 0.5,
        hr_version =
        {
          filename = IMGPATH.."entity/hr-accumulator_"..color..".png",
          priority = "high",
          width = 130,
          height = 189,
          repeat_count = repeat_count,
          shift = util.by_pixel(0, -11),
          tint = tint,
          animation_speed = 0.5,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/accumulator/accumulator-shadow.png",
        priority = "high",
        width = 120,
        height = 54,
        repeat_count = repeat_count,
        shift = util.by_pixel(28, 6),
        draw_as_shadow = true,
        hr_version =
        {
          filename = "__base__/graphics/entity/accumulator/hr-accumulator-shadow.png",
          priority = "high",
          width = 234,
          height = 106,
          repeat_count = repeat_count,
          shift = util.by_pixel(29, 6),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    }
  }
end

local function agp_accumulator_charge(color, tint)
  return
  {
    layers =
    {
      agp_accumulator_picture(color, {r=1, g=1, b=1, a=1} , 24),
      {
        filename = "__base__/graphics/entity/accumulator/accumulator-charge.png",
        priority = "high",
        width = 90,
        height = 100,
        line_length = 6,
        frame_count = 24,
        draw_as_glow = true,
        shift = util.by_pixel(0, -22),
        tint = tint,
        hr_version =
        {
          filename = "__base__/graphics/entity/accumulator/hr-accumulator-charge.png",
          priority = "high",
          width = 178,
          height = 206,
          line_length = 6,
          frame_count = 24,
          draw_as_glow = true,
          shift = util.by_pixel(0, -22),
          tint = tint,
          scale = 0.5
        }
      }
    }
  }
end

local function agp_accumulator_discharge(color, tint)
  return
  {
    layers =
    {
      agp_accumulator_picture(color, {r=1, g=1, b=1, a=1}, 24),
      {
        filename = "__base__/graphics/entity/accumulator/accumulator-discharge.png",
        priority = "high",
        width = 88,
        height = 104,
        line_length = 6,
        frame_count = 24,
        draw_as_glow = true,
        shift = util.by_pixel(-2, -22),
        tint = tint,
        hr_version =
        {
          filename = "__base__/graphics/entity/accumulator/hr-accumulator-discharge.png",
          priority = "high",
          width = 170,
          height = 210,
          line_length = 6,
          frame_count = 24,
          draw_as_glow = true,
          shift = util.by_pixel(-1, -23),
          tint = tint,
          scale = 0.5
        }
      }
    }
  }
end

local accumulators = {}
local solarPanels = {}

-- accumulators

for mk,details in pairs(config.accumulators) do
  local accName = "agp-accumulator-"..mk
  local acc = util.table.deepcopy(data.raw["accumulator"]["accumulator"])
  acc.name = accName
  acc.icon = IMGPATH.."icon/accumulator_"..details["color"]..".png"
  acc.fast_replaceable_group = "accumulator"
  acc.minable = { 
    mining_time = 0.1, 
    result = accName 
  }
  acc.picture = accumulator_picture( { 
    r= details.tint["r"], 
    g= details.tint["g"], 
    b= details.tint["b"], 
    a= details.tint["a"]} )
  acc.energy_source = {
   type = "electric",
   buffer_capacity = details["buffer_capacity"],
   usage_priority = "tertiary",
   input_flow_limit = details["flow_limit"],
   output_flow_limit = details["flow_limit"]
  }
  acc.picture = agp_accumulator_picture(details["color"])
  acc.charge_animation = agp_accumulator_charge(details["color"], details["tint"])
  acc.discharge_animation = agp_accumulator_discharge(details["color"], details["tint"])

  table.insert(accumulators,acc)
end

-- solar panels

for mk,details in pairs(config.solarPanels) do
  local spName = "agp-solar-panel-"..mk
  local sp = util.table.deepcopy(data.raw["solar-panel"]["solar-panel"])
  sp.name = spName 
  sp.icon = IMGPATH.."icon/solar-panel_"..details["color"]..".png"
  sp.fast_replaceable_group = "solar-panel"
  sp.minable = { 
    mining_time = 0.1, 
    result = spName 
  }
  local tint = { 
    r= details.tint["r"], 
    g= details.tint["g"], 
    b= details.tint["b"], 
    a= details.tint["a"]
  } 

  sp.picture = {
    layers =
    {
      {
        filename =  IMGPATH.."/entity/solar-panel_"..details["color"]..".png",
        priority = "high",
        width = 116,
        height = 112,
        shift = util.by_pixel(-3, 3),
        hr_version =
        {
          filename = IMGPATH.."/entity/hr-solar-panel_"..details["color"]..".png",
          priority = "high",
          width = 230,
          height = 224,
          shift = util.by_pixel(-3, 3.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/solar-panel/solar-panel-shadow.png",
        priority = "high",
        width = 112,
        height = 90,
        shift = util.by_pixel(10, 6),
        draw_as_shadow = true,
        hr_version =
        {
          filename = "__base__/graphics/entity/solar-panel/hr-solar-panel-shadow.png",
          priority = "high",
          width = 220,
          height = 180,
          shift = util.by_pixel(9.5, 6),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    }
  }
  
  sp.production = details["production"]

  table.insert(solarPanels,sp)
end


-- 

data:extend(accumulators)
data:extend(solarPanels)
