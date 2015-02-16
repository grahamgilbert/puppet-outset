class outset::setup {
  # We will install the package when there's one available

  if ! defined(File['/usr/local']) {
    file { '/usr/local':
      ensure => directory,
    }
  }

  if ! defined(File['/usr/local/outset']) {
    file { '/usr/local/outset':
      ensure => directory,
    }
  }

  if ! defined(File['/usr/local/outset/everyboot-scripts']) {
    file { '/usr/local/outset/everyboot-scripts':
      ensure => directory,
    }
  }

  if ! defined(File['/usr/local/outset/firstboot-scripts']) {
    file { '/usr/local/outset/firstboot-scripts':
      ensure => directory,
    }
  }

  if ! defined(File['/usr/local/outset/firstboot-packages']) {
    file { '/usr/local/outset/usr/local/outset/firstboot-packages':
      ensure => directory,
    }
  }

  if ! defined(File['/usr/local/outset/login-once']) {
    file { '/usr/local/outset/login-once':
      ensure => directory,
    }
  }

  if ! defined(File['/usr/local/outset/login-every']) {
    file { '/usr/local/outset/login-every':
      ensure => directory,
    }
  }

}