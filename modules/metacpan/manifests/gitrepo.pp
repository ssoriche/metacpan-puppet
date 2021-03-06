# === Definition metacpan::gitrepo
#
# In Hiera:
#
#   metacpan::website:
#     www:
#       enable_git_repo: true
#       path: /home/%{hiera('metacpan::user')}/metacpan.org
#       source: 'https://github.com/metacpan/metacpan-web.git'
#       revision: 'master' # optional
#       owner: 'metacpan' # default
#       group: 'metacpan' # default
#
# Or for just a git repo
#
# metacpan::git::repo:
#    metacpan-cpan-extracted:
#      enable_git_repo: true
#      source: 'https://github.com/metacpan/metacpan-cpan-extracted.git'
#      revision: 'master'
#      path: '/mnt/lv-ssdscratch/metacpan-cpan-extracted'
#      owner: 'toddr'
#      group: 'toddr'
#
define metacpan::gitrepo (
    $ensure = present, # set to latest to force
    $enable_git_repo   = false,
    $path     = 'UNSET',
    $source   = 'UNSET',
    $revision = 'master',
    $owner    = 'metacpan',
    $group    = 'metacpan',
    $identity = 'UNSET',
) {

  if($enable_git_repo == true) {

    # create the directory first incase owner does not have permissions
    file { $path:
        ensure => directory,
        owner   => $owner,
        group   => $group,
        mode    => '0775',
        require => [ User[$owner] ],
    }

    vcsrepo { $path:
        ensure   => $ensure,
        provider => git,
        source   => $source,
        revision => $revision,
        user     => $owner,
        owner    => $owner,
        group    => $group,
#       identity => $identity,
    }
  }
}
