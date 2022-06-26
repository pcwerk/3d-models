// lab kits for rPi and arduino
// (c) 2021 John J. Tran

difference() {
    union() {
      rotate([90,0,90]) import("ArduinoBreadBoard.STL");
      cube([90,62,1.5]);
    };
    
    union() {
        dy = 4.5; dx = 2.3; dz = 8.0;
        x1 = 1.5;
        y1 = 6.5;
        y2 = y1 + 23.0;
        y3 = y2 + 23.0;
        z  = 1.5;
        
        translate([x1,y1,z]) cube([dx,dy,dz]);
        translate([x1,y2,z]) cube([dx,dy,dz]);
        translate([x1,y3-0.5,z]) cube([dx,dy+0.5,dz]);
    }
    
    union() {
        dx = 4.5; dy = 2.3; dz = 8.0;
        y1 = 59.5;
        x1 = 14.5;
        x2 = x1 + 55.5;
        z  = 1.5;
        translate([x1,y1,z]) cube([dx + 0.5,dy,dz]);
        translate([x2,y1,z]) cube([dx,dy,dz]);
    }

    // bottom plate
    union () {
        dx = 70.0; dy = 42.0; dz = 1.5;
        x1 = 0; y1 = 0; z1 = 0.0;
        // translate([x1 + 10, y1 + 10 ,z1 + 0.5]) cube([dx,dy,dz]);
    }

    // engraving
    union() {
        translate([10,10,0.0]) linear_extrude(4) text("abb-v1.5", size=10, font="Boston Traffic:style=Regular");
    }
}

