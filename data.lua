
local item = table.deepcopy(data.raw["item"]["radar"])
item.name = "rtg-radar"
item.icon = nil
item.icons = {
    {
        icon = "__base__/graphics/icons/radar.png",
        --scale = 1
    },
    {
        icon = "__lilys-rtg-radar__/graphics/icons/signal-radioactivity.png",
        tint = { 0.70, 0.70, 0.70, 0.70 },
        scale = 0.4
    }
}
item.order = "d[radar]-a[rtg-radar]"
item.place_result = "rtg-radar"
item.stack_size = 10
item.weight = 100 * kg

local radar = table.deepcopy(data.raw["radar"]["radar"])
radar.name = "rtg-radar"
radar.icon = nil
radar.icons = {
    {
        icon = "__base__/graphics/icons/radar.png",
        --scale = 1
    },
    {
        icon = "__lilys-rtg-radar__/graphics/icons/signal-radioactivity.png",
        tint = {0.70, 0.70, 0.70, 0.70},
        scale = 0.4
    }
}
radar.minable = { mining_time = 0.1, result = "rtg-radar" }
radar.max_health = radar.max_health * 4
radar.heating_energy = "0W"
radar.energy_source = {type = "void"}
radar.energy_usage = "600kW"
local p1 = {
    filenames = {},
    frame_count = 64,
    line_length = 8,
    height = radar.pictures.height,
    width = radar.pictures.width,
}
local p2 = table.deepcopy(p1)
p2.tint = {0.0, 0.1, 0.0, 0.1}
p2.blend_mode = "additive"
p2.draw_as_glow = true

radar.pictures = {
    layers =
    {
        {
            filename = "__lilys-rtg-radar__/graphics/entity/radar.png",
            priority = "low",
            width = 196,
            height = 254,
            apply_projection = false,
            direction_count = 64,
            line_length = 8,
            shift = util.by_pixel(1.0, -16.0),
            scale = 0.5
        },
        {
            filename = "__base__/graphics/entity/radar/radar-shadow.png",
            priority = "low",
            width = 336,
            height = 170,
            apply_projection = false,
            direction_count = 64,
            line_length = 8,
            shift = util.by_pixel(39.0, 6.0),
            draw_as_shadow = true,
            scale = 0.5
        },
        {
            filename = "__lilys-rtg-radar__/graphics/entity/radar.png",
            priority = "low",
            width = 196,
            height = 254,
            apply_projection = false,
            direction_count = 64,
            line_length = 8,
            shift = util.by_pixel(1.0, -16.0),
            scale = 0.5,
            tint = { 0.0, 0.25, 0.0, 0.1 },
            blend_mode = "additive",
            draw_as_glow = true,
        },
    }
}

---@diagnostic disable-next-line: assign-type-mismatch
data:extend({item, radar})

--recipe basic
data:extend({
    {
        type = "recipe",
        name = "rtg-radar",
        category = "advanced-crafting",
        allow_productivity = false,
        enabled = false,
        energy_required = 30,
        ingredients =
        {
            { type = "item", name = "radar",   amount = 1 },
            { type = "item",  name = "fission-reactor-equipment", amount = 1 },
            { type = "item", name = "processing-unit",   amount = 10 },
            { type = "item",  name = "copper-cable",   amount = 200 },
            { type = "item",  name = "steel-plate",   amount = 50 }
        },
        results = { { type = "item", name = "rtg-radar", amount = 1 } }
    }
})

-- technology
data:extend({
    {
        type = "technology",
        name = "rtg-radar",
        icons = {
            {
                icon = "__base__/graphics/technology/radar.png",
                icon_size = 256
            },
            {
                icon = "__lilys-rtg-radar__/graphics/icons/signal-radioactivity.png",
                icon_size = 64,
                scale = 1.5,
                tint = { 0.80, 0.80, 0.80, 0.80 }
            }
        },
        prerequisites = { "fission-reactor-equipment", "processing-unit" },
        unit =
        {
            count = 200,
            ingredients =
            {
                { "automation-science-pack", 1 },
                { "logistic-science-pack",   1 },
                { "chemical-science-pack",   1 },
                { "military-science-pack",   1 },
                { "utility-science-pack",    1 }
            },
            time = 30
        },
        effects =
        {
            {
                type = "unlock-recipe",
                recipe = "rtg-radar"
            }
        }
    }
})