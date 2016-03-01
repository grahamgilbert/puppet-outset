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
  # Maybe we're not getting a version. Stops warnings.
  if is_string($outset_version) {
      if versioncmp($outset_version, '1.0.3') >= 0 {
          # These were changed in 1.0.3
          if ! defined(File['/usr/local/outset/boot-every']) {
            file { '/usr/local/outset/boot-every':
              ensure => directory,
            }
          }

          if ! defined(File['/usr/local/outset/on-demand']) {
            file { '/usr/local/outset/on-demand':
              ensure => directory,
            }
          }
      } else {
          if ! defined(File['/usr/local/outset/everyboot-scripts']) {
            file { '/usr/local/outset/everyboot-scripts':
              ensure => directory,
            }
          }
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
