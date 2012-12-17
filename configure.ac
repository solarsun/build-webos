# Process this file with autoconf to produce a configure script.

# Copyright (c) 2008 - 2012 Hewlett-Packard Development Company, L.P.
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

AC_INIT(webos, 0.0)
AC_PREREQ([2.61])
AC_COPYRIGHT([Copyright 2009 Palm, Inc.])
AC_CONFIG_SRCDIR([build-templates/mcf-status.in])

# customization
AC_MSG_CHECKING([customization])
case "$webos_customization" in
"") webos_customization_result="none" ;;
*)
	webos_customization_result=$webos_customization
	webos_customization_feature=":$webos_customization_result"
	;;
esac
AC_SUBST([customization], [$webos_customization])
AC_SUBST([customization_feature], [$webos_customization_feature])
AC_MSG_RESULT([$webos_customization_result])

# parallel_make
AC_MSG_CHECKING([parallel_make])
m4_define([webos_default_parallel_make], [1])
AC_ARG_ENABLE([parallel-make], [AS_HELP_STRING([--enable-parallel-make=N],
		     maximum number of tasks for each submake of bitbake to spawn (default: "webos_default_parallel_make"))],
		     [],
		     [enable_parallel_make="webos_default_parallel_make"])
case "$enable_parallel_make" in
     no|yes) enable_parallel_make=1 ;;
esac
AC_SUBST([parallel_make], [$enable_parallel_make])
AC_MSG_RESULT([$enable_parallel_make])

# bb_number_threads
AC_MSG_CHECKING([bb_number_threads])
m4_define([webos_default_bb_number_threads], [1])
AC_ARG_ENABLE([bb-number-threads], [AS_HELP_STRING([--enable-bb-number-threads=N],
		     maximum number of tasks for each submake of bitbake to spawn (default: "webos_default_bb_number_threads"))],
		     [],
		     [enable_bb_number_threads="webos_default_bb_number_threads"])
case "$enable_bb_number_threads" in
     no|yes) enable_bb_number_threads=1 ;;
esac
AC_SUBST([bb_number_threads], [$enable_bb_number_threads])
AC_MSG_RESULT([$enable_bb_number_threads])

# premirror
AC_MSG_CHECKING([premirror])
m4_define([webos_default_premirror], [http://downloads.yoctoproject.org/mirror/sources])
AC_ARG_ENABLE([premirror], [AS_HELP_STRING([--enable-premirror=M],
		     set PREMIRROR (default: "webos_default_premirror"))],
		     [],
		     [enable_premirror="webos_default_premirror"])
AC_SUBST([premirror], [$enable_premirror])
AC_MSG_RESULT([$enable_premirror])

# network
AC_MSG_CHECKING([network])
AC_ARG_ENABLE([network], [AS_HELP_STRING([--enable-network],
		     enable network fetching (default: "True"))],
		     [case "$enableval" in
yes) enable_no_network="0" ;;
no) enable_no_network="1" ;;
esac],
		     [enable_no_network="0"])
AC_SUBST([no_network], [$enable_no_network])
AC_MSG_RESULT([$enable_network])

# fetch-premirror-only
AC_MSG_CHECKING([fetch_premirror_only])
AC_ARG_ENABLE([fetch_premirror_only], [AS_HELP_STRING([--enable-fetch-premirror-only],
		     fetch only from premirror (default: "False"))],
		     [case "$enableval" in
yes) enable_fetchpremirroronly="1" ;;
no) enable_fetchpremirroronly="0" ;;
esac],
		     [enable_fetchpremirroronly="0"])
AC_SUBST([fetchpremirroronly], [$enable_fetchpremirroronly])
AC_MSG_RESULT([$enable_fetchpremirroronly])

# generate-mirror-tarballs
AC_MSG_CHECKING([generate_mirror_tarballs])
AC_ARG_ENABLE([generate_mirror_tarballs], [AS_HELP_STRING([--enable-generate-mirror-tarballs],
		     generate tarballs suitable for mirroring (default: "False"))],
		     [case "$enableval" in
yes) enable_generatemirrortarballs="1" ;;
no) enable_generatemirrortarballs="0" ;;
esac],
		     [enable_generatemirrortarballs="0"])
AC_SUBST([generatemirrortarballs], [$enable_generatemirrortarballs])
AC_MSG_RESULT([$enable_generatemirrortarballs])

# private-internal-component-mirror
AC_MSG_CHECKING([private_internal_component_mirror])
AC_ARG_ENABLE([private_internal_component_mirror], [AS_HELP_STRING([--enable-private-internal-component-mirror],
		     enable private internal component mirror (default: "False"))],
		     [case "$enableval" in
yes) enable_privateinternalcomponentmirror="git://github-mirror.palm.com/openwebos" ;;
no) enable_privateinternalcomponentmirror="git://github.com/openwebos" ;;
esac],
		     [enable_privateinternalcomponentmirror="git://github.com/openwebos"])
AC_SUBST([privateinternalcomponentmirror], [$enable_privateinternalcomponentmirror])
AC_MSG_RESULT([$enableval])

# distro
AC_MSG_CHECKING([distro])
m4_define([webos_default_distro], [webos])
AC_ARG_ENABLE([distro], [AS_HELP_STRING([--enable-distro=DISTRO],
		     specify distro name (default: "webos_default_distro"))],
		     [],
		     [enable_distro="webos_default_distro"])
AC_SUBST([distro], [$enable_distro])
AC_MSG_RESULT([$enable_distro])

AC_CONFIG_FILES([Makefile:build-templates/Makefile.in])
AC_CONFIG_FILES([bitbake.rc:build-templates/bitbake-rc.in])
AC_CONFIG_FILES([conf/bblayers.conf:build-templates/bblayers-conf.in])
AC_CONFIG_FILES([conf/local.conf:build-templates/local-conf.in])
AC_OUTPUT
