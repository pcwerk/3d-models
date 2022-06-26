// lab kits for rPi and arduino
// (c) 2021 John J. Tran

difference() {
    union() {
      cube([100,100,100]);
    };
    union() {
      translate([10,5,5]) cube([90,90,90]);  
    };
    union() {
      translate([70,50,0]) cylinder(10,4,4);
      translate([62,50,0]) cylinder(10,7,7);        
    }
}

