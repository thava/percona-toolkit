use ExtUtils::MakeMaker;

WriteMakefile(
    NAME      => 'percona-toolkit',
    VERSION   => '3.0.11',
    EXE_FILES => [ <bin/*> ],
    MAN1PODS  => {
      'docs/percona-toolkit.pod' => 'blib/man1/percona-toolkit.1p',
      map {
         (my $name = $_) =~ s/^bin.//;
         my $file_name = $_;
         if ( $file_name !~ m/mongo/ ) {
             $_ => "blib/man1/$name.1p";
        }
      } <bin/*>
    },
    MAN3PODS     => {}, # man(3) pages are for C libs
    PREREQ_PM    => {
        DBI           => 1.46,
        DBD::mysql    => 3.0000_0,
    },
);
