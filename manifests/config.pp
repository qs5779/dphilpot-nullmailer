# === Copyright
#
# Copyright Dennis Philpot
#
class nullmailer::config () inherits nullmailer {
  contain nullmailer::install

  File {
    ensure  => 'present',
    mode    => '0644',
    owner   => root,
    group   => root,
    require    => Class['nullmailer::install'],
  }

  file { '/etc/nullmailer':
      ensure => 'directory',
  }

  file {
    '/etc/nullmailer/me':
      content => template('nullmailer/me.erb');
    '/etc/nullmailer/adminaddr':
      content => template('nullmailer/adminaddr.erb');
    '/etc/nullmailer/defaultdomain':
      content => template('nullmailer/defaultdomain.erb');
    '/etc/nullmailer/remotes':
      content => template('nullmailer/remotes.erb');
    '/etc/mailname':
      content => template('nullmailer/mailname.erb');
  }
}