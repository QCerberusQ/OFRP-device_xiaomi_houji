#
#
# fox_houji.mk - OrangeFox Configuration for Xiaomi 14 (houji)
#
#

# -----------------------------------------------------------------------------
# Maintainer
# -----------------------------------------------------------------------------
OF_MAINTAINER := QCerberusQ

# -----------------------------------------------------------------------------
# Screen / cutout
# -----------------------------------------------------------------------------
#
OF_SCREEN_H             := 2400
OF_STATUS_H             := 120
OF_STATUS_INDENT_LEFT   := 48
OF_STATUS_INDENT_RIGHT  := 48
OF_HIDE_NOTCH           := 1
OF_CLOCK_POS            := 1
OF_ALLOW_DISABLE_NAVBAR := 0
OF_OPTIONS_LIST_NUM     := 8

# -----------------------------------------------------------------------------
# A/B + dedicated recovery partition
# -----------------------------------------------------------------------------
OF_AB_DEVICE_WITH_RECOVERY_PARTITION := 1

# -----------------------------------------------------------------------------
# Dynamic partitions / partition tooling
# -----------------------------------------------------------------------------
OF_USE_DMCTL                  := 1
OF_ENABLE_LPTOOLS             := 1
OF_ENABLE_ALL_PARTITION_TOOLS := 1

# -----------------------------------------------------------------------------
# Encryption / decryption (FBE + metadata)
# -----------------------------------------------------------------------------
OF_FBE_METADATA_MOUNT_IGNORE      := 1
OF_SKIP_DECRYPTED_ADOPTED_STORAGE := 1

ifeq ($(FIXED_DECRYPT),false)
	# Set to 1 to skip the FBE decryption routines (prevents hanging at the Fox logo or Redmi/Mi logo)
	OF_SKIP_FBE_DECRYPTION := 1
endif

# -----------------------------------------------------------------------------
# Data format
# -----------------------------------------------------------------------------
OF_FORCE_CASEFOLDING              := 1
OF_UNBIND_SDCARD_F2FS             := 1
OF_WIPE_METADATA_AFTER_DATAFORMAT := 1
OF_VAB_ORS_WIPE_DATA_IS_FORMAT    := 1

# -----------------------------------------------------------------------------
# Backup
# -----------------------------------------------------------------------------
OF_QUICK_BACKUP_LIST := /boot;/data;/metadata;/vendor_boot;/dtbo;
OF_SKIP_MULTIUSER_FOLDERS_BACKUP := 1

# -----------------------------------------------------------------------------
# Ramdisk compression - pairs with BOARD_RAMDISK_USE_LZ4 := true
# -----------------------------------------------------------------------------
OF_USE_LZ4_COMPRESSION := 1

# -----------------------------------------------------------------------------
# Misc / device quirks
# -----------------------------------------------------------------------------
OF_NO_TREBLE_COMPATIBILITY_CHECK  := 1
OF_NO_ADDITIONAL_MIUI_PROPS_CHECK := 1
OF_NO_SPLASH_CHANGE               := 1
OF_USE_GREEN_LED                  := 0
OF_UNMOUNT_SDCARDS_BEFORE_REBOOT  := 1
OF_ENABLE_FRP_ADDON               := 1

# -----------------------------------------------------------------------------
# Logging
# -----------------------------------------------------------------------------
OF_LOOP_DEVICE_ERRORS_TO_LOG := 1
OF_DONT_KEEP_LOG_HISTORY     := 0

