--[[
# **********************************************************************
# Conky Panels / HDD
#
# A simple display panel to monitor hard disk drives.
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
alignment=ref_alignment,
gap_x=ref_pos_x,
gap_y=ref_pos_y+540,
}

-- Merge common options.
for k,v in pairs(common_config) do conky.config[k] = v end

conky.text = ""

-- Filesystems --

-- The main template for filesystem usage bars.
local used_space_template = [[
${if_existing &{filesystem}}\
${color &{brand}}&{filesystem} ${goto 200}${color &{main}}${fs_bar 10,214 &{filesystem}}\
${goto 0}${alignr 220}${fs_used &{filesystem}}\
${endif}
]]

-- File systems usage items. Copy existing to add new. Delete the non-existing in your system.
conky.text = conky.text .. (used_space_template % {filesystem="/"})
conky.text = conky.text .. (used_space_template % {filesystem="/mnt/win-7"})
conky.text = conky.text .. (used_space_template % {filesystem="/mnt/storage"})

-- Disk Usage --

-- The main HDD graph.
local graph_template = [[
${color &{main}}\
${font}\
${color &{main}}${diskiograph 100,400 &{brand} &{main}}\
${voffset -90}${goto 20}\
${color &{dimmed}}Overall
${voffset 71}
]]

conky.text = conky.text .. graph_template

-- Common template for all hard drives.
local sdx_graph_template = [[
${if_existing &{device}}\
${font}\
${voffset -19}\
${color &{main}}${diskiograph &{device} 100,400 &{brand} &{main}}\
${voffset 10}${goto 20}\
${color &{dimmed}}&{device}\
${goto 50}${alignr 4}${font &{font}:size=24}\
${color &{brand}}${hddtemp &{device}}°\
${font}${voffset -25}\
${endif}
]]

-- Individual hard disk items. You may add your own by copy-pasting the existing.
-- Also, remove the non-existent in your system.
conky.text = conky.text .. (sdx_graph_template % {device="/dev/sda"})
conky.text = conky.text .. (sdx_graph_template % {device="/dev/sdb"})
conky.text = conky.text .. (sdx_graph_template % {device="/dev/sdc"})

-- The top processes.
local top_template = [[
${color &{main}}${top_io name 1}${color &{brand}}${alignr 200}${top_io io_perc 1}%
${color &{main}}${top_io name 3}${color &{brand}}${alignr 200}${top_io io_perc 3}%
${voffset -38}\
${goto 220}${color &{main}}${top_io name 2}${color &{brand}}${alignr}${top_io io_perc 2}%
${goto 220}${color &{main}}${top_io name 4}${color &{brand}}${alignr}${top_io io_perc 4}%
]]

conky.text = conky.text .. top_template

-- Bottom Padding --
-- Decrease the value after 'voffset' to bring the border up.
conky.text = conky.text .. "${voffset -30}"

-- The resulting template should be in this variable.
conky.text = (conky.text) % {brand=brand_color, main=main_color, dimmed=dimmed_color}


