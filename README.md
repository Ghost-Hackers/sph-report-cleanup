![Banner](<assets/images/README imgs/SPH Report Cleanup Header.png>)

<a href="https://github.com/Ghost-Hackers/sph-report-cleanup"><img alt="GitHub Repo stars" src="https://img.shields.io/github/stars/Ghost-Hackers/sph-report-cleanup?label=Repo%20Stars" /></a> <a href="https://github.com/Ghost-Hackers"><img alt="GitHub Org's stars" src="https://img.shields.io/github/stars/Ghost-Hackers?style=social&label=Org%20Stars" /></a> <img alt="GitHub collaborators" src="https://img.shields.io/github/contributors/Ghost-Hackers/sph-report-cleanup?style=social" /> <img alt="GitHub watchers" src="https://img.shields.io/github/watchers/Ghost-Hackers/sph-report-cleanup?style=social" /> <img alt="GitHub all releases" src="https://img.shields.io/github/downloads/Ghost-Hackers/sph-report-cleanup/total?style=social" />

<p align="center">
  <a href="https://skillicons.dev">
    <img src="https://skillicons.dev/icons?i=github,git,powershell,html,md" />
  </a>
</p>

<!--    !! REMEMBER TO UDPATE BADGES !!    -->

<p align="center">
    <img src="https://img.shields.io/badge/README updated on-1/10/2024-gold?style=plastic" />
    <img src="https://img.shields.io/badge/last updated by-GH👻ST-white?style=plastic" />
    </br>
    <object data="https://img.shields.io/github/v/release/Ghost-Hackers/sph-report-cleanup?include_prereleases&sort=date&display_name=tag&style=plastic&label=latest%20release&color=bright%20green" type="image/svg+xml">
        <img alt="GitHub Release" src="https://img.shields.io/github/v/release/Ghost-Hackers/sph-report-cleanup?include_prereleases&sort=date&display_name=tag&style=plastic&label=latest%20release&color=bright%20green" />
    </object>
    <object data="https://img.shields.io/github/release-date/Ghost-Hackers/sph-report-cleanup?display_date=published_at&style=plastic&color=blue&link=right%3Ahttps%3A%2F%2Fgithub.com%2FGhost-Hackers%2Fsph-report-cleanup%2Freleases" type="image/svg+xml">
        <img alt="GitHub Release Date - Published_At" src="https://img.shields.io/github/release-date/Ghost-Hackers/sph-report-cleanup?display_date=published_at&style=plastic&color=blue&link=right%3Ahttps%3A%2F%2Fgithub.com%2FGhost-Hackers%2Fsph-report-cleanup%2Freleases" />
    </object>
    </br>
</p>

# SPH Report Cleanup

