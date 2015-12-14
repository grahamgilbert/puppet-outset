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

    if $title !~ /^.*\.(|PY|py|sh|SH|rb|RB)$/ {
        fail('Invalid value for title. Must end in .py, .sh or .rb')
    }

    if $ensure == 'present'{
        if $type == 'file'{
            file {"/usr/local/outset/everyboot-scripts/${priority}-${title}":
                source => $script,
                owner  => 0,
                group  => 0,
                mode   => '0755',
            }
        }

        if $type == 'template'{
            file {"/usr/local/outset/everyboot-scripts/${priority}-${title}":
                content => $script,
                owner  => 0,
                group  => 0,
                mode   => '0755',
            }
        }

        if $immediate_run == true {
            exec { "/usr/local/outset/everyboot-scripts/${priority}-${title}":
                path => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
                refreshonly => true,
                subscribe => File["/usr/local/outset/everyboot-scripts/${priority}-${title}"],
            }
        }
    }

    if $ensure == 'absent' {
        file {"/usr/local/outset/everyboot-scripts/${priority}-${title}":
            ensure => absent,
        }
    }
}
