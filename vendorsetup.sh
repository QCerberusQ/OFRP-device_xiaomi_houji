#!/bin/bash
#
#	This file is part of the OrangeFox Recovery Project
#	Copyright (C) 2020-2026 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
#	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
#	Please maintain this if you use this script or any part of it
#

FDEVICE="houji"

fox_get_target_device() {
	local chkdev=""
	if echo "$BASH_SOURCE" | grep -q "/$FDEVICE/"; then
		FOX_BUILD_DEVICE="$FDEVICE"
		return
	fi

	if echo "${BASH_SOURCE[0]}" | grep -q "/$FDEVICE/"; then
		FOX_BUILD_DEVICE="$FDEVICE"
		return
	fi

	chkdev=$(set | grep BASH_ARGV | grep -w "$FDEVICE")
	if [ -n "$chkdev" ]; then
		FOX_BUILD_DEVICE="$FDEVICE"
		return
	fi
	
	if echo "$0" | grep -q "$FDEVICE"; then
		FOX_BUILD_DEVICE="$FDEVICE"
		return
	fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
	fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then

	# -----------------------------------------------------------------------
	# Build environment 
	# -----------------------------------------------------------------------
	export LC_ALL="C"
	export TARGET_ARCH="arm64"
	export ALLOW_MISSING_DEPENDENCIES=true

	# -----------------------------------------------------------------------
	# Build identity
	# -----------------------------------------------------------------------
	export FOX_BUILD_TYPE="Beta"
	export TARGET_DEVICE_ALT="houjiin"
	export FOX_TARGET_DEVICES="houji,houjiin"

	# -----------------------------------------------------------------------
	# A/B + Virtual A/B
	# -----------------------------------------------------------------------
	export FOX_AB_DEVICE=1
	export FOX_VIRTUAL_AB_DEVICE=1

	# -----------------------------------------------------------------------
	# Partition mapper (dynamic partitions on super)
	# -----------------------------------------------------------------------
	export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
	export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"

	# -----------------------------------------------------------------------
	# Storage / Theme Paths
	# -----------------------------------------------------------------------
	export FOX_SETTINGS_ROOT_DIRECTORY=/persist/recovery
	export FOX_MISCELLANEOUS_ROOT_DIRECTORY=/sdcard

	# -----------------------------------------------------------------------
	# Shell & editor
	# -----------------------------------------------------------------------
	export FOX_USE_BASH_SHELL=1
	export FOX_ASH_IS_BASH=1
	export FOX_USE_NANO_EDITOR=1

	# -----------------------------------------------------------------------
	# Binaries
	# -----------------------------------------------------------------------
	export FOX_USE_FSCK_EROFS_BINARY=1
	export FOX_USE_BUSYBOX_BINARY=1
	export FOX_USE_GREP_BINARY=1
	export FOX_USE_SED_BINARY=1
	export FOX_USE_DATE_BINARY=1
	export FOX_USE_TAR_BINARY=1
	export FOX_USE_XZ_UTILS=1
	export FOX_USE_LZ4_BINARY=1
	export FOX_USE_ZSTD_BINARY=1
	export FOX_USE_PATCHELF_BINARY=1
	export FOX_REPLACE_TOOLBOX_GETPROP=1

	# -----------------------------------------------------------------------
	# Magisk / patching
	# -----------------------------------------------------------------------
	export FOX_USE_UPDATED_MAGISKBOOT=1

	# -----------------------------------------------------------------------
	# UI / installer behaviour
	# -----------------------------------------------------------------------
	export FOX_ALLOW_EARLY_SETTINGS_LOAD=1
	export FOX_ENABLE_APP_MANAGER=1
	export FOX_DELETE_AROMAFM=1
	export FOX_DELETE_INITD_ADDON=1

else
	if [ -z "$FOX_BUILD_DEVICE" -a -z "$BASH_SOURCE" ]; then
		echo "I: This script requires bash. Not processing the $FDEVICE $(basename $0)"
	fi
fi
