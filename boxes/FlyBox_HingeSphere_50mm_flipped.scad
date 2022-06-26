rotate([180,0,0])
translate([0,0,-12.5])
translate([0,5,0])
union() {
    difference() {
        roundedcube([100, 50, 12.5], false, 2.5, "zmax");
        translate([2,2,-2])
            roundedcube([96, 46,12.5],false,2.5,"zmax");
        translate([45,46,-3])
            rotate([0,90,0])
                translate([-4,4.8,1])
                    cylinder(h=8, r1=1, r2=1, $fn=100);
        translate([45,46,-3])
            rotate([0,90,0])
                translate([-6,4.8,1])
                    cylinder(h=8, r1=1, r2=1, $fn=100);
        translate([45,46,-3])
            rotate([0,90,0])
                translate([-8,4.8,1])
                    cylinder(h=8, r1=1, r2=1, $fn=100);
        translate([45,46,-3])
            rotate([0,90,0])
                translate([-10,4.8,1])
                    cylinder(h=8, r1=1, r2=1, $fn=100);
    }
    translate([45,46,-3])
        union() {
            cube([10,2,13]);
            rotate([0,90,0])
                translate([-1,1.8,1])
                    cylinder(h=8, r1=1, r2=1, $fn=100);
        }
    rotate([0,90,0])
        translate([0,-5,10])
            difference() {
            union() {
                    cylinder(h=10, r1=4, r2=4, $fn=100);     
                    difference() {
                        translate([2,3,0])
                            rotate([0,0,135])
                                cube([10,7,10]);
                        translate([0,7,-5]) 
                            rotate([0,0,90]) 
                                cube([4,10,20]);
                    }
            }
            translate([0,0,10])
                        sphere(3, $fn=100);
            }
   rotate([0,90,0])
        translate([0,-5,80])
            difference() {
            union() {
                    cylinder(h=10, r1=4, r2=4, $fn=100);
                difference() {
                    translate([2,3,0])
                        rotate([0,0,135])
                            cube([10,7,10]);
                    translate([0,7,-5]) 
                        rotate([0,0,90]) 
                            cube([4,10,20]);
                }
            }
            translate([0,0,0])
                        sphere(3, $fn=100);
        }
}
translate([0,0,12.5])
rotate([180,0,0])
union() {
    translate([0,-55,0]) 
        difference() {
            roundedcube([100, 50, 12.5], false, 2.5, "zmax");
            translate([2,2,-2])
                roundedcube([96, 46,12.5],false,2.5,"zmax");
            difference() {
                translate([45,2,2])
                    rotate([0,90,0])
                        cylinder(h=10, r1=1, r2=1, $fn=100);
            }
        }
        rotate([0,90,0])
        translate([0,0,20.5])
            union() {
                cylinder(h=10, r1=4, r2=4, $fn=100);
                difference() {
                    translate([-5,-10,0])
                        rotate([0,0,45]) 
                            cube([9,7,10]);   
                    translate([0,-10,-1]) 
                        rotate([0,0,90]) 
                            cube([3,10,20]);
                }
                sphere(2.75, $fn=100);
            }
        
        rotate([0,90,0])
        translate([0,0,69.5])
            union() {
                cylinder(h=10, r1=4, r2=4, $fn=100);
                difference() {
                    translate([-5,-10,0])
                        rotate([0,0,45]) 
                            cube([9,7,10]);  
                    translate([0,-10,-1]) 
                        rotate([0,0,90]) 
                            cube([3,10,20]);
                }
                translate([0,0,10])
                    sphere(2.75, $fn=100);
            }
}

// Set to 0.01 for higher definition curves (renders slower)
$fs = 0.0001;

module roundedcube(size = [1, 1, 1], center = false, radius = 0.5, apply_to = "all") {
	// If single value, convert to [x, y, z] vector
	size = (size[0] == undef) ? [size, size, size] : size;

	translate_min = radius;
	translate_xmax = size[0] - radius;
	translate_ymax = size[1] - radius;
	translate_zmax = size[2] - radius;

	diameter = radius * 2;

	obj_translate = (center == false) ?
		[0, 0, 0] : [
			-(size[0] / 2),
			-(size[1] / 2),
			-(size[2] / 2)
		];

	translate(v = obj_translate) {
		hull() {
			for (translate_x = [translate_min, translate_xmax]) {
				x_at = (translate_x == translate_min) ? "min" : "max";
				for (translate_y = [translate_min, translate_ymax]) {
					y_at = (translate_y == translate_min) ? "min" : "max";
					for (translate_z = [translate_min, translate_zmax]) {
						z_at = (translate_z == translate_min) ? "min" : "max";

						translate(v = [translate_x, translate_y, translate_z])
						if (
							(apply_to == "all") ||
							(apply_to == "xmin" && x_at == "min") || (apply_to == "xmax" && x_at == "max") ||
							(apply_to == "ymin" && y_at == "min") || (apply_to == "ymax" && y_at == "max") ||
							(apply_to == "zmin" && z_at == "min") || (apply_to == "zmax" && z_at == "max")
						) {
							sphere(r = radius);
						} else {
							rotate = 
								(apply_to == "xmin" || apply_to == "xmax" || apply_to == "x") ? [0, 90, 0] : (
								(apply_to == "ymin" || apply_to == "ymax" || apply_to == "y") ? [90, 90, 0] :
								[0, 0, 0]
							);
							rotate(a = rotate)
							cylinder(h = diameter, r = radius, center = true);
						}
					}
				}
			}
		}
	}
}