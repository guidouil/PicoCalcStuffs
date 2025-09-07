'w95.bas
Play wav "w95.wav"
bl=RGB(0,0,255)
wh=RGB(255,255,255)
gr=RGB(123,123,123)
b=RGB(0,0,0)
For i=0 To 30
 CLS gr:CLS b: CLS gr
Next i
CLS bl
Font 2
Color bl,wh
Text 110,70," Windows "
Font 7
Color wh,bl
Text 10,110,"Am error has occured. To continue:"
Text 10,130,"Press Enter to return to Windows, or"
Text 10,150,"Press CTL+ALT+DEL to restart your computer. If you"
Text 10,160,"do this, you will lose any unsaved information"
Text 10,170,"in all open applications."
Text 10,190,"Error: OE : 016F : BFF983D4"
Text 90,220,"Press any key to continue"
Do
 If Inkey$<>"" Then turnoff()
 Line 245,226,250,226,,wh
 Pause 500
 Line 245,226,250,226,,bl
 Pause 500
Loop

Sub turnoff()
 CLS b
 Font 2,3
 Color RGB(150,0,0),b
 Text 10,10,"It's now"
 Text 25,70,"safe to"
 Text 10,130,"turn off"
 Text 90,190,"your"
 Text 5,250,"computer."
 Do
  If Inkey$<>"" Then CLS b:End
 Loop
End Sub
