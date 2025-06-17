<!-- Ghost Hackers Brand -->
<p align="center">
  <img src="assets/images/logo/ghost_hackers_logo.png" alt="Ghost Hackers Brand Logo" width="60" style="vertical-align:middle;"/>
  <span style="font-size:2.2em; font-weight:bold; vertical-align:middle; margin-left: 0.5em; color:#1aff66;">Ghost Hackers</span>
</p>

<p align="center">
  <a href="https://github.com/Ghost-Hackers/sph-report-cleanup"><img alt="GitHub Repo stars" src="https://img.shields.io/github/stars/Ghost-Hackers/sph-report-cleanup?label=Repo%20Stars" /></a> <a href="https://github.com/Ghost-Hackers"><img alt="GitHub Org's stars" src="https://img.shields.io/github/stars/Ghost-Hackers?style=social&label=Org%20Stars" /></a> <img alt="GitHub collaborators" src="https://img.shields.io/github/contributors/Ghost-Hackers/sph-report-cleanup?style=social" /> <img alt="GitHub watchers" src="https://img.shields.io/github/watchers/Ghost-Hackers/sph-report-cleanup?style=social" /> <img alt="GitHub all releases" src="https://img.shields.io/github/downloads/Ghost-Hackers/sph-report-cleanup/total?style=social" />
  <br>
  <a href="https://skillicons.dev">
    <img src="https://skillicons.dev/icons?i=github,git,powershell,html,md" />
  </a>
</p>

<!--    !! REMEMBER TO UDPATE BADGES !!    -->

<p align="center">
    <object data="https://img.shields.io/github/v/release/Ghost-Hackers/sph-report-cleanup?include_prereleases&sort=date&display_name=tag&style=plastic&label=latest%20release&color=bright%20green" type="image/svg+xml">
        <img alt="GitHub Release" src="https://img.shields.io/github/v/release/Ghost-Hackers/sph-report-cleanup?include_prereleases&sort=date&display_name=tag&style=plastic&label=latest%20release&color=bright%20green" />
    </object>
    <object data="https://img.shields.io/github/release-date/Ghost-Hackers/sph-report-cleanup?display_date=published_at&style=plastic&color=blue&link=right%3Ahttps%3A%2F%2Fgithub.com%2FGhost-Hackers%2Fsph-report-cleanup%2Freleases" type="image/svg+xml">
        <img alt="GitHub Release Date - Published_At" src="https://img.shields.io/github/release-date/Ghost-Hackers/sph-report-cleanup?display_date=published_at&style=plastic&color=blue&link=right%3Ahttps%3A%2F%2Fgithub.com%2FGhost-Hackers%2Fsph-report-cleanup%2Freleases" />
    </object>
    </br>
</p>

> # SPH Report Cleanup

