$fs = 0.1; $fa = 1;

/**
 * Originally designed to fit these two baluster models:
 *
 * Straight: https://www.homedepot.com/p/EVERMARK-Stair-Parts-44-in-x-1-2-in-Matte-Black-Plain-Iron-Baluster-for-Stair-Remodel-I555B-044-HD00D/202088527
 * Oval: https://www.homedepot.com/p/EVERMARK-Stair-Parts-44-in-x-1-2-in-x-3-3-4-in-Matte-Black-Oval-Iron-Baluster-for-Stair-Remodel-I564B-044-HD00D/316139815
 */

hole_diameter = 16.75;
insert_height = 20;
insert_diameter = 13.25; // For straight balusters
//insert_diameter = 12.25; // For oval balusters
lip_diameter = 20;
lip_thickness = 2;

corner_radius = 1;

transition_length = ( 3 / 16 ) * 25.4;
baluster_width = 13; // For straight balusters
//baluster_width = 14; // For oval balusters
angle = 31.6; // Angle of the handrail relative to the ground.

intersection() {
	difference() {
		union() {
			cylinder( h = insert_height, d = hole_diameter - 1  );
			
			translate( [lip_diameter / 2, 0, lip_thickness ] )  {
				rotate( [0, angle, 0 ] ) {
					translate( [ 0, 0, -100 ] ) {
						linear_extrude( height = 100 ) {
							square( size = [ 100, 100 ], center = true );
						}
					}
				}
			}

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
		
		translate( [lip_diameter / 2, 0, 0 ] )  {
			rotate( [0, angle, 0 ] ) {
				translate( [ 0, 0, -100 ] ) {
					linear_extrude( height = 100 ) {
						square( size = [ 100, 100 ], center = true );
					}
				}
			}
		}
		

	}
	
	cylinder( h = insert_height, d = lip_diameter );
}