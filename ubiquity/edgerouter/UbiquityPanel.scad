module support(){
hull(){
    translate([59,35,75])
    rotate([0,90,0])
    cylinder(h=3, d=5);
    translate([59,35,5])
    rotate([0,90,0])
    cylinder(h=3, d=5);
    translate([59,55,5])
    rotate([0,90,0])
    cylinder(h=3, d=5);
}
}

//cloud Key dimensions
    ckl=121.9;
    ckw=43.4;
    ckh=21.7;

//keystone dimensions
    ksw=14.55;
    ksh=16.15;

//vent dimensions
    vspace=1;
    vcount=11;
    vwidth=10.2;

//generate mock cloudkey
//translate([-ckw/2,35,5])
//cube([ckw,ckh,ckl]);


//ck();
// usg();
// vent();

difference() {
    union () {
        rotate([90,0,0]) mirror([0,1,0]) edgeRouter();
        // rotate([90,0,0]) mirror([0,1,0]) edgeRouterEnd();
    }
    translate([100,-50,72.5])
       rotate([90,0,180])
       cylinder(h=25,d=3.0);
    translate([50,-50,72.5])
       rotate([90,0,180])
       cylinder(h=25,d=3.0);    
}

// usg();

module edgeRouter() {
  // translate([80,5,22.5])rotate([90,180,0]) import("./Ubiquiti-usg-middle.stl");
  difference() {  
    import("./Ubiquiti_EdgeRouter_X_Rack_mount_19inch_-_easier_v1.stl");
    // translate([145,-10,0]) cube([5,14,45]);
  }
  difference() {
    translate([145,-10,0]) cube([5,14,45]);
    translate([145,-5,9.5])
      rotate([90,0,90])
      cylinder(h=10,d=4);
    translate([145,-5,22.5])
      rotate([90,0,90])
      cylinder(h=10,d=3.5);
    translate([145,-5,35.5])
      rotate([90,0,90])
      cylinder(h=10,d=4);
  }
  translate([138.25,0,0]) cube([10,5,45]);
  translate([20,0,0]) cube([120,5,11.5]);
  // translate([27,-75,37]) cube([110,80,3.5]);
}

module edgeRouterEnd() {
  translate([28,-75,3.5]) cube([90,5,31.5]);
}


module usg(){
//USG panel
import("./Ubiquiti-usg-middle.stl");
// translate([1,-50,0])
// support();
// translate([-135,-50,0])
// support();

}

module ck(){

    difference(){
        translate([0,50,0])
        //CK panel
        import("./Ubiquiti_EdgeRouter_X_Rack_mount_19inch_-_easier_v1.stl");
        //velcro cutouts
        hull(){
            translate([ckw/2+2,40,50])
            rotate([90,0,0])
            cylinder(h=10, d=3);
            translate([ckw/2+2,40,70])
            rotate([90,0,0])
            cylinder(h=10, d=3);
        }
        hull(){
            translate([-ckw/2+2,40,50])
            rotate([90,0,0])
            cylinder(h=10, d=3);
            translate([-ckw/2+2,40,70])
            rotate([90,0,0])
            cylinder(h=10, d=3);
        }
    }
    support();
    translate([-121,0,0])
    support();



difference(){

translate([-69,35,0])
    cube([136,35,5]);
$fa=1;


    hull(){
        //ck cutout
        translate([ckw/2,56,-1])
        cylinder(h=15, d=5);
        translate([-ckw/2,56,-1])
        cylinder(h=15, d=5);
        translate([-ckw/2,40,-1])
        cylinder(h=15, d=5);
        translate([ckw/2,40,-1])
        cylinder(h=15, d=5);
        }
        //keystone
        translate([35,40,-1])
        cube([ksw,ksh,10]);
    }
    
    
    
}    
    
module vent(){
    
    difference() {
    translate([0,100,0])
    import("./Ubiquiti_EdgeRouter_X_Rack_mount_19inch_-_easier_v1.stl");
    translate([-80,75,5])
    color("red")
    cube([150,20,140]);
    }
    
    for (i = [0:vcount]){
        translate([-73+(i*(vwidth+vspace)),85,0])
        cube([vwidth,30,5]);
    }

}

