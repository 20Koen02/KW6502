; This script is useful for pasting slowly to the serial monitor.

SetKeyDelay, 30

F1::
Sendraw, %Clipboard%
Return