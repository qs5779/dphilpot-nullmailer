# === Copyright
#
# Copyright Dennis Philpot
#
class nullmailer (
  Pattern['[-0-9a-zA-Z.+_]+@[-0-9a-zA-Z.+_]'] $adminaddr,
  Array[String] $remotes,
  String $defaultdomain = $::domain,
  String $me = $::hostname,
  Optional[String] $package_ensure = undef,
  String $package_name  = 'nullmailer',
) {
  contain ::nullmailer::install
  contain ::nullmailer::config
  contain ::nullmailer::service

  Class['nullmailer::install'] -> Class['nullmailer::config'] ~> Class['nullmailer::service']
}