[![Greetings](https://github.com/Ghost-Hackers/sph-report-cleanup/actions/workflows/greetings.yml/badge.svg)](https://github.com/Ghost-Hackers/sph-report-cleanup/actions/workflows/greetings.yml)
[![Generate Changelog](https://github.com/Ghost-Hackers/sph-report-cleanup/actions/workflows/generate-changelog.yml/badge.svg)](https://github.com/Ghost-Hackers/sph-report-cleanup/actions/workflows/generate-changelog.yml)

**SPH Report Cleanup** is a Batch script designed to search for and clean up [Synxis Property Hub (SPH)](https://www.sabrehospitality.com/solutions/property-hub/) reports from the workstation's "Downloads" folder. This script features several enhancements for user convenience. It keeps itself and its dependencies up-to-date, ensuring a seamless experience.

The script employs a PowerShell script to find and delete SPH PDF files based on the predetermined search format: **"sph*.pdf"**. This specific format is chosen to safeguard against unintended deletion of non-SPH files. The script's sole purpose is to clean up residual report files in the "Downloads" folder, enhancing system hygiene.

## Table of Contents

- [Getting Started](#getting-started)
  - [Downloading](#downloading)
  - [Installing](#installing)
- [What To Expect When Running The Script](#what-to-expect-when-running-the-script)
- [FAQ](#faq)
- [Repository Information](#repository-information)
  - [Changelog](#changelog)
  - [Recent Issues](#recent-issues)
- [Contact](#contact)

## Getting Started

### Downloading

To begin using **SPH Report Cleanup**, download the [latest release](https://github.com/Ghost-Hackers/sph-report-cleanup/releases/download/v1.2.0/SPH.Report.Cleanup.bat). The script is a standalone Batch file; no additional downloads are required. The script will handle the installation of necessary dependencies automatically upon execution.

### Installing

There is no installation process. The script will reside in the user's "Downloads" folder. While the script can be run from any location on the user's machine, it is recommended to move it to the desktop for easy access. The script creates a desktop shortcut with every run, ensuring an always up-to-date link.

## What To Expect When Running The Script

Upon running the script, it will perform the following tasks:

- Attempt to run as an administrator
  - If not granted administrative privileges, it will prompt for elevation, ensuring a one-time administrative session for necessary operations.
- Verify and install dependencies
  - Ensure proper functioning of the script.
- Check for updates
  - Download and install the latest version of the script and its dependencies, if available.
- Display a progress bar
  - Visualize the search for files matching the **"sph*.

pdf"** format.
- List files to be deleted
  - Provide a preview of files targeted for deletion.
- Confirm file deletion
  - Prompt the user for confirmation to prevent accidental deletions.
- Display informational message
  - Showcase script details and offer options via buttons.
- Create a desktop shortcut
  - Facilitate easy script execution.
- Terminate the script
  - Exit after prompting the user to press any key.

<details>
  <summary>Examples of SPH Reports Looked For</summary>
  <!-- Include examples or details of the SPH reports the script looks for. -->
</details>

## FAQ

1. **Why does the script need to be run manually?**
   - The script is designed for user-initiated execution and is not intended for automatic runs.

2. **Why does the script require Windows 10?**
   - It relies on PowerShell 5.1 or higher, exclusive to Windows 10.

3. **Why administrative privileges?**
   - Necessary for file deletion in the user's Downloads folder and for self-updating.

4. **Why run on a company machine?**
   - Tailored for Synxis Property Hub files, serving no purpose on other machines.

5. **Why run after downloading Synxis PDF files?**
   - Targets cleanup of downloaded SPH files; irrelevant otherwise.

6. **Automated script run?**
   - Possible via Windows Task Scheduler but not recommended due to unnecessary resource usage.

7. **Why check for updates?**
   - Ensures script and dependencies are current for optimal functionality.

8. **Different window during script run?**
   - CMD Prompt window used for progress display; background downloads may spawn a second window.

9. **Uninstall prompt during script run?**
   - Git uninstalling previous versions as part of the update process.

10. **"Cloning" or "pulling" message?**
    - Git fetching the latest script version during the update.

11. **Desktop run recommendation?**
    - Convenience feature; script can run from any location, but desktop placement is advised.

## Repository Information

<p align="center">
  <img alt="GitHub repo size" src="https://img.shields.io/github/repo-size/Ghost-Hackers/sph-report-cleanup?style=plastic"> 
  <img alt="GitHub code size in bytes" src="https://img.shields.io/github/languages/code-size/Ghost-Hackers/sph-report-cleanup?style=plastic"> 
  <img alt="GitHub repo file count" src="https://img.shields.io/github/directory-file-count/Ghost-Hackers/sph-report-cleanup?style=plastic&color=green"> 
  <img alt="GitHub language count" src="https://img.shields.io/github/languages/count/Ghost-Hackers/sph-report-cleanup?style=plastic&color=yellow">
  <img alt="GitHub release (latest by date)" src="https://img.shields.io/github/downloads/Ghost-Hackers/sph-report-cleanup/latest/total?style=plastic&color=white">
</p>

<details>
  <summary>Commits</summary>
  <!-- Include commit-related badges or information. -->
  <img alt="GitHub last commit" src="https://img.shields.io/github/last-commit/Ghost-Hackers/sph-report-cleanup?style=plastic" /> 
  <img alt="GitHub commit activity" src="https://img.shields.io/github/commit-activity/m/Ghost-Hackers/sph-report-cleanup?style=plastic">

</details>

<details>
  <summary>Pull Requests</summary>
  <!-- Include pull request-related badges or information. -->
  <img alt="GitHub pull requests" src="https://img.shields.io/github/issues-pr/Ghost-Hackers/sph-report-cleanup?style=plastic&color=orange"> 
  <img alt="GitHub closed pull requests" src="https://img.shields.io/github/issues-pr-closed/Ghost-Hackers/sph-report-cleanup?style=plastic">
</details>

<details>
  <summary>Downloads by Version</summary>
  <!-- Include download-related badges or information by version. -->
  <strong>V1.0 Downloads</strong> <sup>[*Ongoing*]</sup> </br>
    <img alt="GitHub release (by tag)" src="https://img.shields.io/github/downloads/Ghost-Hackers/sph-report-cleanup/v1.0.0/total?style=social">
</details>

### Recent Issues

<p align="center">
  <img alt="GitHub closed issues" src="https://img.shields.io/github/issues-closed/Ghost-Hackers/sph-report-cleanup?style=plastic&color=vividgreen"> 
  <img alt="GitHub open issues" src="https://img.shields.io/github/issues/Ghost-Hackers/sph-report-cleanup?style=plastic&color=red" />
  <img alt="GitHub issue custom search" src="https://img.shields.io/github/issues-search?query=repo%3AGhost-Hackers%2Fsph-report-cleanup%20is%3Aissue%20label%3Abug&style=plastic&label=bugs&color=orange"> 
  <img alt="GitHub issue custom search" src="https://img.shields.io/github/issues-search?query=repo%3AGhost-Hackers%2Fsph-report-cleanup%20is%3Aissue%20label%3Aenhancement&style=plastic&label=feature%20requests&color=yellow">
</p>

Currently there are no recent issues. If you have an issue, please open one and let us know so we can fix it.
<!-- 
    - [x] #1
    - [:white_check_mark:] #2
-->

> ## Contact

- Please use the [Issues](https://github.com/Ghost-Hackers/sph-report-cleanup/issues) tab to report any issues, bugs, or enhancements (feature requests)
- You may email us at [Ghost Hackers](mailto:ghost-hackers@outlook.com) for any other inquiries

<!--
    Example README.md
    # Project Title

A brief description of what this project does and who it's for

## Table of Contents

- Project Title
  - Table of Contents
  - About The Project
  - Getting Started
    - Prerequisites
    - Installation
  - Usage
  - Roadmap
  - Contributing
  - License
  - Contact
  - Acknowledgements

## About The Project

[![Product Name Screen Shot][product-screenshot]](https://example.com)

Here you can provide a brief description of what your project is about and what it does. You can also include a screenshot of your project.

## Getting Started

Here you can provide instructions on how to get started with your project. You can include prerequisites, installation instructions, etc.

### Prerequisites

Here you can list the prerequisites for your project.

### Installation

Here you can provide detailed installation instructions for your project.

## Usage

Here you can describe how to use your project.

## Roadmap

Here you can list the future features you plan to add to your project.

## Contributing

Here you can describe how other developers can contribute to your project.

## License

Here you can specify the license for your project.

## Contact

Here you can provide your contact information.

## Acknowledgements

Here you can acknowledge any contributors, libraries, or other resources that you used in your project.


-->