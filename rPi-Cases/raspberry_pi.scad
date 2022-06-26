include <enclosure.scad>

show_face="open";
device_width=56;
device_length=85;
device_height=25;
device_bottom_height = 5;
enclosure_thickness = 2;
  
front_port1 = "sd";
front_port1_position = 13;
front_port1_side = "bottom";

front_port2 = "micro-usb";
front_port2_position = 44;
front_port2_side = "top";

back_port1 = "eth";
back_port1_position = 2;
back_port1_side = "top";

back_port2 = "2usb-a";
back_port2_position = 31;
back_port2_side = "top";

right_port1 = "hdmi";
right_port1_position = 36;
right_port1_side = "top";

left_port1 = "stereo";
left_port1_position = 64;
left_port1_side = "top";

left_port2 = "s-video";
left_port2_position = 46;
left_port2_side = "top";

left_port3 = "custom-rectangle";
left_port3_position = 1;
left_port3_custom_rectangle_width = 34;
left_port3_custom_rectangle_height = 2;
left_port3_custom_elevation = 12;
left_port3_side = "top";
