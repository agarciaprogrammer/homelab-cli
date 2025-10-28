#!/usr/bin/env bash
set -e

CONFIG_FILE="config/defaults.yaml"
SESSION_FILE="$HOME/.homelab/active-session.yaml"

# Load defaults
CLUSTER_NAME=$(grep 'cluster_name:' "$CONFIG_FILE" | awk '{print $2}')
NODE_COUNT=$(grep 'node_count:' "$CONFIG_FILE" | awk '{print $2}')

create_cluster() {
  echo "🧪 Creating Kubernetes cluster '$CLUSTER_NAME' with $NODE_COUNT node(s)..."
  kind create cluster --name "$CLUSTER_NAME" --config - <<EOF
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
  - role: control-plane
$(for i in $(seq 1 "$((NODE_COUNT - 1))"); do echo "  - role: worker"; done)

EOF

  echo "✅ Cluster created successfully."
  mkdir -p "$(dirname "$SESSION_FILE")"
  echo "cluster_name: $CLUSTER_NAME" > "$SESSION_FILE"
  echo "provider: kind" >> "$SESSION_FILE"
}

destroy_cluster() {
  if [ ! -f "$SESSION_FILE" ]; then
    echo "⚠️ No active homelab session found."
    exit 1
  fi
  CLUSTER_NAME=$(grep 'cluster_name:' "$SESSION_FILE" | awk '{print $2}')
  echo "🧹 Destroying cluster '$CLUSTER_NAME'..."
  kind delete cluster --name "$CLUSTER_NAME"
  rm -f "$SESSION_FILE"
  echo "✅ Homelab session cleared."
}

case "$1" in
  create)
    create_cluster
    ;;
  destroy)
    destroy_cluster
    ;;
  *)
    echo "Usage: kind.sh {create|destroy}"
    ;;
esac
