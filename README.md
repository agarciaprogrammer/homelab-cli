# 🧪 Homelab CLI

A minimal, modular **DevOps Homelab CLI** built on Arch Linux. Create, expand, and destroy lightweight Kubernetes clusters locally with a single command.

---

## 🚀 Features (MVP 1 & 2)

* Create a local Kubernetes cluster using **Kind**.
* Destroy it safely with cleanup verification.
* Manage optional **addons** (e.g., Dashboard, Prometheus, ArgoCD, etc.).
* Configurable cluster name and node count.
* Designed for Arch Linux, but works anywhere with Docker + Kind.

---

## ⚙️ Usage

### Installation

```bash
# Clone repo
git clone https://github.com/agarciaprogrammer/homelab-cli.git
cd homelab-cli

# Make executable
chmod +x bin/homelab

# Add to PATH (optional)
echo 'export PATH="$PATH:$HOME/Projects/devops-labs/homelab-cli/bin"' >> ~/.bashrc
source ~/.bashrc
```

Now you can run the CLI globally:

```bash
homelab create
```

---

## 🔧 Commands

### `homelab create`

Creates a new Kubernetes cluster using Kind.

* Reads configuration from `config/defaults.yaml`.
* Sets the cluster name and node count.
* Saves session details under `~/.homelab/active-session.yaml`.

Example:

```bash
homelab create
```

Output:

```
🧪 Creating Kubernetes cluster 'homelab-dev' with 2 node(s)...
✅ Cluster created successfully.
```

### `homelab destroy`

Destroys the current cluster and cleans up session files.

* Checks for an active cluster in `~/.homelab/active-session.yaml`.
* Deletes all nodes associated with the active cluster.

Example:

```bash
homelab destroy
```

Output:

```
🥫 Destroying cluster 'homelab-dev'...
✅ Homelab session cleared.
```

### `homelab addons list`

Displays all available addons from the `addons/` directory.

Example:

```bash
homelab addons list
```

Output:

```
📋 Available addons:
- dashboard
- prometheus
- argocd
```

### `homelab addons install <name>`

Installs a specific addon defined in the `addons/` folder.

Example:

```bash
homelab addons install dashboard
```

Output:

```
📦 Installing addon 'dashboard'...
✅ Addon 'dashboard' installed.
```

### `homelab addons remove <name>`

Removes a specific addon from the current cluster.

Example:

```bash
homelab addons remove dashboard
```

Output:

```
🧹 Removing addon 'dashboard'...
✅ Addon 'dashboard' removed.
```

---

## 🗂️ Project Structure

| Folder      | Description                               |
| ----------- | ----------------------------------------- |
| `bin/`      | Main CLI executable                       |
| `modules/`  | Core logic for cluster providers & addons |
| `addons/`   | YAML definitions for optional modules     |
| `config/`   | Default configs & YAML templates          |
| `README.md` | Project documentation                     |

---

## 🔏 Roadmap

* **MVP 1** – Local Kind Cluster ✅
* **MVP 2** – Addons (Prometheus, ArgoCD, Dashboard) ✅
* **MVP 3** – AWS EKS Support ⏳
* **MVP 4** – Terraform + Helm integration ⏳
* **MVP 5** – Integration with Project Builder (Staging Mode) ⏳

---

## 🧮 Requirements

* Docker
* Kind
* kubectl
* Bash 5+
* Linux (tested on Arch)

---

## 💡 Vision

Homelab CLI helps DevOps learners and engineers quickly spin up reproducible, ephemeral labs to test cloud-native tools — without breaking their main environments.

---

## 📜 License

MIT License © 2025 Agustín García
