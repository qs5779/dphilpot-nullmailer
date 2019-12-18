# === Copyright
#
# Copyright Dennis Philpot
#
# @param servicegroup
#   autoparameterized from hieradata when not nil or empty string affects onwership/permission of config file remotes
#
class nullmailer (
  Array[String] $remotes,
  String $adminaddr = '',
  String $defaultdomain = $::domain,
  Optional[String] $me = undef,
  Optional[String] $package_ensure = undef,
  Optional[String] $allmailfrom = undef,
  Optional[String] $servicegroup = undef,
  String $package_name  = 'nullmailer',
) {
  contain ::nullmailer::install
  contain ::nullmailer::config
  contain ::nullmailer::service

  Class['nullmailer::install'] -> Class['nullmailer::config'] ~> Class['nullmailer::service']
}
