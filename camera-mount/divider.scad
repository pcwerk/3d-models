

module core_stl() {
   import("./Wallmount_strong.stl");
} 


difference() {
union() {
   translate([-10,-5,0]) cube([11,12.4,30]);
   translate([16,27.3,0]) cube([5,5,20]);
   translate([16,-29.9,0]) cube([5,5,20]);
   translate([-40,-10,25]) core_stl();
}
translate([-20,1.0,20]) rotate([00,90,0]) 
cylinder(40,3,3);
}

