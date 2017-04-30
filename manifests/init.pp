# === Copyright
#
# Copyright Dennis Philpot
#
class nullmailer (
  Pattern['[-0-9a-zA-Z.+_]+@[-0-9a-zA-Z.+_]'] $adminaddr,
  String $defaultdomain,
  Array[String] $remotes,
  String $me = $::hostname,
  Optional[String] $package_ensure = undef,
  String $package_name  = 'nullmailer',
) {
  include ::nullmailer::install
  include ::nullmailer::config
  include ::nullmailer::service
}
