class metacpan::perl {
    
    # Packages we need to build stuff
    package { 
        # for https
        'libssl-dev': ensure => present;
        # for gzip
        'zlib1g-dev': ensure => present;
        # for Test::XPath 
        'libxml2-dev': ensure => present;
        # for XML::Parser (used by Test::XPath)
        'libexpat1-dev': ensure => present;        
    }

    # install the perl
    perlbrew::build { "metalib": version => "5.14.2" }

    # install cpanm
    perlbrew::install_cpanm { "metalib": }
}

class metacpan::perl::modules inherits metacpan::perl {

    # list our perl modules
    $cpan_modules = [
        'AnyEvent::HTTP',
        'Archive::Any',
        'Archive::Any::Plugin',
        'Archive::Tar',
        'Captcha::reCAPTCHA',
        'Catalyst',
        'Catalyst::Action::RenderView',
        'Catalyst::Authentication::Store::Proxy',
        'Catalyst::Authentication::User',
        'Catalyst::Controller',
        'Catalyst::Controller::ActionRole',
        'Catalyst::Controller::REST',
        'Catalyst::Model',
        'Catalyst::Plugin::Authentication',
        'Catalyst::Plugin::ConfigLoader',
        'Catalyst::Plugin::Session',
        'Catalyst::Plugin::Session::State::Cookie',
        'Catalyst::Plugin::Session::Store',
        'Catalyst::Plugin::Static::Simple',
        'Catalyst::Plugin::Unicode::Encoding',
        'Catalyst::TraitFor::Request::REST::ForBrowsers',
        'Catalyst::Utils',
        'Catalyst::View',
        'Catalyst::View::JSON',
        'Catalyst::View::TT::Alloy',
        'CatalystX::Component::Traits',
        'CatalystX::InjectComponent',
        'CatalystX::RoleApplicator',
        'CHI',
        'Class::MOP',
        'Config::General',
        'Config::JFDI',
        'CPAN::DistnameInfo',
        'CPAN::Faker',
        'CPAN::Meta',
        'Cwd',
        'Data::DPath',
        'Data::Dump',
        'Data::Dumper',
        'DateTime',
        'DateTime::Format::HTTP',
        'DateTime::Format::ISO8601',
        'DBD::SQLite',
        'DBI',
        'Devel::ArgNames',
        'Digest::MD5',
        'Digest::SHA1',
        'Dist::Zilla::Plugin::Prereqs',
        'Dist::Zilla::PluginBundle::Filter',
        'Dist::Zilla::PluginBundle::JQUELIN',
        'ElasticSearch',
        'ElasticSearch::TestServer',
        'ElasticSearchX::Model',
        'ElasticSearchX::Model::Document',
        'ElasticSearchX::Model::Document::Set',
        'ElasticSearchX::Model::Document::Types',
        'ElasticSearchX::Model::Util',
        'Email::Address',
        'Email::Sender::Simple',
        'Email::Simple',
        'Email::Valid',
        'Encode',
        'EV',
        'Exporter',
        'Facebook::Graph',
        'File::Basename',
        'File::Copy',
        'File::Find',
        'File::Find::Rule',
        'File::Path',
        'File::Rsync::Mirror::Recent',
        'File::Spec',
        'File::Spec::Functions',
        'File::stat',
        'File::Temp',
        'Find::Lib',
        'FindBin',
        'Graph::Centrality::Pagerank',
        'Gravatar::URL',
        'Hash::AsObject',
        'Hash::Merge',
        'Hash::Merge::Simple',
        'HTML::Restrict',
        'HTML::Tree',
        'HTTP::Request::Common',
        'IO::All',
        'IO::Interactive',
        'IO::String',
        'IO::Uncompress::Bunzip2',
        'IO::Zlib',
        'IPC::Run3',
        'JSON',
        'JSON::XS',
        'List::MoreUtils',
        'List::Util',
        'Log::Contextual',
        'Log::Log4perl',
        'Log::Log4perl::Appender::ScreenColoredLevels',
        'LWP::Protocol::https',
        'LWP::UserAgent',
        'Module::Build',
        'Module::Find',
        'Module::Metadata',
        'Module::Pluggable',
        'Moose',
        'Moose::Role',
        'Moose::Util',
        'MooseX::Aliases',
        'MooseX::Attribute::Deflator',
        'MooseX::ChainedAccessors',
        'MooseX::Getopt',
        'MooseX::Getopt::OptionTypeMap',
        'MooseX::Types',
        'MooseX::Types::Common::String',
        'MooseX::Types::ElasticSearch',
        'MooseX::Types::Moose',
        'MooseX::Types::Path::Class',
        'MooseX::Types::Structured',
        'Mozilla::CA',
        'namespace::autoclean',
        'Net::Twitter',
        'Parse::CPAN::Packages::Fast',
        'Parse::CSV',
        'Path::Class',
        'PerlIO::gzip',
        'Plack::App::Directory',
        'Plack::Middleware::Assets',
        'Plack::Middleware::Header',
        'Plack::Middleware::ReverseProxy',
        'Plack::Middleware::Runtime',
        'Plack::Middleware::ServerStatus::Lite',
        'Plack::Middleware::Session',
        'Plack::MIME',
        'Plack::Session::Store',
        'Plack::Test',
        'Plack::Util::Accessor',
        'Pod::Coverage::Moose',
        'Pod::Markdown',
        'Pod::POM',
        'Pod::Simple::XHTML',
        'Pod::Text',
        'Regexp::Common',
        'Regexp::Common::time',
        'Starman',
        'Template::Alloy',
        'Template::Plugin::JSON',
        'Template::Plugin::Markdown',
        'Template::Plugin::Number::Format',
        'Template::Plugin::Page',
        'Test::Aggregate',
        'Test::More',
        'Test::Most',
        'Test::XPath',
        'Time::Local',
        'Try::Tiny',
        'URI',
        'URI::Escape',
        'WWW::Mechanize',
        'WWW::Mechanize::Cached',
        'XML::Feed',
        'XML::Simple',
        'YAML',
        'YAML::Syck',

    ]
    # install our perl modules
    # use perlbrew::install_no_test_module if you dont' want to run tests
    perlbrew::install_no_test_module {
        $cpan_modules:
            perl => 'metalib';
    }
}



