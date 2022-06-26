
module drawer_divider(width=76, depth=76, height=25, external_wall=1, internal_wall=2, x_compartments=3, y_compartments=2, floor_thickness=1, floor=0) 
{
	difference() {
		cube([width,depth,height]);
		translate([external_wall,external_wall,-1])
			cube([width-external_wall*2,depth-external_wall*2,height+2]);
	}

	for (x_comp=[1:x_compartments-1])
		translate([x_comp/x_compartments*(width-external_wall*2)-internal_wall/2+external_wall,0,0])
			cube([internal_wall,depth,height]);

	for (y_comp=[1:y_compartments-1])
		translate([0,y_comp/y_compartments*(depth-external_wall*2)-internal_wall/2+external_wall,0])
			cube([width,internal_wall,height]);

	if (floor==1) {
		union() {
			cube([width,depth,floor_thickness]);
            translate([10,10,1]) linear_extrude(floor_thickness) text("Howard's Treasure", size=10);
		}
	}
}

drawer_divider(width=166, depth=166, height=10, internal_wall=1.5, external_wall=1.5, x_compartments=1, y_compartments=1, floor_thickness=1.125, floor=1);
