#
# This policy configuration will be used by all products that
# inherit from Omni
#

BOARD_SEPOLICY_DIRS += \
    vendor/dud/sepolicy

BOARD_SEPOLICY_UNION += \
    file_contexts \
    file.te \
    genfs_contexts \
    installd.te \
    seapp_contexts \
    service_contexts \
    sysinit.te \
    system_app.te \
    system_server.te \
    vold.te
