# === Copyright
#
# Copyright Dennis Philpot
#
class nullmailer::config () inherits nullmailer {
  contain nullmailer::install

  File {
    ensure  => 'present',
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    require => Class['nullmailer::install'],
  }

  file { '/etc/nullmailer':
    ensure => 'directory',
  }

  file {
    '/etc/nullmailer/me':
      content => "${me}\n";
    '/etc/nullmailer/adminaddr':
      content => "${adminaddr}\n";
    '/etc/nullmailer/defaultdomain':
      content => "${defaultdomain}\n";
    '/etc/nullmailer/remotes':
      content => template('nullmailer/remotes.erb');
    '/etc/mailname':
      content => "${defaultdomain}\n";
  }
}
