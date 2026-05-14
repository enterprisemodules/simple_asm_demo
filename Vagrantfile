
unless Vagrant.has_plugin?("vagrant-em-demos")
  puts "Installing vagrant-em-demos plugin. Restart vagrant after installation."
  system "vagrant plugin install vagrant-em-demos"
  exit 1
end

require 'vagrant/em/demos/plugin'
Vagrant.configure("2") do |config|
  # Automatically load settings from servers.yaml for every VM
  config.em.config_file = "servers.yaml"

  # Force public DNS in the guest. VirtualBox 7.x's NAT DNS host resolver
  # (10.0.2.3) is unreliable on macOS — OL9's NetworkManager hangs on it
  # and yum/dnf fails to resolve repo hosts. Pin /etc/resolv.conf to public
  # resolvers and tell NetworkManager not to manage the file. `run: "always"`
  # re-applies on every boot so a destroy/up cycle stays fixed.
  config.vm.provision "fix-dns",
                      type: "shell",
                      run: "always",
                      privileged: true,
                      inline: <<~'SCRIPT'
    if command -v nmcli >/dev/null 2>&1; then
      mkdir -p /etc/NetworkManager/conf.d
      cat > /etc/NetworkManager/conf.d/90-dns-none.conf <<'EOF'
[main]
dns=none
EOF
      systemctl reload NetworkManager 2>/dev/null || true
    fi
    chattr -i /etc/resolv.conf 2>/dev/null || true
    cat > /etc/resolv.conf <<'EOF'
nameserver 8.8.8.8
nameserver 1.1.1.1
EOF
    chattr +i /etc/resolv.conf 2>/dev/null || true
  SCRIPT
end

