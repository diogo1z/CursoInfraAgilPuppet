class gitlab {
  $pacotes = ["curl", "openssh-server", "ca-certificates","postfix"]

  service{"nginx":
    ensure => stopped
  }
  ->
  package{"nginx":
    ensure => absent
  }
  ->
  exec {"apt-update":
    command => '/usr/bin/apt-get update'
  }
  ->
  package{$pacotes:
    ensure => present
  }
  ->
 exec {"baixar_script":
    command => '/usr/bin/wget https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh -O /tmp/script.sh'
  }
 ->
 exec {"executar_script":
    command => '/bin/bash /tmp/script.sh'
  }
 ->
 package {"gitlab-ce":
    ensure => present
 }


}
