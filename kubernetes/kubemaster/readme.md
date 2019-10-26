Install Kubernetes in Ubuntu Server 16.04.

Run the following commands to configure the server:

    sudo sh k8s-container-installer.sh

To use the systemd cgroup driver, set `plugins.cri.systemd_cgroup = true` in `/etc/containerd/config.toml`.

    sudo sh k8s-installer.sh