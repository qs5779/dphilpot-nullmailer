# === Copyright
#
# Copyright Dennis Philpot
#
class nullmailer::config (
  $adminaddr = $::nullmailer::adminaddr,
  $defaultdomain = $::nullmailer::defaultdomain,
  $remotes = $::nullmailer::remotes,
  $me = $::nullmailer::me,
) {
  File {
    ensure  => 'present',
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
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
