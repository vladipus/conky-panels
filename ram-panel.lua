--[[
# **********************************************************************
# Conky Panels / RAM
#
# A simple display panel to monitor main random-access memory (RAM) usage.
#
# Author: Vladislav Dmitrievich Turbanov
# Repository: https://github.com/vladipus/conky-panels
# License: BSD
#
# Some elements were based on this theme:
# http://www.teejeetech.in/2014/07/my-conky-themes-update-2.html
# **********************************************************************

This is needed to be detected in the "Conky Manager" app:
TEXT
]]

require(".common")


conky.config={
-- Positioning
alignment="top_left",
gap_x=ref_pos_x,
gap_y=ref_pos_y+318,
}

-- Merge common options.
for k,v in pairs(common_config) do conky.config[k] = v end


-- The top bar.
local bar_template = [[
${color &{brand}}RAM ${color &{main}} ${mem}  ${membar 10,}
${voffset -18}
]]

-- The memory graph.
local graph_template = [[
${color &{main}}\
${memgraph 100,400 &{brand} &{main}}
${voffset -17}
]]

-- The top processes.
local top_template = [[
${color &{main}}${top_mem name 1}${color &{brand}}${alignr 200}${top_mem mem 1}%
${color &{main}}${top_mem name 3}${color &{brand}}${alignr 200}${top_mem mem 3}%
${voffset -38}\
${goto 220}${color &{main}}${top_mem name 2}${color &{brand}}${alignr}${top_mem mem 2}%
${goto 220}${color &{main}}${top_mem name 4}${color &{brand}}${alignr}${top_mem mem 4}%
]]

-- The resulting template should be in this variable.
conky.text = (bar_template .. graph_template .. top_template) % {brand=brand_color, main=main_color, dimmed=dimmed_color}


