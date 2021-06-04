function controller_knob_diameter() = CONTROLLER == "PS4" ? CONTROLLER_PS4_KNOB_DIAMETER : CONTROLLER_XBOX_KNOB_DIAMETER;
function controller_knob_height() = CONTROLLER == "PS4" ? CONTROLLER_PS4_KNOB_HEIGHT : CONTROLLER_XBOX_KNOB_HEIGHT;

function foot_diameter() = controller_knob_diameter() + 2 * FOOT_WALL_WIDTH;
function foot_radius() = foot_diameter() / 2;
function foot_height() = controller_knob_height() + FOOT_NOSE_HEIGHT;
