class rundeck {
  package {"java-1.8.0"
   ensure => present
  }
  ->
  package {"http://repo.rundeck.org/latest.rpm":
   ensure => present
  }
  -> 
  package {"rundeck":
   ensure => present
  }
  ->
  service{"rundeckd":
   ensure => running
  }

}
