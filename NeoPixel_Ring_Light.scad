//
//	NeoPixel Ring Light Holder
//
// 	Adafruit makes a 24 LED ring that would make a great lens ring light
// 		http://www.adafruit.com/products/1586
// 	it's even about the right size to fit around a lens with a 52 mm filter thread
// 	Unfortunately, there's not an obvious way to fit it
// 	
// 	This is a holder that fits over a Tiffen 52 mm UV filter
// 	and holds the NeoPixel Ring plus a diffuser lens
//


$fa=1;

uv_filter_OD = 54+0.2;
//uv_filter_OD = 54+0.1;		// V2
//uv_filter_OD = 54;			// V1
uv_filter_thickness = 5;

shelf_thickness = 1;

neopixel_ID = 52.2;
neopixel_OD = 65.5+0.2;
//neopixel_OD = 65.5+0.1;		// V2
//neopixel_OD = 65.5;			// V1
neopixel_thickness = 3.1;

diffuser_thickness = 4;

walls = 1.6;

cut_out_width = 3;
//cut_out_width = 2;	// V1
cut_out_separation=10;



difference() {

union() {

// filter shroud
difference() {
translate( v=[0,0,((uv_filter_thickness+shelf_thickness)/2)] ) {
cylinder( h=(uv_filter_thickness+shelf_thickness), r=((neopixel_OD+walls+walls)/2), center=true);
//cylinder( h=(uv_filter_thickness+shelf_thickness), r=((uv_filter_OD+walls+walls)/2), center=true);
}
cylinder( h=(uv_filter_thickness*4), r=(uv_filter_OD/2), center=true );
}

// shelf
translate( v=[0,0,uv_filter_thickness+shelf_thickness] ) {
difference() {
cylinder( h=shelf_thickness, r=((neopixel_OD+walls+walls)/2), center=true );
cylinder( h=shelf_thickness*2, r=(52/2), center=true );
}
}

// NeoPixel shroud
translate( v=[0,0,(((neopixel_thickness+diffuser_thickness)/2)+(uv_filter_thickness+shelf_thickness)+(shelf_thickness/2))] ) {
difference(){
cylinder( h=(neopixel_thickness+diffuser_thickness), r=((neopixel_OD+walls+walls)/2), center=true );
cylinder( h=((neopixel_thickness+diffuser_thickness)*2), r=(neopixel_OD/2), center=true );
}
}

}

difference() {
cylinder( h=100, r=(neopixel_OD/2), center=true);
cylinder( h=200, r=((neopixel_OD/2)-(cut_out_width/2)), center=true);
cube( size=[200,cut_out_separation,200], center=true );
cube( size=[cut_out_separation,200,200], center=true );
}

}


