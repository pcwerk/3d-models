
difference() {
    union () {
        rotate([90,0,0]) RackPi_4();
    } 
}

module RackPi_4() {
  difference() {  
    import("./RackPi_4.stl");
    translate([-44.40,8,-12]) rotate([90,0,0]) cylinder(h=10,d=3.0);
    translate([-44.40,8,12]) rotate([90,0,0]) cylinder(h=10,d=3.0);
    translate([-21,8,-12]) rotate([90,0,0]) cylinder(h=10,d=3.0);
    translate([-21,8,12]) rotate([90,0,0]) cylinder(h=10,d=3.0);
  }

}


