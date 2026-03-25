# LCCN Harvester

A desktop tool that automates the retrieval of **Library of Congress (LCCN)** and **National Library of Medicine (NLMCN)** call numbers from a list of ISBNs — eliminating the need to search multiple catalogues manually.

---

## What It Does

- Accepts a list of ISBNs via file upload, paste, or drag-and-drop
- Queries the Library of Congress, Harvard LibraryCloud, and OpenLibrary simultaneously
- Caches successful lookups so repeat runs skip already-found records
- Exports results as **TSV**, **JSON**, or **Excel (.xlsx)**
- Tracks failed lookups separately for review and retry

---

## System Requirements

| Requirement | Minimum |
|---|---|
| Python | 3.11 or higher |
| Operating System | Linux, macOS, or Windows |
| Internet | Required (for API queries) |

---

## Linux: System Dependencies

Before installing Python packages, install the Qt platform libraries required by PyQt6:

**Ubuntu / Debian:**
```bash
sudo apt update
sudo apt install -y \
    libxcb-xinerama0 \
    libxcb-icccm4 \
    libxcb-image0 \
    libxcb-keysyms1 \
    libxcb-randr0 \
    libxcb-render-util0 \
    libxcb-xkb1 \
    libxkbcommon-x11-0 \
    libglib2.0-0 \
    libdbus-1-3
```

**Fedora / RHEL:**
```bash
sudo dnf install -y \
    xcb-util-wm \
    xcb-util-image \
    xcb-util-keysyms \
    xcb-util-renderutil \
    libxkbcommon-x11 \
    dbus-libs
```

> For desktop notifications on Linux, `notify-send` is used. It comes pre-installed on most GNOME/KDE desktops. If missing: `sudo apt install libnotify-bin`

---

## Installation

**1. Clone this repository**
```bash
git clone <repo-url>
cd LCCN-Harvester-Client
```

**2. Create a virtual environment (recommended)**
```bash
python3 -m venv .venv
source .venv/bin/activate      # Linux / macOS
.venv\Scripts\activate         # Windows
```

**3. Install dependencies**
```bash
pip install -r requirements.txt
```

---

## Running the App

**Linux / macOS:**
```bash
./run.sh
```

Or directly:
```bash
python3 app_entry.py
```

**Windows:**
```bash
python app_entry.py
```

---

## Quick Start

1. Launch the app with `./run.sh` (or `python3 app_entry.py`)
2. Go to the **Input** tab and load your ISBN list (one per line, `.txt` or `.tsv`)
3. Go to the **Harvest** tab and click **Start Harvest**
4. When complete, use **Export** to save results as TSV, JSON, or Excel
5. Previous results are cached — re-running skips already-found ISBNs automatically

---

## Project Structure

```
├── app_entry.py        # Application entry point
├── src/
│   ├── gui/            # PyQt6 interface (tabs, theme, notifications)
│   ├── api/            # API clients (LoC, Harvard, OpenLibrary)
│   ├── harvester/      # Harvest pipeline and export
│   ├── database/       # SQLite cache and schema
│   ├── config/         # Profile and path management
│   └── utils/          # ISBN/LCCN validation and utilities
├── config/             # Default settings and profiles
├── data/               # Target definitions and GUI state
└── requirements.txt
```

---

## Notes

- All data is stored **locally** — no accounts or cloud services required
- The SQLite cache (`lccn_harvester.sqlite3`) is created automatically on first run in your user data directory
- Linux user data is stored at `~/.lccn_harvester/`

---

*Developed by UPEI Library — CS4820/CS4810 Software Engineering Project*
