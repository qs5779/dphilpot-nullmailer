# === Copyright
#
# Copyright Dennis Philpot
#
# @param servicegroup
#   when not nil or empty string affects onwership/permission of config file remotes
#
class nullmailer::config (
  $allmailfrom = $::nullmailer::allmailfrom,
  $adminaddr = $::nullmailer::adminaddr,
  $defaultdomain = $::nullmailer::defaultdomain,
  $remotes = $::nullmailer::remotes,
  $me = $::nullmailer::me,
  $servicegroup = $::nullmailer::servicegroup,
) {
  File {
    ensure => 'file',
    mode   => '0644',
    owner  => 'root',
    group  => 'root',
  }

  file { '/etc/nullmailer':
    ensure => 'directory',
  }

  if $me and $me != '' {
    file { '/etc/nullmailer/me':
      content => "${me}\n",
    }
  } else {
    file { '/etc/nullmailer/me':
      ensure => 'absent',
    }
  }

  file { '/etc/nullmailer/adminaddr':
    content => "${adminaddr}\n",
  }

  file { '/etc/nullmailer/defaultdomain':
    content => "${defaultdomain}\n";
  }

  if $servicegroup and $servicegroup != '' {
    file { '/etc/nullmailer/remotes':
      group   => $servicegroup,
      mode    => '0640',
      content => template('nullmailer/remotes.erb');
    }
  } else {
    file { '/etc/nullmailer/remotes':
      content => template('nullmailer/remotes.erb');
    }
  }

  file { '/etc/mailname':
    content => "${defaultdomain}\n";
  }

  if $allmailfrom and $allmailfrom != '' {
    file { '/etc/nullmailer/allmailfrom':
      content => "${allmailfrom}\n",
    }
  } else {
    file { '/etc/nullmailer/allmailfrom':
      ensure => 'absent',
    }
  }
}
