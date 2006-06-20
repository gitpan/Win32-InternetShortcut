use ExtUtils::MakeMaker;

WriteMakefile(
    NAME              => 'Win32::InternetShortcut',
    VERSION_FROM      => 'lib/Win32/InternetShortcut.pm',
    PREREQ_PM         => {},
    ($] >= 5.005 ?
      (ABSTRACT_FROM  => 'lib/Win32/InternetShortcut.pm',
       AUTHOR         => 'Kenichi Ishigaki <ishigaki@cpan.org>') : ()),
    LIBS              => [],
    DEFINE            => '',
    INC               => '-I.',
    # OBJECT            => '$(O_FILES)', # link all the C files too
    XS                => { 'InternetShortcut.xs' => 'InternetShortcut.cpp' },
);

sub MY::xs_c {
    '
.xs.cpp:
  $(PERL) -I$(PERL_ARCHLIB) -I$(PERL_LIB) $(XSUBPP) $(XSPROTOARG) $(XSUBPPARGS) $*.xs >xstmp.c && $(MV) xstmp.c $*.cpp
';
}