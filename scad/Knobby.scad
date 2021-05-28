////////////////////////////////////////////////////////////////////////////////
// ### CUSTOMIZABLE VARIABLES
////////////////////////////////////////////////////////////////////////////////
// Width of the spool
HEIGHT_ADDITION = 8;

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
        top_grip();
    }
}

module top_dome() {
    sz(HEIGHT_ADDITION / foot_radius()) sphere_half(foot_diameter());
}

module top_grip() {
    top_grip_strip();
    top_grip_strip();
}

module top_grip_strip() {
    tz(HEIGHT_ADDITION / 2) rounded_cube([GRIP_LENGTH, GRIP_WIDTH, HEIGHT_ADDITION], GRIP_ROUNDING, true);
    rz(45) tz(HEIGHT_ADDITION / 2) rounded_cube([GRIP_LENGTH, GRIP_WIDTH, HEIGHT_ADDITION], GRIP_ROUNDING, true);
    rz(90) tz(HEIGHT_ADDITION / 2) rounded_cube([GRIP_LENGTH, GRIP_WIDTH, HEIGHT_ADDITION], GRIP_ROUNDING, true);
    rz(135) tz(HEIGHT_ADDITION / 2) rounded_cube([GRIP_LENGTH, GRIP_WIDTH, HEIGHT_ADDITION], GRIP_ROUNDING, true);
}