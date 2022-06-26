// lab kits for rPi and arduino
// (c) 2021 John J. Tran

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
		difference() {
			cube([width,depth,floor_thickness]);
			// translate([10,10,0]) linear_extrude(floor_thickness) text("abb-mega-v2", size=6);
		}
	}
}

module honeycomb(r, thickness=1, cols=0, rows=0, center=false) {
  translate([ // if center is true, calculate total size and translate accordingly
    center ? ( cols * r / tan(30) + (r + thickness) / tan(30) / 2 ) /-2 : 0,
    center ? ( rows * r * sin(30) + (rows+0.5) * r + thickness ) /-2 : 0
  ])
  translate([ (r+thickness/2) / 2 / tan(30), r+thickness/2])  // Move so it starts at 0, 0
  for (j = [ 0 : 1 : rows-1 ] ) {  // Iterate rows
    translate([ r / 2 / tan(30) * (j%2) , j * (r + r * sin(30)) ])
    for (i = [ 0 : 1 : cols-1 ]) { // Iterate columns
      translate([ i * ( r / tan(30) ) , 0]) rotate([0, 0, 90]) {

        // Make the hexagons
        if (thickness==0) {
          circle(r, $fn=6);
        }
        else {
          difference() {
            circle(r+thickness/2, $fn=6);
            circle(r-thickness/2, $fn=6);
          }
        }
      }
    }
  }
}

// outer box
translate([0,0,0]) union() {
    w = 102; d = 124; h = 4;
    drawer_divider(width=w, depth=d, height=h,
        internal_wall=2.0,
        external_wall=2.0,
        x_compartments=1,
        y_compartments=2,
        floor_thickness=2.0,
        floor=0);
}

// lower box
translate([0,2,0]) union() {
  h = 2;
  difference() {
    cube([100,60,h]);
    translate([15,10,0]) cube([60,45,h]);
  }

  translate([5,7.5,0]) linear_extrude(height=h) honeycomb(r=6, thickness=2, cols=7, rows=5, center=false);
}

// upper box
translate([0,63,0]) difference() {

    difference() {
        dx = 102; dy = 90; dz = 4;
        x1 = 0.0; y1 = 0.0; z1 = 0.0;
        // translate([x1, y1 ,z1]) cube([dx,dy,dz]);
        // translate([x1+10, y1+2 ,z1]) cube([dx-34,dy-35,dz]);
    }

    union() {
        dx = 2.3; dy = 4.5; dz = 4.0;
        x1 = 8.0;
        y1 = 4.0;
        y2 = y1 + 23.0;
        y3 = y2 + 23.0;

        // translate([x1,y1,0]) cube([dx,dy,dz]);
        // translate([x1,y2,0]) cube([dx,dy,dz]);
        // translate([x1,y3,0]) cube([dx,dy,dz]);
    }

    union() {
        dx = 4.5; dy = 2.3; dz = 8.0;
        y1 = 59.0;
        x1 = 15.0;
        x2 = x1 + 54.5;

        // translate([x1,y1,0]) cube([dx,dy,dz]);
        // translate([x2,y1,0]) cube([dx,dy,dz]);
    }

}
