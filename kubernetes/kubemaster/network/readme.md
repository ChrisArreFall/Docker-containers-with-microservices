Copy content of `interfaces` to `/etc/networks/interfaces`.

Apply changes with:

    sudo ip addr flush enp0s3 && sudo systemctl restart networking.service

Verify the static IP configuration:

    ifconfig