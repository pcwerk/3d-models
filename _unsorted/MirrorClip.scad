include <mcad/boxes.scad>;

ClipThickness = 5;
MirrorThickness = 4;
ScrewDiameter = 4;

difference()
{
roundedBox([30,14,ClipThickness+MirrorThickness],4,true);
#translate([-7.5,0,0]) cylinder(ClipThickness+MirrorThickness+1,ScrewDiameter/2,ScrewDiameter/2,true);
#translate([8,0,ClipThickness/2]) cube([16,15,MirrorThickness],center=true);
}