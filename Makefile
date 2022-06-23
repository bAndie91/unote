
source = ./unote
target = /usr/bin/unote

all:
	true

install:
	install -o root -g root -m 0755 $(source) $(target)

uninstall:
	rm $(target)

check-install:
	cmp $(source) $(target)
