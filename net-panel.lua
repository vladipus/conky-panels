--[[
# **********************************************************************
# Conky Panels / NET
#
# A simple display panel to monitor network activity.
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

-- The network devices names. You may use 'sudo ifconfig' to list available.
devices = {'enp11s0'}

conky.config={
-- Positioning
alignment="top_left",
gap_x=(-width - 20),
gap_y=1000,
}

-- Merge common options.
for k,v in pairs(common_config) do conky.config[k] = v end

conky.text = ""

for index, device in pairs(devices) do
    -- The network device name.
    local device_name_template = [[
${color &{brand}}&{device}\
${goto 140}${color &{main}}${font FontAwesome:size=14} ${font}${downspeed &{device}}\
${goto 265}${color &{main}}${font FontAwesome:size=14} ${font}${upspeed &{device}}
]]

    -- File systems usage items. Copy existing to add new. Delete the non-existing in your system.
    conky.text = conky.text .. (device_name_template % {device=device})

    -- Download speed graph.
    local graph_template = [[
${color &{main}}${downspeedgraph &{device} 80,400 &{brand} &{main}}
${voffset -86}${goto 20}\
${color &{dimmed}}Download\
${voffset 48}
${color &{main}}${upspeedgraph &{device} 80,400 &{brand} &{main}}
${voffset -86}${goto 20}\
${color &{dimmed}}Upload\
${font}${voffset 71}
]]

    conky.text = conky.text .. (graph_template % {device=device})
end

-- Bottom Padding --
-- Decrease the value after 'voffset' to bring the border up.
conky.text = conky.text .. "${voffset -110}"

-- The resulting template should be in this variable.
conky.text = (conky.text) % {brand=brand_color, main=main_color, dimmed=dimmed_color}


