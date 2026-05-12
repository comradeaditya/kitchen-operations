# Kitchen Operations - Flutter UI Test
Built this as part of a Flutter UI development test. The goal was to recreate a kitchen management app from a Figma design with pixel-perfect UI, clean architecture, and reusable components.

---

## What this app does
A mobile UI for managing kitchen operations across three core screens:

**Schedule** - shows daily kitchen shifts broken down by meal type. Each shift card displays preparation time, serve time, assigned employees with their roles and hours. Scroll through Breakfast, Lunch, and Dinner shifts in one view.

**Live Orders** - tracks active kitchen orders in real time (mock data). Each order card shows the room, status, countdown timer, and individual item assignments. Staff can assign chefs to items or cancel orders on the spot.

**Shelf Life** - inventory monitoring table with expiry tracking. Items with 3 or fewer days remaining go red automatically. Includes Set Offer and Remove actions per item.

---

## Architecture

Followed **MVVM (Model-View-ViewModel)** pattern throughout:
- Model - data structure only, no logic.
- ViewModel - business logic + state using ChangeNotifier.
- View - screens and widgets, just displays what ViewModel gives.
- State management handled with 

**Provider** - ViewModels are injected at the app root via `MultiProvider` in `main.dart` so every screen can access them without prop drilling.

---

## Reusable widgets built

- **AppDrawer** - slide-out sidebar with user profile, screen navigation, and logout. Active screen highlighted dynamically based on which screen you're on.
- **BottomNavBar** - shared bottom navigation across all screens with 4 items
- **ShiftCard** - meal shift card with times, optional event name, and employee list
- **EmployeeRow** - single employee entry showing hours, name, and role in a green-tinted row
- **OrderCard** - full order card with header info, item rows, assign/cancel actions, and cancel all button

---

### Screenshots
 
## Schedule + Live Orders + Shelf Life + Drawer

![Schedule + Live Orders + Shelf Life + Drawer](screenshots/all_screen.jpeg)


---

## Stack

- Flutter 3.41.7 (latest stable)
- Dart 3.11.5
- Provider 6.1.2
- MVVM architecture
- Mock data only, no backend

---

## Notes

- Portrait mode only, optimized for mobile
- No API calls, all data is hardcoded in `mock_data.dart`
- Figma design used as reference throughout
- Days left color coding — red if 3 or fewer days remaining, handled via integer comparison not string