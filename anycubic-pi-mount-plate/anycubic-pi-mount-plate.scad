// anycubic mounting plate for raspberry pi
// (c) 2021 John J. Tran

difference () {
  height = 4;

  // base plate
  union() {
    translate([-45,0,0]) cube([96,60,height]);
    translate([25,00,0]) cube([26,140,height]);
    translate([15,95,0]) cube([36,45,height]);
  }

  // carve-outs
  translate([-30,15,0]) cube([55,30,4]);
  translate([-35,6,0]) rounded_cylinder(r=1.5,h=height, n=1.75, $fn=60);
  translate([-35,6 + 45.0,0]) rounded_cylinder(r=1.5,h=height, n=1.75, $fn=60);

  // screw holes for camera
  x1 = 22; x2 = x1 + 21;
  y1 = 120; y2 = y1 + 12.5;
  r1 = 1.25;
  
    translate([x1,y1,0]) rounded_cylinder(r=r1,h=height, n=0.00, $fn=60);
  translate([x1,y2,0]) rounded_cylinder(r=r1,h=height, n=0.00, $fn=60);
  translate([x2,y1,0]) rounded_cylinder(r=r1,h=height, n=0.00, $fn=60);
  translate([x2,y2,0]) rounded_cylinder(r=r1,h=height, n=0.00, $fn=90);

  // camera well
  delta = 0.5;
  translate([x1 - 2 + 8.5 - delta, y1 - 4 - delta,0])
    cube([8 + 2 * delta, 8 + 2 * delta, height]);

  // camera cable slit
  translate([x1, 100 + 1.0, 0])
    cube([22,3,height]);
}

// camera stands
union() {
  x1 = 22; x2 = x1 + 21;
  y1 = 120; y2 = y1 + 12.5;
  r1 = 3.00;
  r2 = 1.0;
  height = 1.5;
  offset = 4.0;

  difference() {
    translate([x1,y1,offset]) rounded_cylinder(r=r1,h=height,n=0.0,$fn=60);
    translate([x1,y1,offset]) rounded_cylinder(r=r2,h=height,n=0.0,$fn=60);
  }
  
  difference() {
    translate([x1,y2,offset]) rounded_cylinder(r=r1,h=height,n=0.0,$fn=60);
    translate([x1,y2,offset]) rounded_cylinder(r=r2,h=height,n=0.0,$fn=60);
  }  

  difference() {
    translate([x2,y1,offset]) rounded_cylinder(r=r1,h=height,n=0.0,$fn=60);
    translate([x2,y1,offset]) rounded_cylinder(r=r2,h=height,n=0.0,$fn=60);
  }
  
  difference() {
    translate([x2,y2,offset]) rounded_cylinder(r=r1,h=height,n=0.0,$fn=60);
    translate([x2,y2,offset]) rounded_cylinder(r=r2,h=height,n=0.0,$fn=60);
  }  
}

// pi stands
union() {
  height = 8;
  r1 = 3.5;
  r2 = 1.0;
  offset = 4;

  x1 = -21.5; x2 = x1 + 58;
  y1 = 5; y2 = y1 + 49;

  translate([-45,25,offset]) cube([5,10,height]);

  difference() {
    translate([x1,y1,offset]) rounded_cylinder(r=r1,h=height,n=0.0,$fn=60);
    translate([x1,y1,offset]) rounded_cylinder(r=r2,h=height,n=0.0,$fn=60);
  }
  
  difference() {
    translate([x1,y2,offset]) rounded_cylinder(r=r1,h=height,n=0.0,$fn=60);
    translate([x1,y2,offset]) rounded_cylinder(r=r2,h=height,n=0.0,$fn=60);
  }
  
  difference() {
    translate([x2,y1,offset]) rounded_cylinder(r=r1,h=height,n=0.0,$fn=60);
    translate([x2,y1,offset]) rounded_cylinder(r=r2,h=height,n=0.0,$fn=60);
  }

  difference() {
    translate([x2,y2,offset]) rounded_cylinder(r=r1,h=height,n=0.0,$fn=60);
    translate([x2,y2,offset]) rounded_cylinder(r=r2,h=height,n=0.0,$fn=60);
  }  
}

module rounded_cylinder(r,h,n) {
  rotate_extrude(convexity=1) {
    offset(r=n) offset(delta=-n) square([r,h]);
    square([n,h]);
  }
}
