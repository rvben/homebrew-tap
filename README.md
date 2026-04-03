# rvben/homebrew-tap

CLI tools for infrastructure, automation, and daily workflows. Designed for humans and AI agents.

## Quick Start

```bash
brew tap rvben/homebrew-tap
brew install <tool>
```

## Available Tools

| Tool | Install | Description | Links |
|------|---------|-------------|-------|
| proxctl | `brew install rvben/tap/proxctl` | Manage Proxmox VE clusters, VMs, and containers | [GitHub](https://github.com/rvben/proxctl) · [crates.io](https://crates.io/crates/proxctl) |
| unifi-cli | `brew install rvben/tap/unifi-cli` | Monitor and manage UniFi network devices and clients | [GitHub](https://github.com/rvben/unifi-cli) · [crates.io](https://crates.io/crates/unifi-cli) |
| vership | `brew install rvben/tap/vership` | Automate releases across Rust, Python, Node, and Go projects | [GitHub](https://github.com/rvben/vership) · [crates.io](https://crates.io/crates/vership) |
| verg | `brew install rvben/tap/verg` | Converge infrastructure state across servers over SSH | [GitHub](https://github.com/rvben/verg) · [crates.io](https://crates.io/crates/verg) |
| confluence-cli | `brew install rvben/tap/confluence-cli` | Sync Confluence pages with local Markdown files | [GitHub](https://github.com/rvben/confluence-cli) · [crates.io](https://crates.io/crates/confluence-cli) |
| jira-cli | `brew install rvben/tap/jira-cli` | Create, search, and manage Jira issues from the terminal | [GitHub](https://github.com/rvben/jira-cli) · [crates.io](https://crates.io/crates/jira-cli) |
| qnap-cli | `brew install rvben/tap/qnap-cli` | Manage QNAP NAS volumes, shares, and system settings | [GitHub](https://github.com/rvben/qnap-cli) · [crates.io](https://crates.io/crates/qnap-cli) |
| homeassistant-cli | `brew install rvben/tap/homeassistant-cli` | Control Home Assistant entities, services, and automations | [GitHub](https://github.com/rvben/homeassistant-cli) · [crates.io](https://crates.io/crates/homeassistant-cli) |
| yuki-cli | `brew install rvben/tap/yuki-cli` | Query and manage documents, contacts, and invoices in Yuki | [GitHub](https://github.com/rvben/yuki-cli) · [crates.io](https://crates.io/crates/yuki-cli) |
| zoom-cli | `brew install rvben/tap/zoom-cli` | Manage Zoom meetings, recordings, and webinars | [GitHub](https://github.com/rvben/zoom-cli) · [crates.io](https://crates.io/crates/zoom-cli) |
| n8nc | `brew install rvben/tap/n8nc` | Manage n8n workflows with Git sync and local editing | [GitHub](https://github.com/rvben/n8nc) · [crates.io](https://crates.io/crates/n8nc) |
| rumdl | `brew install rvben/tap/rumdl` | Lint and format Markdown files | [GitHub](https://github.com/rvben/rumdl) · [crates.io](https://crates.io/crates/rumdl) |
| shelly-cli | `brew install rvben/tap/shelly-cli` | Control Shelly smart home relays, lights, and sensors | [GitHub](https://github.com/rvben/shelly-cli) · [crates.io](https://crates.io/crates/shelly-cli) |
| ipcam | `brew install rvben/tap/ipcam` | Manage Tapo and Reolink IP cameras | [GitHub](https://github.com/rvben/ipcam) · [crates.io](https://crates.io/crates/ipcam) |

## Design Philosophy

Every tool in this tap follows the [agent-first-cli](https://github.com/rvben/agent-first-cli) specification.
All tools support `--json` for structured output and a `schema` command for AI agent introspection.
Consistent exit codes, shell completions, and interactive setup (`config init`) are standard across the suite.

## Also Available via

- **cargo install** -- all tools are published on [crates.io](https://crates.io/)
- **pip install** -- PyPI wheels where available
- **GitHub Releases** -- prebuilt binaries for macOS (Apple Silicon and Intel) and Linux
