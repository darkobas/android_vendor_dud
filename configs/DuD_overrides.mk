# Version information used on all builds
PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_VERSION_TAGS=release-keys \
    USER=android-build \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    BUILD_UTC_DATE=$(shell date +"%s")

# Required CM packages
PRODUCT_PACKAGES += \
    Development \
    LatinIME \
    BluetoothExt

# Optional CM packages
PRODUCT_PACKAGES += \
    Basic \
    libemoji

# Custom CM packages
#PRODUCT_PACKAGES += \
#    AudioFX

# Extra tools in CM
PRODUCT_PACKAGES += \
    libsepol \
    e2fsck \
    mke2fs \
    tune2fs \
    bash \
    nano \
    htop \
    powertop \
    lsof \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat \
    mkfs.f2fs \
    fsck.f2fs \
    fibmap.f2fs \
    ntfsfix \
    ntfs-3g \
    gdbserver \
    micro_bench \
    oprofiled \
    sqlite3 \
    strace

# Openssh
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh

