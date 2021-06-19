#include <string.h>
#include "lcd.h"

const char message[] = "     KW6502                               Hello World!";

void init_lcd() {
    write_ddrb(0b11111111);         // Set all pins on data direction register B to output
    write_ddra(0b11100000);         // Set top 3 pins on data direction register A to output
    lcd_instruction(0b00111000);    // Set 8-bit mode; 2-line display; 5x8 font
    lcd_instruction(0b00001100);    // Display on; cursor off; blink off
    lcd_instruction(0b00000110);    // Increment and shift cursor; don't shift display
    lcd_instruction(0b00000001);    // Clear display
}

int main() {
    int i;

    init_lcd(); // Initialize LCD
    
    // Loop through all characters
    for (i = 0; i < strlen(message); i++){
        write_lcd(message[i]);  // Write character to LCD
    }

    return 0;
}