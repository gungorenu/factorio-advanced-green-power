return {
  accumulators = {
    advanced = { -- name: agp-accumulator-advanced
      color = "green", tint = { r = 0, g = 0.8, b = 0, a = 1 }, buffer_capacity = "15MJ", flow_limit = "900kW", 
      recipe = { energy_required = 10, ingredients = { 
          {"iron-plate", 25}, {"battery", 10}, {"accumulator", 5}
        } 
      },
      technology = { 
        prerequisites= { "electric-energy-accumulators" }, 
        science={ 
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
        }, 
        count=300, 
        time=30,
        order="c-e-c"
      }
    },
    elite = { -- name: agp-accumulator-elite
      color = "blue", tint = { r = 0, g = 0.2, b = 1, a = 1 }, buffer_capacity = "45MJ", flow_limit = "2.7MW", 
      recipe = { energy_required = 10, ingredients = { 
          {"iron-plate", 45}, {"battery", 25}, {"agp-accumulator-advanced", 5}
        } 
      },
      technology = { 
        prerequisites= { "agp-accumulator-advanced", "advanced-electronics", "chemical-science-pack" }, 
        science={ 
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"chemical-science-pack", 1}        
        }, 
        count=400, 
        time=30,
        order="c-e-c"
      }
    },
    ultimate = { -- name: agp-accumulator-ultimate
      color = "purple", tint = { r = 1, g = 0.3, b = 1, a = 0.8 }, buffer_capacity = "135MJ", flow_limit = "8.1MW", 
      recipe = { energy_required = 10,  ingredients = { 
          {"steel-plate", 45}, {"battery", 45}, {"agp-accumulator-elite", 5}
        } 
      },
      technology = { 
        prerequisites= { "agp-accumulator-elite", "advanced-electronics-2", "utility-science-pack" }, 
        science={ 
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"chemical-science-pack", 1},
          {"utility-science-pack", 1}
        }, 
        count=500, 
        time=30,
        order="c-e-c"
      }
    }
  },

  solarPanels = {
    advanced = { -- name: agp-solar-panel-advanced
      color = "green", tint = { r = 0, g = 0.8, b = 0, a = 1 }, production="180kW", 
      recipe = { energy_required = 10, ingredients = { 
          {"steel-plate", 25}, {"electronic-circuit", 15}, {"solar-panel", 5}
        } 
      },
      technology = { 
        prerequisites= { "solar-energy" }, 
        science={ 
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
        }, 
        count=250, 
        time=30,
        order="a-h-c"
      }
    },
    elite = { -- name: agp-solar-panel-elite
      color = "blue", tint = { r = 0, g = 0.2, b = 1, a = 1 }, production="540kW", 
      recipe = { energy_required = 10, ingredients = { 
          {"steel-plate", 25}, {"advanced-circuit", 15}, {"agp-solar-panel-advanced", 5}
        } 
      },
      technology = { 
        prerequisites= { "agp-solar-panel-advanced", "advanced-electronics", "chemical-science-pack" }, 
        science={ 
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"chemical-science-pack", 1}        
        }, 
        count=350, 
        time=30,
        order="a-h-c"
      }
    },
    ultimate = { -- name: agp-solar-panel-ultimate
      color = "purple", tint = { r = 1, g = 0.3, b = 0.8, a = 1 }, production="1.62MW", 
      recipe = { energy_required = 10,  ingredients = { 
          {"steel-plate", 25}, {"processing-unit", 5}, {"agp-solar-panel-elite", 5}
        } 
      },
      technology = { 
        prerequisites= { "agp-solar-panel-elite", "advanced-electronics-2", "utility-science-pack" }, 
        science={ 
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"chemical-science-pack", 1},
          {"utility-science-pack", 1}
        }, 
        count=500, 
        time=30,
        order="a-h-c"
      }
    }
  }
}