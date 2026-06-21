# DoubtfulTurnip Kasm Workspaces Registry

A third-party [Kasm Workspaces](https://www.kasmweb.com/) registry focused on **security research, OSINT, and forensics tooling** — all packaged as browser-accessible workspaces with no local installation required.

Images are automatically built weekly and hosted on the GitHub Container Registry (GHCR). Source Dockerfiles live in [DoubtfulTurnip/kasm-custom-images](https://github.com/DoubtfulTurnip/kasm-custom-images).

---

## Add This Registry to Kasm

1. In your Kasm instance go to **Admin → Workspaces → Workspaces Registry**
2. Click **Add new**
3. Paste the registry URL:
   ```
   https://doubtfulturnip.github.io/doubtfulturnip-kasm-registry/
   ```
4. Click **Add Registry**

Once added, click the filter icon next to the registry name in the Registry tab to show only workspaces from this registry.

---

## Available Workspaces

All workspaces target **Kasm 1.19.x** and **amd64** architecture. Images are hosted at `ghcr.io/doubtfulturnip/`.

### Security

| Workspace | Description | Image |
|-----------|-------------|-------|
| **BloodHound** | Graph-based Active Directory analysis by SpecterOps. Maps users, sessions, and privileges to identify attack paths and privilege escalation routes. Runs the full BloodHound CE stack via Docker-in-Docker. | `ghcr.io/doubtfulturnip/bloodhound-kasm` |
| **Epagneul** | Visualizes Windows event logs as interactive graphs to reveal logon patterns, lateral movement, and suspicious account activity. Runs via Docker-in-Docker. | `ghcr.io/doubtfulturnip/epagneul-kasm` |
| **Slasher** | Bulk IOC checker. Paste hashes, IPs, or domains — Slasher queries VirusTotal in parallel, shows live progress, and exports results as CSV. | `ghcr.io/doubtfulturnip/slasher-kasm` |

### Forensics

| Workspace | Description | Image |
|-----------|-------------|-------|
| **Takajō Forensics** | Windows EVTX analysis combining Hayabusa v3.9.0, Takajō v2.16.1, and Chainsaw v2.16.0. Drop EVTX files onto the desktop — reports and an HTML ATT&CK timeline generate automatically. | `ghcr.io/doubtfulturnip/takajo-kasm` |

### OSINT

| Workspace | Description | Image |
|-----------|-------------|-------|
| **Sherlock** | Streamlit WebUI for Sherlock — finds usernames across hundreds of social networks for OSINT investigations. Includes Tor support. | `ghcr.io/doubtfulturnip/sherlockwebui-kasm` |
| **Social Analyzer** | Analyzes and finds a person's presence across 300+ social media and online platforms. Runs the Social Analyzer app image via Docker-in-Docker at runtime. | `ghcr.io/doubtfulturnip/socialanalyzer-kasm` |
| **Web-Check** | Deep-dive OSINT for any website running as a Firefox kiosk. Uncovers attack surfaces, DNS records, security headers, server architecture, and tech stack. Built on web-check v2.1.0. | `ghcr.io/doubtfulturnip/webcheck-kasm` |
| **TruffleHog** | Scans for secrets and leaked credentials (800+ types) in local filesystems or Git repositories. Includes Gobuster for directory scanning. Streamlit WebUI with offline wordlist support. | `ghcr.io/doubtfulturnip/trufflehog-kasm` |

---

## Image Hosting

All workspaces are built and pushed to **GitHub Container Registry (GHCR)** via GitHub Actions. Builds trigger on every push to `main` and on a weekly schedule to pick up upstream application updates.

To pull an image manually:
```
docker pull ghcr.io/doubtfulturnip/<image-name>:latest
```

---

## Build Your Own

Source Dockerfiles and GitHub Actions workflows are in the companion repository:

**[DoubtfulTurnip/kasm-custom-images](https://github.com/DoubtfulTurnip/kasm-custom-images)**

---

<!-- KASM-REGISTRY-DISCOVERY-IDENTIFIER -->
