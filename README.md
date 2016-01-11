puppet-outset
===================

## Usage

Using a file distributed via pluginsync

``` puppet
outset::everyboot{'disable_wifi.sh':
    script => 'puppet:///modules/mac_base/disable_wifi/disable_wifi.sh'
}
```

Using a template, and a high priority value to make it run last (default is 10)

```
outset::login_once{'dock.sh':
    script  => template('mac_base/dock/dock.sh.erb'),
    type    => 'template',
    priorty => 99
}
```

## Requirements

This module requires the [stdlib module by Puppet Labs](https://forge.puppetlabs.com/puppetlabs/stdlib)
