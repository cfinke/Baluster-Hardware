$fs = 0.1; $fa = 1;

/**
 * Originally designed to fit these two baluster models:
 *
 * Straight: https://www.homedepot.com/p/EVERMARK-Stair-Parts-44-in-x-1-2-in-Matte-Black-Plain-Iron-Baluster-for-Stair-Remodel-I555B-044-HD00D/202088527
 * Oval: https://www.homedepot.com/p/EVERMARK-Stair-Parts-44-in-x-1-2-in-x-3-3-4-in-Matte-Black-Oval-Iron-Baluster-for-Stair-Remodel-I564B-044-HD00D/316139815
 */
 
shoe_width = 34;
shoe_height = 7;
insert_width = 12.75; // For straight
// insert_width = 12.5; // For oval
shoe_wall_thickness = 4;
shoe_corner_radius = 2;

difference() {	
	// The rounded body of the shoe.
	minkowski() {
		difference() {
			linear_extrude( height = shoe_height - shoe_corner_radius ) {
				difference() {
					square( size = shoe_width - ( 2 * shoe_corner_radius ), center = true );
				}
			}
		}
		
		sphere( r = shoe_corner_radius );
	}
	
	// The negative space underneath
	linear_extrude( height = shoe_height - shoe_wall_thickness ) {
		square( size = shoe_width - shoe_wall_thickness, center = true );
	}
	
	// The hole for the baluster.
	linear_extrude( height = shoe_height ) {
		square( size = insert_width, center = true );
	}
	
	// Cut off the bottom where it was rounded underneath.
	translate( [ 0, 0, -shoe_corner_radius ] ) {
		linear_extrude( height = shoe_corner_radius ) {
			square( size = shoe_width, center = true );
		}
	}
}

