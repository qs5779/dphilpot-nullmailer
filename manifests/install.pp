# === Copyright
#
# Copyright Dennis Philpot
#
class nullmailer::install () inherits nullmailer {
  package { 'nullmailer':
    ensure => $::package_ensure,
    name   => $::package_name,
  }
}