[![Greetings](https://github.com/Ghost-Hackers/sph-report-cleanup/actions/workflows/greetings.yml/badge.svg)](https://github.com/Ghost-Hackers/sph-report-cleanup/actions/workflows/greetings.yml)
[![Generate Changelog](https://github.com/Ghost-Hackers/sph-report-cleanup/actions/workflows/generate-changelog.yml/badge.svg)](https://github.com/Ghost-Hackers/sph-report-cleanup/actions/workflows/generate-changelog.yml)

**SPH Report Cleanup** is a modern, user-friendly application for searching and cleaning up [Synxis Property Hub (SPH)](https://www.sabrehospitality.com/solutions/property-hub/) reports from your workstation's "Downloads" folder. The app now features a fully GUI-driven experience using Windows HTA (HTML Application) technology, providing a visually appealing, accessible, and easy-to-use interface for all users on Windows 10 and above.

---

## Key Features (2025 Edition)

- **Modern GUI**: All user interaction is through intuitive HTA windows—no command prompt or console windows are shown.
- **Welcome/Info Screen**: On launch, users are greeted with a themed, accessible welcome screen explaining the app's purpose and usage.
- **Main Application Window**: Features a tabbed interface (Scan, Console, Logs, Settings) for streamlined navigation.
- **Built-in Console**: Script output is displayed in the Console tab, keeping everything within the app.
- **Theme Toggle**: Easily switch between light and dark themes with a single click (moon/sun icon).
- **Accessibility**: Improved keyboard navigation, color contrast, and screen reader support.
- **No Installation Required**: Just download and run—no setup or admin rights needed for basic use.
- **Safe File Handling**: Only targets files matching the "sph*.pdf" pattern to prevent accidental deletion.

---

<details>
  <summary>Examples of SPH Reports Looked For</summary>
  <!-- Include examples or details of the SPH reports the script looks for. -->

  <img src="assets/images/redacted-pdfs/sphCashierClosing.jpg" alt="Cashier Closing" style="width: 40%;" /> </br>
    - *Cashier Closing*
  
  <img src="assets/images/redacted-pdfs/sphCreditCardTransactionTotal.jpg" alt="Credit Card Transaction Total" style="width: 40%;" /> </br>
    - *Credit Card Transaction Total*
  
  <img src="assets/images/redacted-pdfs/sphHotelLedger.jpg" alt="Hotel Ledger" style="width: 40%;" /> </br>
    - *Hotel Ledger*
  
  <img src="assets/images/redacted-pdfs/sphStandardGuestList.jpg" alt="Standard Guest List" style="width: 40%;" /> </br>
    - *Standard Guest List*
  
  <img src="assets/images/redacted-pdfs/sphStatistics.jpg" alt="Statistics Report" style="width: 40%;" /> </br>
    - *Statistics Report*
  
  <img src="assets/images/redacted-pdfs/sphTransactionTotalDetail.jpg" alt="Transaction Total Detail" style="width: 40%;" /> </br>
    - *Transaction Total Detail*
  
  <img src="assets/images/redacted-pdfs/sphTransactionTotalSummary.jpg" alt="Transaction Total Summary" style="width: 40%;" /> </br>
    - *Transaction Total Summary*

</details>

## Table of Contents

- [Key Features (2025 Edition)](#key-features-2025-edition)
- [Getting Started](#getting-started)
  - [Downloading](#downloading)
  - [Launching](#launching)
- [What To Expect When Using The App](#what-to-expect-when-using-the-app)
- [Project Overview](#project-overview)
- [How to Use](#how-to-use)
- [What the App Does](#what-the-app-does)
- [Additional Information](#additional-information)
- [Contributing](#contributing)
- [License](#license)

> ## Getting Started

### Downloading

To begin using **SPH Report Cleanup**, download the [latest release](https://github.com/Ghost-Hackers/sph-report-cleanup/releases/latest). The app is portable and requires no installation.

### Launching

1. Double-click `SPH Report Cleanup.bat` to start the app.
2. The welcome/info screen will appear—read the instructions and click Continue.
3. The main application window will open, providing tabs for scanning, viewing logs, adjusting settings, and viewing script output in the built-in console.
4. All actions and feedback are handled within the GUI—no command prompt or external windows will appear.

> ## What To Expect When Using The App

- **Welcome/Info Screen**: Explains the app and offers a theme toggle for accessibility.
- **Tabbed Main Window**: Navigate between Scan, Console, Logs, and Settings.
- **Scan Tab**: Initiates the cleanup process, running the PowerShell script and displaying output in the Console tab.
- **Console Tab**: View real-time script output and logs.
- **Logs Tab**: Review past actions and results.
- **Settings Tab**: Adjust preferences, including theme and accessibility options.
- **No Console Windows**: All interaction is GUI-based for a seamless experience.

---

## Project Overview

SPH Report Cleanup is a utility for Windows that helps users securely and conveniently remove Synxis Property Hub (SPH) PDF reports from their Downloads folder. It is designed to protect sensitive information and keep your Downloads folder organized. The app uses a modern GUI (HTA) and does not require command-line interaction.

## How to Use

- The recommended way to launch the app is by using the shortcut at the root of the repository: `SPH Report Cleanup.lnk`.
- Alternatively, you can run `src/scripts/SPH Report Cleanup.bat`, which launches the GUI (`index.hta`).
- The app will guide you through the process: welcome/info screen, scanning for SPH PDFs, reviewing found files, and confirming deletion.
- You can choose to permanently delete files or move them to the Recycle Bin.
- A log file is created in your Downloads folder after each cleanup.

## What the App Does

- Scans your Downloads folder (and subfolders) for files matching `sph*.pdf`.
- Shows you a list of found files and their total size.
- Asks for confirmation before deleting anything.
- Optionally moves files to the Recycle Bin (requires PowerShell Recycle module).
- Logs all actions and results for your records.
- Offers a theme toggle and accessibility features in the GUI.

## Additional Information

- No installation is required; just download and run.
- Works on Windows 10 and above.
- Open source and available on GitHub.
- For support, feature requests, or issues, use the links provided in the repository.

## Contributing

Contributions are welcome and appreciated! If you would like to help improve this project, please review our [Contributing Guidelines](CONTRIBUTING.md) for instructions on how to get started, submit issues, or propose new features.

## License

This project is licensed under the terms of the [GNU Affero General Public License v3.0 (AGPL-3.0)](LICENSE.md). See the license file for details.

---

[![Back to top](https://img.shields.io/badge/Back%20to%20Top-181717?logo=github&logoColor=white&style=plastic)](#sph-report-cleanup)
