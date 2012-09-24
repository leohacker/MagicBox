#!/bin/bash
MOIN_INSTDIR=$1
cp wikiconfig.py ${MOIN_INSTDIR}
cp gugiel.py ${MOIN_INSTDIR}/MoinMoin/theme
cp -a gugiel ${MOIN_INSTDIR}/MoinMoin/web/static/htdocs
cp favicon.ico ${MOIN_INSTDIR}/MoinMoin/web/static/htdocs
cp notebook.png ${MOIN_INSTDIR}/MoinMoin/web/static/htdocs/common
cp 1323861109.54.8096 ${MOIN_INSTDIR}/wiki/data/user
rm -rf ${MOIN_INSTDIR}/wiki/data/pages
rm -rf ${MOIN_INSTDIR}/wiki/underlay/pages
ln -s ~/Dropbox/moin/wiki/data/pages ${MOIN_INSTDIR}/wiki/data/
ln -s ~/Dropbox/moin/wiki/underlay/pages ${MOIN_INSTDIR}/wiki/underlay/
