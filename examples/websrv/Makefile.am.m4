dnl $Id$
dnl
dnl Process this file with GNU m4 to get Makefile.am
dnl
## Process thit file with automakte to produce Makefile.in
## Do not edit this file directly.  It is generated from Makefile.am.m4
$(PROGRAMS): $(LDEPS_SRV)

SUFFIXES = .g .C

.g.C:
	@rm -f $@
	-$(PUB) $(PUBFLAGS) -o $@ $< || rm -f $@

LDFLAGS = $(SVC_LDFLAGS)

define(`cgi_sources',)dnl
define(`cgi_gfiles',)dnl
define(`cgi_exes',)dnl
define(`cgimk',
changequote([[,]])dnl
[[dnl
define(`cgi_sources', cgi_sources $1.C)dnl
define(`cgi_gfiles', cgi_gfiles $1.g)dnl
define(`cgi_exes', cgi_exes $1)dnl
$1_SOURCES = $2 $1.C
$1.C: $1.g
]]changequote)dnl

dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl
dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl
dnl
dnl ADD NEW CGI Scripts HERE!  (use the cgimk () macro )
dnl
cgimk(sha)
cgimk(sha2)
cgimk(google)
cgimk(pt1)
dnl cgimk(pt2)
cgimk(upload)

dnl
dnl End of the Part the you Need to Edit
dnl
dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl
dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl dnl

LDADD = $(LDADD_SRV)

coredump_SOURCES = coredump.C

okmsvc_PROGRAMS = cgi_exes coredump
dnl
dnl If you want to install in a subdir of $(okmsvcdir), you can
dnl do something like:
dnl
dnl foodir = $(okmsvcdir)/foo
dnl foo_PROGRAMS = cgi_exes coredump
dnl
dnl Or whatever it is you please...
dnl



BUILT_SOURCES = cgi_sources

CLEANFILES = core *.core *~
EXTRA_DIST = .cvsignore
	
MAINTAINERCLEANFILES = Makefile.in Makefile.am

.PHONY: srcclean
srcclean:
	@rm -f cgi_exes rpcmk_built

$(srcdir)/Makefile.am: $(srcdir)/Makefile.am.m4
	@rm -f $(srcdir)/Makefile.am~
	$(M4) $(srcdir)/Makefile.am.m4 > $(srcdir)/Makefile.am~
	mv -f $(srcdir)/Makefile.am~ $(srcdir)/Makefile.am

.PHONY: jail
jail:
	PERL=$(PERL) LDD=$(LDD) MKDIR='$(mkinstalldirs)' DIFF=$(DIFF) \
		$(jailsh) $(okmjaildir) $(DESTDIR)$(okmsvcdir)/*
dnl 
dnl  or if installing under subdirectory "foo", then simply:
dnl
dnl		$(jailsh) $(okmjaildir) $(DESTDIR)$(okmsvcdir)/foo/*
dnl
dnl                   

