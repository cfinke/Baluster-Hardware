$fs = 0.1; $fa = 1;

/**
 * Originally designed to fit these two baluster models:
 *
 * Straight: https://www.homedepot.com/p/EVERMARK-Stair-Parts-44-in-x-1-2-in-Matte-Black-Plain-Iron-Baluster-for-Stair-Remodel-I555B-044-HD00D/202088527
 * Oval: https://www.homedepot.com/p/EVERMARK-Stair-Parts-44-in-x-1-2-in-x-3-3-4-in-Matte-Black-Oval-Iron-Baluster-for-Stair-Remodel-I564B-044-HD00D/316139815
 */
 
 /** Print with supports **/

hole_diameter = 19.25;
// hole_diameter = 19.75; // For holes that were more worn
hole_depth = 10;
insert_width = 13; // For straight
//insert_width = 12.75; // For oval
insert_floor_thickness = 2;
insert_depth = hole_depth - insert_floor_thickness;
screw_head_diameter = 9;
screw_thread_diameter = 4.5;

lip_width = 29.5;
lip_thickness = 2;

corner_radius = 1;

difference() {
	union() {
		cylinder( h = hole_depth, d2 = hole_diameter - .5, d1 = hole_diameter ); // Allow space for friction ridges
		
		linear_extrude( height = lip_thickness ) {
			square( size = [ lip_width, lip_width ], center = true );
		}
		
		// External friction ridges
		linear_extrude( height = hole_depth * 0.75 ) {
			square( size = [ hole_diameter + .5, 1 ], center = true ) ;
			rotate( [ 0, 0, 90 ] ) square( size = [ hole_diameter + .5, 1 ], center = true ) ;
		}

	}
	
	linear_extrude( insert_depth ) {
		square( size = [ insert_width, insert_width ], center = true  );
	}
}

// Internal friction ridges
linear_extrude( height = hole_depth * 0.75 ) {
	difference() {
		union() {
			square( size = [ hole_diameter, 1 ], center = true ) ;
			rotate( [ 0, 0, 90 ] ) square( size = [ hole_diameter, 1 ], center = true ) ;
		}
		
		square( size = [ insert_width - 0.5, insert_width - 0.5 ], center = true );
	}
}
	
	
