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

All workspaces run on **Kasm 1.18.x** and **amd64** architecture. Images are pulled from `ghcr.io/doubtfulturnip/`.

### Security

| Workspace | Description | Image |
|-----------|-------------|-------|
| **BloodHound** | Graph-based Active Directory analysis by SpecterOps. Maps users, sessions, and privileges to identify attack paths and privilege escalation routes. | `ghcr.io/doubtfulturnip/bloodhound-kasm` |
| **Epagneul** | Visualizes Windows event logs as interactive graphs to reveal logon patterns, lateral movement, and suspicious account activity. | `ghcr.io/doubtfulturnip/epagneul-kasm` |
| **LogonTracer** | JPCERT/CC tool for investigating malicious Windows logon events through Active Directory event log visualization. | `bukshee/logontracer-kasm` *(legacy — Kasm 1.17.x)* |
| **Slasher** | Bulk IOC checker. Paste hashes, IPs, or domains — Slasher queries VirusTotal in parallel, shows live progress, and exports results as CSV. | `ghcr.io/doubtfulturnip/slasher-kasm` |

### Forensics

| Workspace | Description | Image |
|-----------|-------------|-------|
| **Takajō Forensics** | Windows EVTX analysis combining Hayabusa, Takajō, and Chainsaw. Generates HTML timelines and surfaces TTPs mapped to MITRE ATT&CK. | `ghcr.io/doubtfulturnip/takajo-kasm` |

### OSINT

| Workspace | Description | Image |
|-----------|-------------|-------|
| **Sherlock** | Streamlit WebUI for Sherlock — finds usernames across hundreds of social networks for OSINT investigations. | `ghcr.io/doubtfulturnip/sherlockwebui-kasm` |
| **Social Analyzer** | Analyzes and finds a person's presence across 300+ social media and online platforms, with API and web UI. | `ghcr.io/doubtfulturnip/socialanalyzer-kasm` |
| **Web-Check** | Deep-dive OSINT for any website: uncovers attack surfaces, server architecture, security headers, DNS records, and tech stack. | `ghcr.io/doubtfulturnip/webcheck-kasm` |
| **TruffleHog** | Scans for secrets and leaked credentials (800+ types) in local filesystems or Git repositories via a lightweight web UI. | `ghcr.io/doubtfulturnip/trufflehog-kasm` |

---

## Image Hosting

All active workspaces were migrated from Docker Hub to **GitHub Container Registry (GHCR)** in June 2025. Images are built via GitHub Actions on every push and on a weekly schedule to pick up upstream application updates.

To pull an image manually:
```
docker pull ghcr.io/doubtfulturnip/<image-name>:latest
```

---

## Build Your Own

Source Dockerfiles and GitHub Actions workflows are in the companion repository:

**[DoubtfulTurnip/kasm-custom-images](https://github.com/DoubtfulTurnip/kasm-custom-images)**

Each workspace has a single-app Dockerfile you can build locally or fork and extend.

---

<!-- KASM-REGISTRY-DISCOVERY-IDENTIFIER -->
