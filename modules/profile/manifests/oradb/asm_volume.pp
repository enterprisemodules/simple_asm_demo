# Docs
# TODO: Write documentation
class profile::oradb::asm_volume()
{
  ora_asm_volume{'DATA:volume1@+ASM':
    size      => '1G',
    mountpath => '/mnt',
  }
}
