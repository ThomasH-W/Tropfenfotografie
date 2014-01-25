## Tropfenfotografie mit Raspberry und Lichtschranke ##

In der c't Hardware Hacks 01/13 wurde beschrieben, wie man Tropfen fotografiert. Der Aufbau basierte auf einem Arduino. 
Dieser Artikel beschreibt die Umsetzung mit einem Raspberry Pi. Weiterhin habe ich Funkauslöser für Kamera und Blitz eingesetzt.

(Eine Zeitmessung mit zwei Lichtschranken findet man hier: http://www.hoeser-medien.de/?p=1212) 
Für Einstellungen der Kamera gibt es hier Ratschläge: http://www.tropfenfotografie.de


![](http://www.hoeser-medien.de/pictures/flash-1-Tropfen.jpg)


![](http://www.hoeser-medien.de/pictures/flash-2-aufbau-1.jpg)
 

Beim ersten Versuch habe ich eine Spritze genommen. Später soll an dem Galgen eine Flasche hängen.

Die Schraube dient dazu, die Kamera zu fokussieren.

Hinter der mattierten Scheibe befindet sich ein zweiter Blitz.

 

Die Gartenschlauch-Kupplung dient als Lichtschranke. Unten wurde ein entsprechendes Loch gebohrt, um die IR-Diode bzw. den Fototransistor einzuführen.

 
Was wird benötigt ?

    Digitalkamera
    Funkauslöser (optional) Funktioniert nicht: Siehe Validation ganz unten
    Studioblitz (optional)
    Raspberrry PI
    Elektronik-Interface (s.u.)
    Software:
    flash.c (s.u.)
    wiringPI

Software

Die Auslösung der Lichtschranke wird über einen Interrupt erkannt. WiringPi bietet eine einfache Lösung hierfür. In der Interrupt-Service-Routine (ISR) wird eine bestimmte Zeit gewartet, und dann der Ausgang geschaltet. Nach jedem Interrupt, wird die Wartezeit etwas erhöht, um den Tropfen in verschiedenen Phasen zu fotografieren.

 
## Installation wiringPi ##

`cd; 
git clone git://git.drogon.net/wiringPi; 
cd wiringPi;
./build`

Installation argtable2

    sudo apt-get install libargtable2-dev


## Programm compilieren + starten ##

 
`make
sudo ./flash`

 
Anpassung für den Testaufbau:
   

    sudo ./flash -s 100 -i 10 -d 20

Parameter

    -s 100  # Fallzeit erechnet auf Fallhöhe
    -i 10     # Inkrement für den nächsten Durchlauf
    -d 20  # Auslöseverzögerung  (Funkauslöser + Kamera)


Weitere Info: 
[http://www.hoeser-medien.de/?p=1184](http://www.hoeser-medien.de/?p=1184)

Weitere Bilder:
[http://www.hoeser-medien.de/?p=1267](http://www.hoeser-medien.de/?p=1267)