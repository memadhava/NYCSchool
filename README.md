# 🏫 NYCSchool

**NYCSchool** is an iOS app built using SwiftUI and modern Swift Concurrency (async/await). It fetches and displays a list of New York City public schools along with their SAT scores, using data provided by the NYC Open Data platform.

---

## 🚀 Features

- 📄 List of NYC public high schools
- 🧮 View detailed SAT score data per school
- 🔍 Search functionality with `.searchable` in SwiftUI
- 🗺️ Map integration (iOS 17+) using MapKit with SwiftUI
- 📱 Clean and modern SwiftUI interface
- 📦 MVVM architecture with async networking and error handling

---

## 🧱 Architecture

- **MVVM** (Model-View-ViewModel) structure
- **Swift Concurrency** (`async/await`) for networking
- **MapKit + SwiftUI** for lightweight map display
- **Codable models** for parsing API responses

---

## 📸 Screenshots

<img width="568" alt="ListView" src="https://github.com/user-attachments/assets/d669d644-2a0f-499d-8079-2f15d8a2e9bb" />


<img width="568" alt="DetailView1" src="https://github.com/user-attachments/assets/605d7074-c538-4acd-b6bf-185ab8134f3b" />

<img width="568" alt="DetailView2" src="https://github.com/user-attachments/assets/b57b14e1-56ab-4822-bfb2-5d578c5899f0" />



---

## 📂 Project Structure

```text
NYCSchool/
├── Models/           # Codable structs for School and SAT data
├── Network/          # API clients using async/await
├── ViewModels/       # ObservableObjects for state management
├── Views/            # SwiftUI views (ListView, DetailView, MapView)
├── Resources/        # Assets like colors, icons, launch screen
└── Utilities/        # Common helpers (e.g., URL builders)

```
---

## 🌐 API Sources

- 🏫 School List: [DOE High School Directory](https://data.cityofnewyork.us/Education/DOE-High-School-Directory-2021/zt9s-n5aj)
- 🧪 SAT Results: [SAT Results](https://data.cityofnewyork.us/Education/SAT-Results/f9bf-2cp4)

---

## ✅ Requirements

- Xcode 14+
- iOS 15.0+
- Swift 5.7+

---

## 🛠️ Setup Instructions

1. **Clone the repository**
   ```bash
   git clone https://github.com/memadhava/NYCSchool.git
   cd NYCSchool
