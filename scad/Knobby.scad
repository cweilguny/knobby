////////////////////////////////////////////////////////////////////////////////
// ### CUSTOMIZABLE VARIABLES
////////////////////////////////////////////////////////////////////////////////
// How much mm should the knob add on top of the stick?
HEIGHT_ADDITION = 8;
// Grip type
GRIP_TYPE = "Circular"; // [Circular, Sausage, Without]

module __Customizer_Limit__() {}


////////////////////////////////////////////////////////////////////////////////
// ### OPENSCAD SPECIAL VARIABLES
////////////////////////////////////////////////////////////////////////////////
$fn = 24;


////////////////////////////////////////////////////////////////////////////////
// ### GLOBAL VARIABLES
////////////////////////////////////////////////////////////////////////////////
include <includes/Knobby Variables.scad>


////////////////////////////////////////////////////////////////////////////////
// ### UTILITY MODULES
////////////////////////////////////////////////////////////////////////////////
include <includes/Knobby Utilities.scad>


////////////////////////////////////////////////////////////////////////////////
// ### CALCULATION FUNCTIONS
////////////////////////////////////////////////////////////////////////////////
include <includes/Knobby Calculations.scad>


////////////////////////////////////////////////////////////////////////////////
// ### MAIN RENDERING
////////////////////////////////////////////////////////////////////////////////
main();


////////////////////////////////////////////////////////////////////////////////
// ### MODULES
////////////////////////////////////////////////////////////////////////////////
module main() {
    foot($fn = 60);
    top();
}

module foot() {
    difference() {
        cylinder(d = foot_diameter(), h = foot_height());
        tz(FOOT_NOSE_HEIGHT) cylinder(d = CONTROLLER_KNOB_DIAMETER, h = CONTROLLER_KNOB_HEIGHT);
        cylinder(d = CONTROLLER_KNOB_DIAMETER - FOOT_NOSE_WIDTH * 2, h = FOOT_NOSE_HEIGHT);
    }
}

module top() {
    tz(foot_height()) {
        top_dome($fn = 60);
        if (GRIP_TYPE != "Without") {
            top_grip();
        }
    }
}

module top_dome() {
    z_scale_offset = GRIP_TYPE == "Circular" ? - GRIP_CIRCULAR_PROTRUSION : 0;
    sz((HEIGHT_ADDITION + z_scale_offset) / foot_radius()) sphere_half(foot_diameter());
}

module top_grip() {
    top_grip_strip();
    rz(45) top_grip_strip();
    rz(90) top_grip_strip();
    rz(135) top_grip_strip();
}

module top_grip_strip() {
    if (GRIP_TYPE == "Circular") {
        grip_circular();
    } else if (GRIP_TYPE == "Sausage") {
        grip_sausage();
    }
}

module grip_sausage() {
    tz(HEIGHT_ADDITION / 2)
        rounded_cube([GRIP_SAUSAGE_LENGTH, GRIP_WIDTH, HEIGHT_ADDITION], GRIP_ROUNDING, true);
}

module grip_circular() {
    tz(GRIP_CIRCULAR_PROTRUSION)
        sz((HEIGHT_ADDITION - GRIP_CIRCULAR_PROTRUSION) / foot_radius())
            rx(90)
                rotate_extrude(angle = 180)
                    tx(foot_diameter() / 2 - GRIP_WIDTH / 2 - 0.2)
                        circle(d = GRIP_WIDTH);
}