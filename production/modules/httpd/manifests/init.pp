class httpd {

  case $::osfamily{
   'redhat':{
      $pacotes = ["httpd", "php"]
       $httpd = "httpd"
     }
     'debian' :{
       $pacotes = ["apache2", "php", "libapache2-mod-php"]
       $httpd = "apache2"
     }
   }

   package {$pacotes:
    ensure => present
   }
   ->
   file { "/var/www/html/index.php":
    source => "puppet:///modules/httpd/index.php",
    ensure => present   
   }
   ->
   service { $httpd:
     ensure => running
   }

}

