class base {
 $pacotes = ["vim","sysstat", "htop", "telnet", "iotop", "nmon", "netcat", "nmap"]

  package {$pacotes:
   ensure => present,
  }
}
