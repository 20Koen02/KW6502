#ifndef _LCD_H
#define _LCD_H

extern void __fastcall__ lcd_instruction(char instruction);
extern void __fastcall__ write_lcd(char character);
extern void __fastcall__ write_ddra(char instruction);
extern void __fastcall__ write_ddrb(char instruction);

#endif