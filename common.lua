-- String interpolation for inserting variables into templates.
function interp(s, tab)
  return (s:gsub('(&%b{})', function(w) return tab[w:sub(3, -2)] or w end))
end

getmetatable("").__mod = interp


-- Main window size in pixels.
width=400

-- Named color definitions in the form of RRGGBB.
main_color='FFFFFF'
brand_color='2DACD4'
dimmed_color='A0A0A0'
background_color='000000'

-- The main font.
font='Droid Sans'

-- Conky configuration data.
common_config = {
-- Presentation
own_window=true,
own_window_type="desktop",
own_window_hints="undecorated,below,sticky,skip_taskbar,skip_pager",

-- Don't use a background process.
background=false,

-- Graphics
double_buffer=true,

-- Sampling
net_avg_samples=2,
cpu_avg_samples=2,

-- Outlines, Shadows & Borders
draw_borders=false,
draw_graph_borders=true,
draw_outline=false,
draw_shades=false,

no_buffers=true,
out_to_console=false,
out_to_stderr=false,
extra_newline=false,

-- Background
own_window_colour=background_color,
own_window_argb_visual=true,
own_window_argb_value=128,
border_width=10,

-- Size
minimum_width=width,
maximum_width=width, 
minimum_height=100,

stippled_borders=0,
update_interval=1.0,
uppercase=false,
use_spacer='none',

-- Graphs
show_graph_scale=false,
show_graph_range=false,

-- Fonts
use_xft=true,
xftalpha=0.1,
font=font .. ':size=12',

-- Colors
default_color='white',
default_outline_color="black",
default_shade_color="black",
color0=main_color,
color1=brand_color,
color2=dimmed_color
}
