#!/bin/bash -ex
VERSION=2.8.2
REVISION=4

wget http://deb.debian.org/debian/pool/main/s/sssd/sssd_$VERSION-$REVISION.debian.tar.xz
tar xf sssd_$VERSION-$REVISION.debian.tar.xz
rm sssd_$VERSION-$REVISION.debian.tar.xz

wget http://deb.debian.org/debian/pool/main/s/sssd/sssd_$VERSION.orig.tar.gz
tar xf sssd_$VERSION.orig.tar.xz --strip 1
rm sssd_$VERSION.orig.tar.xz

# ------- specific to grub2 --------
#rm debian/patches/efi-variable-storage-minimise-writes.patch
#sed -i.bak 's/efi-variable-storage-minimise-writes.patch//' debian/patches/series
#rm debian/patches/series.bak

#cp zpool-degraded-vdev.patch debian/patches
#echo 'zpool-degraded-vdev.patch' >> debian/patches/series

#cp rectify-terminal-io.patch debian/patches
#echo 'rectify-terminal-io.patch' >> debian/patches/series
# ------------------------------------

# ------ Might be generic, but with tweaks ------
#echo -e "$(cat changelog)\n\n$(cat debian/changelog)" > debian/changelog

#sed -i.bak "s/deb_version\s*:=.\+/deb_version\t\t:= "'"'"$VERSION-$REVISION"'"'"/" debian/rules
#rm debian/rules.bak

#sed -i.bak "s/^version_binary.\+/version_binary="'"'"$VERSION-$REVISION"'"'"/" debian/signing-template.generate
#sed -i.bak "s/^version_mangled.\+/version_mangled="'"'"$VERSION"'"'"/" debian/signing-template.generate
#rm debian/signing-template.generate.bak

#echo -e "\ndh_auto_test:\n" >> debian/rules
