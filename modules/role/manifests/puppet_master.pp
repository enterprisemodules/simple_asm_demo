class role::puppet_master
{
  contain pe_repo::platform::el_7_x86_64
  contain pe_repo::platform::el_8_x86_64
}
