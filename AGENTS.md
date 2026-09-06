# Agent Guidelines for PhantomESP CyberSerial Dashboard

If you are an AI Agent operating on this codebase, you MUST adhere to the following rules to maintain the integrity, theme, and functionality of the project.

## 🎨 1. UI & Theming (PhantomESP)
* **Theme Maintenance**: The UI must retain its dark, hacker-inspired aesthetic.
* **Colors**: 
  * Backgrounds should remain deep black `#000` or `#080808`.
  * Highlight colors are limited to `#00ff00` (green) for active/success states and `#ff2a2a` (red) for errors/warnings. 
  * Text should be slightly muted white `#e0e0e0` or pure white `#fff` for active elements.
* **Fonts**: `Courier New` (monospace) and `VT323` are the primary fonts. Do not introduce sans-serif web fonts without explicit user request.
* **Neo-Brutalism**: 
  * Interactive elements (buttons, inputs) utilize a "Neo-Brutalist" or "Gumroad" styling.
  * Hover states use a flat transform translation (`transform: translate(-0.25rem, -0.25rem);`) combined with a solid block drop-shadow (`box-shadow: 0.25rem 0.25rem ...`).
  * **Hover Colors**: The default button hover background is light grey (`#eee`) with black text (`#000`).
  * **Active Navigation**: The currently selected `.nav-item.active` simply uses the default hover styling, it does *not* use a black background.

## 🔌 2. Web Serial API & Architecture
* **Single File SPA**: The entire application lives within `index.html`. Do not extract CSS or JS into separate files unless requested by the user, as keeping it in one file makes it easier to host statically on GitHub Pages or directly off a local machine without a server.
* **Serial Reading Loop**:
  * The `readLoop()` function in `index.html` continually reads the incoming serial stream and parses it line-by-line.
  * **DO NOT BLOCK THIS LOOP**. UI updates (like parsing the string for SD card status or antenna modules) must be extremely lightweight.
* **File Uploads**:
  * File uploading streams directly over the serial connection.
  * **Timing**: There is an artificial delay `await new Promise(r => setTimeout(r, 20));` between sending lines. Do not remove this delay, or you will overflow the ESP32's hardware buffer.
  * **Init Command**: By default, no init command is prepended to the file stream. Do not add `write filename` unless a specific firmware requires it.

## 🔄 3. Multi-Firmware Support
* **Firmware Selector**: The UI supports switching between ESP32 Marauder, Ghost ESP, and Bruce.
* **Dynamic Commands**: The Quick Commands pills are dynamically generated based on the `firmwareSelect` dropdown. When adding new commands, modify the `firmwareCommands` object in the JS, do not hardcode HTML buttons.

## 🛑 4. General Rules
* Do not introduce heavy frontend frameworks (React, Vue, Tailwind) to this vanilla HTML/CSS/JS project.
* Always communicate changes with the user in English.
* Do not accidentally remove the SD Card checking regex in `readLoop()` when modifying the terminal logic.
