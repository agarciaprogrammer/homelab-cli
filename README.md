# 🧪 Homelab CLI – MVP 1

A minimal, modular **DevOps Homelab CLI** built on Arch Linux.  
Create and destroy lightweight Kubernetes clusters locally with a single command.

---

## 🚀 Features (MVP 1)
- Create a local Kubernetes cluster using **Kind**.
- Destroy it safely with cleanup verification.
- Configurable cluster name and node count.
- Designed for Arch Linux, but works anywhere with Docker + Kind.

---

## ⚙️ Usage

```bash
# Clone repo
git clone https://github.com/agarciaprogrammer/homelab-cli
cd homelab-cli

# Make executable
chmod +x bin/homelab.sh

# Create a cluster
./bin/homelab.sh create

# Destroy the cluster
./bin/homelab.sh destroy

---

## 📂 Project Structure
Folder	Description
bin/	Main CLI script
modules/	Provider modules (Kind, later Minikube/AWS)
config/	Default configs & YAMLs
README.md	Project documentation

---

##🧭 Roadmap

MVP 1 – Local Kind Cluster ✅
MVP 2 – Addons (Prometheus, ArgoCD, etc.)
MVP 3 – AWS EKS Support
MVP 4 – Terraform + Helm integration
MVP 5 – Integration with Project Builder (Staging Mode)

---

## 🧰 Requirements

Docker
Kind
Bash 5+
Linux (tested on Arch)

---

💡 Vision

Homelab CLI lets DevOps learners and engineers quickly spin up reproducible, ephemeral labs to test cloud-native tools — without breaking their main environments.

📜 License
MIT License © 2025 Agustín García