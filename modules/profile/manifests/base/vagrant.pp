# Contains all development specific stuff on vagrant boxes
class profile::base::vagrant () {
  $required_packages = {
    'mlocate' => { ensure => 'present' },
    'unzip'   => { ensure => 'present' },
  }

  ensure_resources('package', $required_packages)

  swap_file::files { '8GB Swap':
    ensure       => present,
    swapfile     => '/var/swap.8gb',
    swapfilesize => '8GB',
  }
}
