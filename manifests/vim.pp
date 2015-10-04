#vim class
class student_customizations::vim {
  if defined(File['/root/.vimrc']) {
    fail('Vimrc is already being managed.')
  }
  vcsrepo { 'dotfiles':
    ensure   => present,
    path     => '/root/dotfiles',
    provider => git,
    source   => 'https://github.com/pizzaops/dotfiles.git',
  }
  vcsrepo { 'Vundle.vim':
    ensure   => present,
    path     => '/root/.vim/bundle/Vundle.vim',
    provider => git,
    source   => 'https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim',
  }
  file { '.vimrc':
    ensure  => link,
    path    => '/root/.vimrc',
    target  => '/root/dotfiles/home/.vimrc',
    require => Vcsrepo['dotfiles','Vundle.vim'],
  }
  file {'.vimrc.settings':
    ensure  => link,
    path    => '/root/.vimrc.settings',
    target  => '/root/dotfiles/home/.vimrc',
    require => Vcsrepo['dotfiles','Vundle.vim'],
  }
  exec { 'vundle install':
    command => '/usr/bin/vim +PluginInstall +qall',
    creates => '/root/.vim/bundle/gist-vim',
    require => File['.vimrc','.vimrc.settings'],
  }
}
