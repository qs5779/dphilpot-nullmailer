# === Copyright
#
# Copyright Dennis Philpot
#
class nullmailer (
  $adminaddr      = undef,
  $defaultdomain  = undef,
  $remotes        = undef,
  $me             = $::hostname,
  $package_ensure = undef,
  $package_name   = 'nullmailer',
) {
  contain stdlib

  validate_re($adminaddr, '[-0-9a-zA-Z.+_]+@[-0-9a-zA-Z.+_]', 'Invalid E-Mail address')
  validate_string($defaultdomain)
  validate_array($remotes)
  validate_string($me)

  include nullmailer::install
  include nullmailer::config
  include nullmailer::service
}