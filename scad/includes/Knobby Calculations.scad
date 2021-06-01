function foot_diameter() = CONTROLLER_KNOB_DIAMETER + 2 * FOOT_WALL_WIDTH;
function foot_radius() = foot_diameter() / 2;
function foot_height() = CONTROLLER_KNOB_HEIGHT + FOOT_NOSE_HEIGHT;

function grip_sausage_length() = GRIP_STRENGTH == "Strong" ? GRIP_SAUSAGE_LENGTH_STRONG : GRIP_SAUSAGE_LENGTH_SLIGHT;
function grip_circular_protrusion() = GRIP_STRENGTH == "Strong" ? GRIP_CIRCULAR_PROTRUSION_STRONG : GRIP_CIRCULAR_PROTRUSION_SLIGHT;
