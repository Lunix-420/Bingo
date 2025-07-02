# 👑 Bingo Royal - Das ultimative Multiplayer-Tile-Game 🎮

Willkommen zu **Bingo Royal**, dem ultimativen Multiplayer-Bingo-Game mit Flutter-Frontend und ExpressJS-Backend! 🕹️✨ Erstelle dein eigenes Tileset, lade Freunde ein und battle dich um den Sieg! 🚀🔥

---

## 📢 Was ist Bingo Royal?

Stell dir vor, du sitzt mit deinen Freunden zusammen, aber ihr habt keine Lust auf gewöhnliche Brettspiele. Oder ihr seid online und wollt trotzdem gegeneinander antreten. **Boom!** Hier kommt **Bingo Royal** ins Spiel!

Erstelle dein eigenes **Bingo Feld** oder lade ein hochgeladenes, starte ein Spiel und lade andere ein – per Code oder Link. Dann beginnt der epische Kampf um die Felder!

---

## 🚀 Features

- ✅ **Erstelle dein eigenes Bingo Feld**
- ✅ **Starte ein Spiel mit Freunden**
- ✅ **Teile einen Einladungs-Link, um einem Raum beizutreten**
- ✅ **Bis zu XYZ Spieler pro Match** 🎭
- ✅ **Zufällig generierte Spielfelder pro Spieler** 🎲
- ✅ **Automatische Sieg-Erkennung** 🏆
- ✅ **Anpassbare Spielregeln** ⚙️
- ✅ **Integrierte Suchfunktion für Bingo Felder** 🔍
- ✅ **Stylisches Hauptmenü** 🏠

---

## 🎛️ Spielmodi & Optionale Regeln

Weil wir Profis sind, kannst du das Spiel nach deinen Wünschen anpassen:

- 🌀 **Versus Mode:** Kreuze ein Tile an – für die anderen wird es gesperrt! Chaos garantiert!
- 📐 **Spielfeldgröße:** Wähle zwischen 6x6, 5x5, 4x4 oder 3x3!

---

## 📊 Metadaten

Um die besten Bingo-Felder zu ermitteln, speichert die App:

- 📌 **Bewertungssystem:** 👍👎
- 📌 **Anzahl gespielter Partien** 🔢
- 📌 **Kategorie & Tags für Tilesets** 🏷️

---

## 🔧 Installation & Setup

### Voraussetzungen

- Flutter SDK installiert ([Anleitung](https://flutter.dev/docs/get-started/install))
- Dart SDK installiert
- Android SDK installiert
- Das Bingo-Backend läuft. Zu finden in [diesem Git-Repo](https://github.com/Lunix-420/BingoServer)

### Schritte

```bash
# Klone das Repo
$ git clone https://github.com/dein-user/bingo-royal.git

# Wechsle ins Verzeichnis
$ cd bingo-royal

# Installiere die Abhängigkeiten
$ flutter pub get

# Starte das Spiel
$ flutter run
```

---

## Testing

Zum Testen verwenden wir manuelle tests. Diese sehen wiefolgt aus:

1. Programm starten
2. Ausprobieren allerlei gedachter Interaktionen
3. Ausprobieren von ungedachten Interaktionen

Testing ist anders leider kaum möglich, da die App dicht an unser Backend gekoppelt ist. Zudem verwenden wir **Toastification** um Usern Feedback zu geben, und diese sind auch kaum Testbar und bringen daher die meisten Komponenten zum Absturz. Darüberhinaus macht es keinen Sinn, Stateless Komponenten zu testen, da diese Stateless sind und lediglich aussehen mit sich bringen.

---

## 🌟 Lizenz

Dieses Projekt steht unter der **GPLv3-Lizenz** – also einfach forken, modden und genießen! 😎💜

💙 **Happy Coding!** 🚀
