PREFIX=${HOME}/.local

all: ipython-notebook-wrapper

ipython-notebook-browser: ipython-notebook-browser.in
	sed -e "s|PREFIX|${PREFIX}|" ipython-notebook-browser.in > ipython-notebook-browser

ipython-notebook-wrapper: ipython-notebook-wrapper.in
	sed -e "s|PREFIX|${PREFIX}|" ipython-notebook-wrapper.in > ipython-notebook-wrapper
	
ipython-notebook-wrapper.desktop: ipython-notebook-wrapper.desktop.in
	sed -e "s|PREFIX|${PREFIX}|" ipython-notebook-wrapper.desktop.in > ipython-notebook-wrapper.desktop

install: ipython-notebook-browser ipython-notebook-wrapper ipython-notebook-wrapper.desktop
	mkdir -p ${PREFIX}/bin
	cp ipython-notebook-browser ipython-notebook-wrapper ${PREFIX}/bin
	chmod +x ${PREFIX}/bin/ipython-notebook-browser ${PREFIX}/bin/ipython-notebook-wrapper
	mkdir -p ${PREFIX}/share/icons/hicolor/scalable/apps
	cp ipython-notebook-wrapper.svg ${PREFIX}/share/icons/hicolor/scalable/apps
	desktop-file-install --rebuild-mime-info-cache ipython-notebook-wrapper.desktop --dir=${PREFIX}/share/applications	
	
clean:
	rm -f ipython-notebook-browser ipython-notebook-wrapper ipython-notebook-wrapper.desktop
