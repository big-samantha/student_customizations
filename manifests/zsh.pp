#zsh class
class student_customizations::zsh {
  package { 'zsh':
    ensure => present,
  }

  vcsrepo { 'ohmyzsh':
    ensure   => present,
    path     => '/root/.oh-my-zsh',
    provider => git,
    source   => 'https://github.com/robbyrussell/oh-my-zsh.git',
  }

  file { '.zshrc':
    ensure => link,
    path   => '/root/.zshrc',
  }

  user { 'root':
    shell   => '/bin/zsh',
    require => Package['zsh'],
  }
}
  




