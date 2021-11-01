#!/bin/sh
#
# Specifically for windows, where installing autoconf looks suspiciously
# like boiling the ocean.

VERSION=$(cat VERSION)

sed \
    -e "s%@N2N_VERSION_SHORT@%$VERSION%g" \
    -e "s%@GIT_COMMITS@%FIXME%g" \
    -e "s%@CC@%gcc%g" \
    -e "s%@AR@%ar%g" \
    -e "s%@CFLAGS@%$CFLAGS%g" \
    -e "s%@LDFLAGS@%$LDFLAGS%g" \
    -e "s%@N2N_LIBS@%$LDLIBS%g" \
    < Makefile.in > Makefile

sed \
    -e "s%@ADDITIONAL_TOOLS@%%g" \
    < tools/Makefile.in > tools/Makefile

cat <<EOF >include/config.h
#define PACKAGE_VERSION "FIXME"
#define PACKAGE_OSNAME "FIXME"
EOF
