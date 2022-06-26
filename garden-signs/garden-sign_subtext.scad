// Customizable Garden Plant Label Stake
// by Mark Thompson

text_string = "Dill";
text_size = 12;
text_thickness = 3;
text_font = "Nimbus Sans L:Bold";
text_y_offset_adjust = 0;

subtext_string = "Herbs";
subtext_size = 6;
subtext_thickness = 4;
subtext_font = "Nimbus Sans L:Bold";
subtext_y_offset_adjust = -8;

stake_length = 175;
stake_thickness = 5;
stake_height = 5;

point_length = 10;
tip_size = 0.5;

{
    translate([0,text_y_offset_adjust,0])
        linear_extrude(height=text_thickness, convexity=4)
            text(text_string,size=text_size,font=text_font);

    translate([0,subtext_y_offset_adjust,0])
        linear_extrude(height=subtext_thickness, convexity=4)
            text(subtext_string,size=subtext_size,font=subtext_font);

    translate([stake_length/2,-stake_height/2,stake_thickness/2]) {
        difference() {
            hull() {
                cube([stake_length,stake_height,stake_thickness],true);
                translate([stake_length/2+point_length,stake_height/2-tip_size/2,-stake_thickness/2+tip_size/2])
                    cube([tip_size,tip_size,tip_size],true);
            }
            
            translate([0,-stake_height/2,stake_thickness/2])
                cube([stake_length+point_length*2+0.1,stake_height,stake_thickness],true);
        }
    }
}