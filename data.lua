if mods["shortwave_fix"] then
  data:extend({
    {
      type = "recipe",
      name = "nullius-shortwave",
      enabled = false,
      always_show_made_in = true,
      category = "small-crafting",
      energy_required = 5,
      ingredients = {
        { "programmable-speaker", 2 },
        { "decider-combinator",   2 }
      },
      result = "shortwave-radio"
    }
  })

  data.raw.item["shortwave-radio"].subgroup = "circuit-network"
  data.raw.item["shortwave-radio"].order = "nullius-s"
  table.insert(data.raw["technology"]["nullius-computation"].effects,
    { type = "unlock-recipe", recipe = "nullius-shortwave" })
end

if mods["CircuitHUD-V2"] then
  data:extend({
    {
      type = "recipe",
      name = "nullius-circuit-hud",
      enabled = false,
      always_show_made_in = true,
      category = "small-crafting",
      energy_required = 5,
      ingredients = {
        { "programmable-speaker", 2 },
        { "decider-combinator",   2 }
      },
      result = "hud-combinator"
    }
  })

  data.raw.item["hud-combinator"].subgroup = "circuit-network"
  data.raw.item["hud-combinator"].order = "nullius-s"
  table.insert(data.raw["technology"]["nullius-computation"].effects,
    { type = "unlock-recipe", recipe = "nullius-circuit-hud" })
end


if (mods["RecipeBook"] and (recipe_book ~= nil) and
      (recipe_book.set_hidden ~= nil) and (recipe_book.set_group_with ~= nil)) then

  local function group_with(proto1, proto2)
    if ((proto1 ~= nil) and (proto2 ~= nil)) then
      recipe_book.set_group_with(proto1, proto2)
    end
  end

  group_with(data.raw.item["shortwave-radio"], data.raw.recipe["nullius-shortwave"])
  group_with(data.raw.item["hud-combinator"], data.raw.recipe["nullius-circuit-hud"])
end
