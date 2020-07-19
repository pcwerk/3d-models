thickness=3;		//material thickness
top=12; 				//inside mesurement of top surface
height=10;			//inside measurement of height
width=30;			//width of bracket
twoscrews=true;	//screw on one side only if false
screw=3.5;			//diameter of screw hole
matlabs=falsebrac;		//prints pads to improve bed adhesion if matlabs=true
t_abspads=0.5;		//thickness abs pads
r_abspads=4;		//radius abs pads

flange=3.0*screw+thickness+2;


module frame()
{
cube([flange,thickness,width]);
translate ([flange-thickness,0,0]) cube([thickness,height+thickness,width]);
translate ([flange-thickness,height,0]) cube([top+2*thickness,thickness,width]);

if (twoscrews==true)
{
translate ([flange+top,0,0]) cube([thickness,height+thickness,width]);
translate ([flange+top,0,0]) cube([flange,thickness,width]);
}
else
translate ([flange+top,(height+thickness)/3*2,0]) cube([thickness,(height+thickness)/3,width]);


if (matlabs==true)
{
translate([0,thickness/2,0]) cylinder(t_abspads,r_abspads,r_abspads,$fn=60);
translate([flange-thickness,height+thickness/2,0]) cylinder(t_abspads,r_abspads,r_abspads,$fn=60);
translate([flange+top+thickness,height+thickness/2,0]) cylinder(t_abspads,r_abspads,r_abspads,$fn=60);
if (twoscrews==true)
translate([2*flange+top,thickness/2,0]) cylinder(t_abspads,r_abspads,r_abspads,$fn=60);
else
translate([flange+top+thickness/2,(height+thickness)/3*2,0]) cylinder(t_abspads,r_abspads,r_abspads,$fn=60);
}
}

module holes()
{
//hex holes will be undersized by cos(180/6) hence compensation included
translate ([(flange-thickness)/2,-0.1,width/2]) rotate([-90,0,0]) cylinder (thickness+0.2,screw/cos(180/6)/2,screw/cos(180/6)/2,$fn=6);
translate ([flange+top+thickness+(flange-thickness)/2,-0.1,width/2]) rotate([-90,0,0]) cylinder (thickness+0.2,screw/cos(180/6)/2,screw/cos(180/6)/2,$fn=6);
}

difference()
{
frame();
holes();
}