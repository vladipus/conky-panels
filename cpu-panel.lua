--[[
# **********************************************************************
# Conky Panels / CPU
#
# A simple display panel to monitor CPU performance.
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
gap_x=(-width - 20),
gap_y=-140,
}

-- Merge common options.
for k,v in pairs(common_config) do conky.config[k] = v end


-- The top CPU bar.
local bar_template = [[
${color &{brand}}CPU ${color &{main}} ${cpu cpu0}%  ${cpubar cpu0 10,}
]]

conky.text = bar_template

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

conky.text = conky.text .. graph_template 

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

-- Individual Cores --

-- The graphs for individual cores.
local core_graphs_template = [[
${voffset -19}\
${color &{main}}\
${cpugraph cpu&{index1} 50,100 &{brand} &{main}}\
${cpugraph cpu&{index2} 50,100 &{brand} &{main}}\
${cpugraph cpu&{index3} 50,100 &{brand} &{main}}\
${cpugraph cpu&{index4} 50,100 &{brand} &{main}}\
${voffset -58}
${color &{dimmed}}\
${goto 20}Core &{index1}\
${goto 120}Core &{index2}\
${goto 220}Core &{index3}\
${goto 320}Core &{index4}\
${voffset 39}
]]

-- First four cores. Comment-out if not needed.
conky.text = conky.text .. (core_graphs_template % {index1='1', index2='2', index3='3', index4='4'})
-- Last four cores. Comment-out if not needed.
conky.text = conky.text .. (core_graphs_template % {index1='5', index2='6', index3='7', index4='8'})


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
${color &{main}}${top name 1}${color &{brand}}${alignr 200}${top cpu 1}%
${color &{main}}${top name 3}${color &{brand}}${alignr 200}${top cpu 3}%
${voffset -38}\
${goto 220}${color &{main}}${top name 2}${color &{brand}}${alignr}${top cpu 2}%
${goto 220}${color &{main}}${top name 4}${color &{brand}}${alignr}${top cpu 4}%
]]

conky.text = conky.text .. top_template

-- Bottom Padding --
-- Decrease the value after 'voffset' to bring the border up.
conky.text = conky.text .. "${voffset -82}"

-- The resulting template should be in this variable.
conky.text =
(
 conky.text
) % {font=font, brand=brand_color, main=main_color, dimmed=dimmed_color}
