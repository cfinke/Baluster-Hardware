$fs = 0.1; $fa = 1;

/**
 * Originally designed to fit these two baluster models:
 *
 * Straight: https://www.homedepot.com/p/EVERMARK-Stair-Parts-44-in-x-1-2-in-Matte-Black-Plain-Iron-Baluster-for-Stair-Remodel-I555B-044-HD00D/202088527
 * Oval: https://www.homedepot.com/p/EVERMARK-Stair-Parts-44-in-x-1-2-in-x-3-3-4-in-Matte-Black-Oval-Iron-Baluster-for-Stair-Remodel-I564B-044-HD00D/316139815
 */

hole_diameter = 16.75;
insert_height = 14;
insert_diameter = 13; // Straight
// insert_diameter = 12.25; // Oval

lip_diameter = 20;
lip_thickness = 2;

corner_radius = 1;

transition_length = 4;
baluster_width = 13; // for straight
// baluster_width = 14; // for oval


difference() {
	union() {
		cylinder( h = insert_height, d = hole_diameter - 1  );
		
		linear_extrude( height = lip_thickness ) {
			circle( d = lip_diameter );
		}
		
		linear_extrude( height = insert_height * 0.75 ) {
			square( size = [ hole_diameter, 1 ], center = true ) ;
			rotate( [ 0, 0, 90 ] ) square( size = [ hole_diameter, 1 ], center = true ) ;
		}

	}
	
	hull() {
		linear_extrude( insert_height ) {
			circle( d = insert_diameter );
		}
	
		translate( [0, 0, -transition_length - 1 ] ) {
			linear_extrude( 1 ) {
				square( size = [ baluster_width, baluster_width ], center = true );
			}
		}
	}
}