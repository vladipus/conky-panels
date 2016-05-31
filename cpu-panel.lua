--[[
# **********************************************************************
# Turbanov Panels / CPU
# A simple display panel for CPU performance.
#
# Original theme: http://teejeetech.blogspot.in/
# **********************************************************************

This is needed to be detected in the "Conky Manager" app:
TEXT
]]

require(".common")


conky.config={
-- Positioning
alignment="top_left",
gap_x=(-width - 20),
gap_y=-140,
}

-- Merge common options.
for k,v in pairs(common_config) do conky.config[k] = v end


-- The top CPU bar.
local bar_template = [[
${color &{brand}}CPU ${color &{main}} ${cpu cpu0}%  ${cpubar cpu0 10,}
]]

-- The main CPU graph.
local graph_template = [[
${color &{main}}\
${cpugraph 100,400 &{brand} &{main}}\
${voffset -88}${goto 20}\
${color &{dimmed}}Overall
${voffset -21}${alignr 4}${font &{font}:size=24}\
${color &{brand}}${hwmon temp 1}°\
${font}${voffset 75}
]]

-- The temperatures of individual cores (not used).
local core_temperatures_template = [[
${color &{brand}}${exec cat /sys/devices/platform/coretemp.0/hwmon/hwmon0/temp2_label}${color &{main}} \
${hwmon temp 2}° \
${color &{brand}}${exec cat /sys/devices/platform/coretemp.0/hwmon/hwmon0/temp3_label}${color &{main}} \
${hwmon temp 3}° \
${color &{brand}}${exec cat /sys/devices/platform/coretemp.0/hwmon/hwmon0/temp4_label}${color &{main}} \
${hwmon temp 4}° \
${color &{brand}}${exec cat /sys/devices/platform/coretemp.0/hwmon/hwmon0/temp5_label}${color &{main}} \
${hwmon temp 5}°
]]

-- The graphs for individual cores.
local core_graphs_template = [[
${color &{main}}\
${voffset -19}\
${cpugraph cpu1 50,100 &{brand} &{main}}\
${cpugraph cpu2 50,100 &{brand} &{main}}\
${cpugraph cpu3 50,100 &{brand} &{main}}\
${cpugraph cpu4 50,100 &{brand} &{main}}
${voffset -19}\
${cpugraph cpu5 50,100 &{brand} &{main}}\
${cpugraph cpu6 50,100 &{brand} &{main}}\
${cpugraph cpu7 50,100 &{brand} &{main}}\
${cpugraph cpu8 50,100 &{brand} &{main}}\
${voffset -45}
]]

-- The individual core numbers.
local core_numbers_template = [[
${color &{dimmed}}\
${voffset -60}\
${goto 20}Core 1 ${goto 120}Core 2 ${goto 220}Core 3 ${goto 320}Core 4
${voffset 32}\
${goto 20}Core 5 ${goto 120}Core 6 ${goto 220}Core 7 ${goto 320}Core 8\
${voffset -12}
]]

-- The frequencies of individual cores (not used).
local core_frequencies_template = [[
${color &{brand}}\
${voffset -108}\
${goto 51}${freq_g 1}GHz ${goto 151}${freq_g 2}GHz ${goto 251}${freq_g 3}GHz ${goto 351}${freq_g 4}GHz
${voffset 13}\
${goto 51}${freq_g 5}GHz ${goto 151}${freq_g 6}GHz ${goto 251}${freq_g 7}GHz ${goto 351}${freq_g 8}GHz
]]

-- The top processes.
local top_template = [[
${voffset 48}\
${color &{main}}${top name 1}${color &{brand}}${alignr 200}${top cpu 1}%
${color &{main}}${top name 3}${color &{brand}}${alignr 200}${top cpu 3}%
${voffset -38}\
${goto 220}${color &{main}}${top name 2}${color &{brand}}${alignr}${top cpu 2}%
${goto 220}${color &{main}}${top name 4}${color &{brand}}${alignr}${top cpu 4}%\
${voffset -22}
]]

-- The resulting template should be in this variable.
conky.text =
(
 bar_template ..
 graph_template ..
 core_graphs_template ..
 core_numbers_template ..
 top_template
) % {font=font, brand=brand_color, main=main_color, dimmed=dimmed_color}

-- Adjust the bottom border.
-- Decrease the value after 'voffset' to bring the border up.
conky.text = conky.text .. "${voffset -56}"

