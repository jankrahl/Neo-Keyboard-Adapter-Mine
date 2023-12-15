module case(){
    translate([0, 0, 2]) { // bring to ground level
        difference () {
            // case bounding cube:
            translate([-2,-6.8,-2]) {
                cube([23,6.8+8.2+29+7,16]);
            }
            // interior space cut out:
            union() {
                // base
                translate([0,0,0]) {
                    cube([19,39,7], false);
                }
                // upper base
                translate([0,8.2,4]) {
                    cube([19,33,8], false);
                }
                // usb A
                translate([2.5,-6.8,4]) {
                    cube([14,15,7], false);
                }
                // micro usb
                translate([11/2,8.2+29,8.8]) {
                    cube([8,7,2.4], false);
                }
            }
        }
    }
}




// bottom half (9mm height):
translate([0, 0, 1]) { // translate back to ground level
    difference() {
        translate([10, 0, -1]) { // cut of 1mm less bottom
            case();
        }
        difference() {
            // cut off
            translate([0, 0, 16]) {
                cube([300, 300, 16], true);
            }
            // add hook 1 bottom
            translate([19.5, -2, 9-0.05]) {
                cube([19-0.2, 4-0.2, 2-0.1], true);
            }
            // add hook 2 bottom
            translate([19.5, 43, 9-0.05]) {
                cube([17-0.2, 4, 5-0.1], true);
            }
        }


    }
}


// bottom half (7mm height):
translate([0, 0, -1]) { // translate back to ground level

    difference() {
        translate([0, 0, 16 + 1]) { // cut of 1mm more top
            rotate([0, 180, 0]) { // rotate for top half
                case();
            }
        }

        // cut off
        translate([0, 0, 16]) {
            cube([300, 300, 16], true);
        }

        // add hook 1 top
        translate([-9.5, -2, 7]) {
            cube([19, 4, 2], true);
        }
        // add hook 2 top
        translate([-9.5, 43, 7]) {
            cube([17, 4, 5], true);
        }
    }
}
