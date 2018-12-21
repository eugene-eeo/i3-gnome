#
# Global Settings
#

INSTALL = install
DESTDIR ?= /
PREFIX  ?= $(DESTDIR)/usr

PATH_HWM_GNOME = $(PREFIX)/bin/HWM-gnome
PATH_HWM_GNOME_DESKTOP = $(PREFIX)/share/applications/HWM-gnome.desktop
PATH_HWM_GNOME_SESSION = $(PREFIX)/share/gnome-session/sessions/HWM-gnome.session
PATH_HWM_GNOME_XSESSION = $(PREFIX)/share/xsessions/HWM-gnome.desktop
PATH_GNOME_SESSION_HWM = $(PREFIX)/bin/gnome-session-HWM

#
# Targets
#

all:
	@echo "Nothing to do"


install:
	$(INSTALL) -m0644 -D session/HWM-gnome-xsession.desktop $(PATH_HWM_GNOME_XSESSION)
	$(INSTALL) -m0644 -D session/HWM-gnome.desktop $(PATH_HWM_GNOME_DESKTOP)
	$(INSTALL) -m0644 -D session/HWM-gnome.session $(PATH_HWM_GNOME_SESSION)
	$(INSTALL) -m0755 -D session/HWM-gnome $(PATH_HWM_GNOME)
	$(INSTALL) -m0755 -D session/gnome-session-HWM $(PATH_GNOME_SESSION_HWM)



uninstall:
	rm -f $(PATH_HWM_GNOME)
	rm -f $(PATH_HWM_GNOME_DESKTOP)
	rm -f $(PATH_HWM_GNOME_SESSION)
	rm -f $(PATH_HWM_GNOME_XSESSION)
	rm -f $(PATH_GNOME_SESSION_HWM)



.PHONY: all install uninstall
