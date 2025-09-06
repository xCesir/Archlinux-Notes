# update HP
Bei meinem HP-Laptop mit UEFI gab es keine offensichtliche Möglichkeit, das Gerät unter Linux zu aktualisieren, da im UEFI selbst kein entsprechender Eintrag existierte, wie in vielen Tutorial-Videos von HP zu sehen ist. Nach längerer Suche habe ich herausgefunden, dass es bei HP einen „speziellen” Update-Weg gibt.

1. Auf der HP-Support-Seite https://support.hp.com/de-de/drivers nach dem Gerät suchen. In meinem Fall war das „HP Laptop 17-cp2148ng (9Q9K1EA)”.
2. Wählen Sie Windows als Betriebssystem aus und laden Sie unter BIOS die neueste Datei herunter. Sollte ein Pop-up ein Helfer-Tool empfehlen, klicken Sie es einfach weg.
3. Mit dem Tool in einer Windows-VM einen „Rescue USB-Stick” zum Updaten erstellen.
4. Den Laptop ausschalten, den USB-Stick einstecken und Strom anschließen. Dann Power + Windows + B für 2–3 Sekunden gedrückt halten, Power loslassen und Windows + B weiterhin gedrückt halten. Es startet ein automatisches Update. (https://support.hp.com/us-en/document/ish_3932413-2337994-16)
