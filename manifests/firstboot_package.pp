define outset::firstboot_package(
    $script,
    $priority = '10',
    $ensure = 'present'
){
    require outset::setup

    if $ensure != 'present' and $ensure !='absent'{
        fail('Invalid value for ensure')
    }

    if $title =~ ^.*\.(|pkg|PKG)$ {
        notice('Valid Package')
    }else{
        fail('Not a valid package. Title must end in .pkg')
    }
    
    if $ensure == 'present'{
        file {"/usr/local/outset/firstboot-packages/${priority}-${title}":
            source => $script,
            owner  => 0,
            group  => 0,
            mode   => '0755',
        }
    }

    if $ensure == 'absent' {
        file {"/usr/local/outset/firstboot-packages/${priority}-${title}":
            ensure => absent,
        }
    }
}