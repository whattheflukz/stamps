abet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^&*()_+";
length = len(abet);
y_rows=7;
magnet_depth = 3.5;
magnet_resolution = 60;
x_clearance = 17;
y_clearance = 18;
for (y_pos=[0:1:y_rows-1]) {
    y = y_pos * y_clearance;
    echo("x start: ",(y_pos*(y_rows/length)));
    for(x_pos=[0:1:(length/y_rows)-1]) {
        x = x_pos * x_clearance;
        difference(){
            translate([x-1,y,0])
            cube(size = [14.5, 15, 25], center = false);
            
            color("blue")
            translate([-1.5+x,7.25+y,17.5])
            rotate([0,90,0])
            cylinder(h=magnet_depth,r=3,$fn=magnet_resolution);
        
            color("blue")
            translate([-1.5+x,7.25+y,7.5])
            rotate([0,90,0])
            cylinder(h=magnet_depth,r=3,$fn=magnet_resolution);
        
            color("blue")
            translate([10.5+x,7.25+y,17.5])
            rotate([0,90,0])
            cylinder(h=magnet_depth,r=3,$fn=magnet_resolution);
        
            color("blue")
            translate([10.5+x,7.25+y,7.5])
            rotate([0,90,0])
            cylinder(h=magnet_depth,r=3,$fn=magnet_resolution);
        }
        translate([x+6,y+7.5,-2])
        color("red")
        linear_extrude(3)
        text(abet[x_pos+(length/y_rows*y_pos) ],size=10.3,font="American Typewriter:style=Regular",halign="center", valign = "center");
    }
}
