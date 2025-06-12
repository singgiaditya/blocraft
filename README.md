# 🧱 Blocraft CLI

blocraft is a CLI tool to quickly scaffold Flutter projects using Bloc and Clean Architecture. It generates a modular folder structure and injects essential dependencies automatically, including a choice between equatable or freezed for state management.

---

## 🔧 Installation

To install blocraft globally, run:

```bash
dart pub global activate blocraft
```

Make sure your Dart pub cache global executables path is added to your system PATH:

```bash
$env:PATH += ";$HOME\.pub-cache\bin"   # PowerShell (Windows)
# or
export PATH="$PATH":"$HOME/.pub-cache/bin" # Bash (Linux/macOS)
```

---

## 🚀 Usage

### Initialize Project Structure & Dependencies

```bash
blocraft init
```
- Creates the core, shared, and features base folders under `lib/src/`.
- Prompts you to choose between `equatable` or `freezed` for state management helper.
- Automatically injects dependencies (`bloc`, `flutter_bloc`, `go_router`, `dartz`, and your chosen state helper) into your `pubspec.yaml`.

### Generate a Feature Structure

```bash
blocraft feature <feature_name>
```
- Generates the folder structure for a specific feature (e.g., `auth`).

---

## 📦 Dependency Management

When you run `blocraft init`, the following dependencies will be automatically added to your `pubspec.yaml`:

### Main dependencies
1. **bloc** – State management using the Bloc pattern.
2. **flutter_bloc** – Bloc integration for Flutter apps.
3. **go_router** – Modern routing and navigation for Flutter.
4. **dartz** – Functional programming utilities (e.g., Either, Option, etc).

### State management helper (user choice)
- If you choose **equatable**:
  5. **equatable** – Simplifies value equality for Dart objects (default).
- If you choose **freezed**:
  5. **freezed_annotation** – Annotations for freezed models (added to dependencies).
  6. **freezed** – Main code generation package (added to dev_dependencies).
  7. **build_runner** – Code generation runner (added to dev_dependencies).

All other essential dependencies are injected automatically if not present.

---

## 📂 Generated Folder Structure

### After running `blocraft init`:

```
lib/
└── src/
    ├── core/
    │   ├── error/
    │   ├── utils/
    │   ├── theme/
    │   └── routes/
    ├── shared/
    │   ├── usecases/
    │   ├── widgets/
    │   └── helpers/
    └── features/
```

### After running `blocraft feature <feature_name>` (e.g., `blocraft feature auth`):

```
lib/
└── src/
    └── features/
        └── auth/
            ├── data/
            │   ├── datasources/
            │   ├── models/
            │   └── repositories/
            ├── domain/
            │   ├── entities/
            │   ├── repositories/
            │   └── usecases/
            └── presentation/
                ├── bloc/
                └── pages/
```

---

## 📖 About

Created by Singgi — a tool to speed up Flutter clean architecture setup by scaffolding boilerplate folders and managing dependencies automatically.
