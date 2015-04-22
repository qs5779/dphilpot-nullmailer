# === Copyright
#
# Copyright Dennis Philpot
#
class nullmailer::service () inherits nullmailer {
  contain nullmailer::config

  service { 'nullmailer':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => Class['nullmailer::config'],
  }
}