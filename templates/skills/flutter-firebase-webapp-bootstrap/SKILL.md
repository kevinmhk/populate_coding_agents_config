---
name: flutter-firebase-webapp-bootstrap
description: Bootstrap a Flutter web app with Firebase configuration and required documentation updates. Use when the user asks to scaffold Flutter + Firebase, configure Firebase for web, or align docs for app phases.
---

# Flutter Firebase Webapp Bootstrap

## Overview
Scaffold a Flutter web app, connect Firebase services, and update project docs consistently.

## Required Inputs
- Project name and Flutter channel/version.
- Firebase project configuration (web config or CLI targets).
- Required phases or milestones (e.g., web first, mobile later).
- Documentation set to update (WBS, architecture, deploy guide).

## Workflow
1. Confirm prerequisites.
   - Ensure Flutter SDK is installed and configured.
   - Validate Firebase project access and web config.
2. Scaffold the app.
   - Create Flutter project and enable web support.
   - Add Firebase dependencies as required.
3. Configure Firebase.
   - Add web config (or `firebase` CLI setup if requested).
   - Verify environment-specific config locations.
4. Update docs.
   - Reflect phases, architecture, and deployment steps in project docs.
   - Keep changes minimal and aligned with requirements.

## Guardrails
- Do not commit or push unless explicitly instructed.
- Do not modify Firebase projects without explicit confirmation.
