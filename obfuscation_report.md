# Obfuscation Report — gmbl_04

**Seed:** `GMBL04`  
**Date:** 2026-06-29  
**Files processed:** 19

---

## Summary

| Category | Count |
|---|---|
| Types renamed | 39 |
| Enum cases renamed | 19 |
| Methods / properties renamed | 88 |
| Strings obfuscated | 3 |
| Files with `_sd()` helper | 2 |

---

## Naming Convention

| Symbol kind | Pattern | Example |
|---|---|---|
| Types | `_X{AB}{NNNN}{CD}` | `_XGm1001Bl` |
| Methods / properties | `_x{ab}{NNNN}` | `_xbm2006` |

Char pairs cycle through: `Gm, Bl, Lg, Mb, Gl, Bm, Lb, Mg, Gb, Lm`  
Counters: types start at **1001**, methods/properties at **2001**.

---

## Files Modified

| File | Changes |
|---|---|
| `App/AppDelegate.swift` | No renames (preserved: `AppDelegate`) |
| `App/Lounge.swift` | Types: `LoungeState`, `Lounge`, `BarKit`; 8 methods/props |
| `Bar/BarPalette.swift` | Types: `BarPalette`, `BarType`, `BarShape`, `PourButtonStyle`; 15 statics |
| `ContentView.swift` | Type: `ContentView` → `_XMg1008Lb` |
| `Model/BarCard.swift` | Types: `PourIntent`, `BarCard`; explicit `rawValue`s added; CodingKeys added |
| `Model/Pour.swift` | Types: `Jigger`, `Pour`; CodingKeys added to both |
| `Network/CocktailDBService.swift` | Types: `ShakerError`, `MixologySource`, `CocktailDBService` + 3 private nested; base URL obfuscated |
| `Screens/AboutScreen.swift` | Types: `AboutScreen`, `BarWebSheet`, `Page`, `Web`; contact/privacy URLs obfuscated |
| `Screens/BarDrawer.swift` | Types: `BarRoom`, `BarDrawer`; all cases and computed properties |
| `Screens/Discover/DiscoverScreen.swift` | All references updated |
| `Screens/Discover/DiscoverViewModel.swift` | Type: `DiscoverViewModel` + nested `Mode`, `Shelf` |
| `Screens/MyBarScreen.swift` | Types: `MyBarScreen`, `FavoritesScreen` |
| `Screens/NeonIntro.swift` | Type: `NeonIntro` |
| `Screens/PourDetailSheet.swift` | Type: `PourDetailSheet`; all private members |
| `Screens/Shared/PourViews.swift` | Types: `PourThumb`, `PourCard`, `DryNote` |
| `Screens/SurpriseScreen.swift` | Type: `SurpriseScreen` |
| `Screens/TourCards.swift` | Types: `TourCards`, `Coaster` |
| `Store/BarShelf.swift` | Type: `BarShelf`; all methods and properties |
| `templateApp.swift` | All private members renamed; `templateApp` struct preserved |

---

## String Obfuscation

Sensitive URLs replaced with base64-encoded values decoded at runtime via `_sd()`:

| Original | Encoded |
|---|---|
| `https://www.thecocktaildb.com/api/json/v1/1` | `aHR0cHM6Ly93d3cudGhlY29ja3RhaWxkYi5jb20vYXBpL2pzb24vdjEvMQ==` |
| `https://example.com/shaker/contact` | `aHR0cHM6Ly9leGFtcGxlLmNvbS9zaGFrZXIvY29udGFjdA==` |
| `https://example.com/shaker/privacy` | `aHR0cHM6Ly9leGFtcGxlLmNvbS9zaGFrZXIvcHJpdmFjeQ==` |

---

## Codable Safety

CodingKeys enums were added to all renamed Codable structs so existing persisted data remains readable:

- `_XLm1010Gb` (BarCard) — maps 6 renamed properties back to original JSON keys
- `_XBl1012Mg` (Pour) — maps 8 renamed properties back to original JSON keys
- `_XGm1011Bl` (Jigger) — maps 2 renamed properties back to original JSON keys
- `_XBm1036Gl` (Payload, private) — maps `_xgb2208` → `"drinks"`

`PourIntent` enum cases received explicit `rawValue` strings before renaming to preserve Codable compatibility (`"shaken"`, `"toTry"`).

---

## Preserved Unchanged

- `AppDelegate` — required by Obj-C runtime
- `templateApp` — `@main` entry point
- `makeBody` — `ButtonStyle` protocol requirement
- `makeUIView` / `updateUIView` — `UIViewRepresentable` requirements
- `errorDescription` — `LocalizedError` requirement
- `CodingKey.stringValue` / `intValue` — protocol requirements
- `Identifiable.id` — protocol requirement
- `@AppStorage` key `"shaker.tourDone"` — persistence key
- `UserDefaults` key `"shaker.bar.v1"` — persistence key
- All SF Symbol name strings
- All user-visible UI text strings
- Alamofire framework types (`DisplayMode`, `WebContentView`, `NetworkService`)
