#!/bin/sh -e

# Copyright (c) 2008-2013 Hewlett-Packard Development Company, L.P.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This has only been tested on Ubuntu-12.04 amd64.

check_sanity=true
usage="$0 [--help|-h|-H]"

for i ; do
    case "$i" in
        --help|-h|-H) echo ${usage} ;;
        *)
            echo Unrecognized option: $i 1>&2
            echo ${usage}
            exit 1
            ;;
    esac
done

sane=true

distributor_id="`/usr/bin/lsb_release -s -i`"
release="`/usr/bin/lsb_release -s -r`"
description="`/usr/bin/lsb_release -s -d`"
codename="`/usr/bin/lsb_release -s -c`"
arch="`/usr/bin/dpkg --print-architecture`"

case "${check_sanity}" in
    true)
        if [ ! -x /usr/bin/lsb_release ] ; then
            echo 'WARNING: /usr/bin/lsb_release not available, cannot test sanity of this system.' 1>&2
            sane=false
        fi

        case "${distributor_id}" in
            Ubuntu) ;;
            *) sane=false ;;
        esac

        case "${release}" in
            12.04) ;;
            12.10) ;;
            *) sane=false ;;
        esac

        case "${description}" in
            'Ubuntu 12.04.1 LTS') ;;
            'Ubuntu 12.04.2 LTS') ;;
            'Ubuntu 12.10') ;;
            *) sane=false ;;
        esac

        case "${codename}" in
            precise) ;;
            quantal) ;;
            *) sane=false ;;
        esac

        case "${arch}" in
            i386) ;;
            amd64) ;;
            *) sane=false ;;
        esac

        case "${sane}" in
            true) ;;
            false)
                echo 'WARNING: This system configuration is untested. Let us know if it works.' 1>&2
                ;;
        esac
        ;;

    false) ;;
esac

apt-get update

# These are essential on ubuntu
essential="\
    bzip2 \
    gzip \
    tar \
    wget \
"

# And we need these when on 64-bit Ubuntu ...
amd64_specific="\
    g++-multilib \
    gcc-multilib \
    libc6-dev-i386 \
    zlib1g:i386 \
"

[ "${arch}" = amd64 ] && essential="${essential} ${amd64_specific}"

apt-get install --yes \
    ${essential} \
    bison \
    build-essential \
    chrpath \
    diffstat \
    gawk \
    git \
    language-pack-en \
    libgl1-mesa-dev \
    libglu1-mesa-dev \
    libsdl1.2-dev \
    python3 \
    subversion \
    texi2html \
    texinfo \

