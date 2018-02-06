class nginx::config(
  String $ensure                 = $::nginx::ensure,
  String $config_dir             = $::nginx::config_dir,
  String $mode                   = $::nginx::config_mode,
  String $owner                  = $::nginx::config_owner,
  String $group                  = $::nginx::config_group,
  String $confd                  = $::nginx::config_confd,
  String $log_dir                = $::nginx::congig_log_dir,
  String $pid_file               = $::nginx::config_pid_file,
  Optional[String] $vdir_enable  = $::nginx::config_vdir_enable,
  String $process_user           = $::nginx::config_process_user,
  String $docroot                = $::nginx::docroot,
) {
  file { 'nginx_conf':
    ensure  => $ensure,
    path    => "${config_dir}/nginx.conf",
    mode    => $mode,
    owner   => $owner,
    group   => $group,
    content => template("${module_name}/conf.dnginx.conf.erb"),
  }
}
