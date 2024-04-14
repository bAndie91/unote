
all:
	@echo 'make install perhaps?'
	false
.PHONY: all

install: /usr/bin/unote /usr/share/applications/uNote.desktop /usr/share/menu/uNote /usr/share/doc/uNote/LICENSE /usr/share/doc/uNote/COMMIT /usr/share/doc/uNote/VERSION
.PHONY: install

/usr/bin/unote: unote
	install $< $@

/usr/share/applications/uNote.desktop: uNote.desktop
	install -m 0644 $< $@
	update-desktop-database

/usr/share/menu/uNote: uNote.menu
	install -m 0644 $< $@
	update-menus

/usr/share/doc/uNote:
	mkdir -p $@

/usr/share/doc/uNote/LICENSE: LICENSE | /usr/share/doc/uNote
	install -m 0644 $< $@

/usr/share/doc/uNote/VERSION: | /usr/share/doc/uNote
	git describe --tags > $@

/usr/share/doc/uNote/COMMIT: | /usr/share/doc/uNote
	git show -s --format=%H > $@

uninstall:
	rm /usr/share/applications/uNote.desktop
	rm /usr/share/menu/uNote
	rm /usr/share/doc/uNote/LICENSE
	rm /usr/share/doc/uNote/VERSION
	rm /usr/share/doc/uNote/COMMIT
	rmdir /usr/share/doc/uNote
	rm /usr/bin/unote
.PHONY: uninstall

check-installed-script:
	cmp unote /usr/bin/unote
.PHONY: check-installed-script
