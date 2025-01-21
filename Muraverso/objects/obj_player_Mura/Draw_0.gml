draw_self();

if (invincible) {
    image_alpha = (image_alpha == 1) ? 0.5 : 1; // Blinking effect
} else {
    image_alpha = 1; // Normal visibility
}