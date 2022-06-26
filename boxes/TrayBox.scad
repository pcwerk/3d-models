// Title: TrayBox
// Author: http://www.thingiverse.com/Jinja
// Date: 14/9/2012

/////////// START OF PARAMETERS /////////////////

tray_width = 154;
tray_length = 154;
tray_depth = 50;
tray_gap = 0.7;
tray_fit = 0.05;
tray_fit_depth = 5;
wall_size = 0.6*5;
lip_size = 1;

/////////// END OF PARAMETERS /////////////////

// uncomment the pieces you want added...
// inner_tray();
outer_tray();

///////////////////////////////////////////////


base_width = tray_width + 4*wall_size;
base_length = tray_length + (4*wall_size) + (2*lip_size);

module inner_tray()
{
	translate([-wall_size, -wall_size-lip_size, 0] )
	cube( [base_width, base_length, wall_size] );

	difference()
	{
		union()
		{
			translate([tray_fit, tray_fit,0])
			cube( [tray_width+(2*wall_size)-(2*tray_fit), tray_length+(2*wall_size)-(2*tray_fit), tray_fit_depth] );
			translate([tray_gap, tray_gap,0])
			cube( [tray_width+(2*wall_size)-(2*tray_gap), tray_length+(2*wall_size)-(2*tray_gap), tray_depth+wall_size] );
		}
		translate([wall_size,wall_size,wall_size])
		cube( [tray_width, tray_length, tray_depth+0.1] );
	}
}

module outer_tray()
{
	translate( [base_width + 5, 0, 0 ])
	{
		translate([-wall_size, -wall_size-lip_size, 0] )
		cube( [base_width, base_length, wall_size] );
	
		difference()
		{
			union()
			{
				translate([-wall_size, -wall_size, 0] )
				cube( [tray_width+(4*wall_size), tray_length+(4*wall_size), tray_depth+wall_size] );
			}
			translate([0,0,wall_size])
			cube( [tray_width+(2*wall_size), tray_length+(2*wall_size), tray_depth+0.1] );
		}

	}
}
