define outset::everyboot(
    $script,
    $priority = '10',
    $ensure = 'present',
    $type = 'file',
    $immediate_run = false,
){
    require outset::setup

    if $ensure != 'present' and $ensure !='absent'{
        fail('Invalid value for ensure')
    }

    if versioncmp($outset_version, '1.0.3') == -1 {
        if $title !~ /^.*\.(|PY|py|sh|SH|rb|RB)$/ {
            fail('Invalid value for title. Must end in .py, .sh or .rb')
        }
    }
    # Maybe we're not getting a version. Stops warnings.
    if $outset_version.is_a(String) {
        if versioncmp($outset_version, '1.0.3') >= 0 {
            # These were changed in 1.0.3
            $target = '/usr/local/outset/boot-every'
        } else {
            $target = '/usr/local/outset/everyboot-scripts'
        }

        if $ensure == 'present'{
            if $type == 'file'{
                file {"${target}/${priority}-${title}":
                    source => $script,
                    owner  => 0,
                    group  => 0,
                    mode   => '0755',
                }
            }

            if $type == 'template'{
                file {"${target}/${priority}-${title}":
                    content => $script,
                    owner  => 0,
                    group  => 0,
                    mode   => '0755',
                }
            }

            if $immediate_run == true {
                exec { "${target}/${priority}-${title}":
                    path => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
                    refreshonly => true,
                    subscribe => File["${target}/${priority}-${title}"],
                }
            }
        }

        if $ensure == 'absent' {
            file {"${target}/${priority}-${title}":
                ensure => absent,
            }
        }
    }
}
