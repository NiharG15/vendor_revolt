# Common overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/revolt/overlay/common

# Common dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/revolt/overlay/dictionaries

# SuperUser
SUPERUSER_EMBEDDED := true
SUPERUSER_PACKAGE_PREFIX := com.android.settings.cyanogenmod.superuser

ifneq ($(RV_BUILD),)
# AOKP Packages
PRODUCT_PACKAGES += \
    AOKPtips \
    AppWidgetPicker \
    LatinImeDictionaryPack \
    Microbes \
    PerformanceControl \
    ROMControl \
    Superuser \
    Su \
    Torch

# CM Packages
PRODUCT_PACKAGES += \
    audio_effects.conf \
    LockClock  \
    Trebuchet

# Paranoid Packages and Additions for Hybrid
PRODUCT_PACKAGES += \
    ParanoidPreferences

PRODUCT_PROPERTY_OVERRIDES += \
    ro.pa.family=$(OVERLAY_TARGET)

# ReVolt Packages
PRODUCT_PACKAGES += \
    GooManager \
    FontSize \
    StreetView \
    ReVoltPapers \
    Maps \
    YouTube
else
# AOKP Packages
PRODUCT_PACKAGES += \
    AOKPtips \
    AppWidgetPicker \
    LatinImeDictionaryPack \
    Microbes \
    PerformanceControl \
    ROMControl \
    Superuser \
    Su \
    Launcher2 \
    Torch

# CM Packages
PRODUCT_PACKAGES += \
    audio_effects.conf \
    DSPManager \
    libcyanogen-dsp \
    LockClock  \
    Trebuchet

# Paranoid Packages and Additions for Hybrid
PRODUCT_PACKAGES += \
    ParanoidPreferences

PRODUCT_PROPERTY_OVERRIDES += \
    ro.pa.family=$(OVERLAY_TARGET)

# ReVolt Packages
PRODUCT_PACKAGES += \
    XposedDPI \
    XposedInstaller \
    GooManager \
    FontSize \
    StreetView \
    ReVoltPapers \
    Maps \
    YouTube \
    ESFileExplorer
endif


PRODUCT_PROPERTY_OVERRIDES += \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.error.receiver.system.apps=com.google.android.feedback \
    ro.com.google.locationfeatures=1 \
    ro.setupwizard.enterprise_mode=1 \
    ro.ril.enable.amr.wideband=1 \
    windowsmgr.max_events_per_sec=240 \
    ro.kernel.android.checkjni=0 \
    persist.sys.root_access=3

PRODUCT_COPY_FILES += \
    vendor/revolt/prebuilt/common/lib/libmicrobes_jni.so:system/lib/libmicrobes_jni.so \
    vendor/revolt/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml \
    vendor/revolt/prebuilt/common/etc/resolv.conf:system/etc/resolv.conf

# init.d
PRODUCT_COPY_FILES += \
    vendor/revolt/prebuilt/common/etc/init.local.rc:root/init.aokp.rc \
    vendor/revolt/prebuilt/common/etc/init.d/00start:system/etc/init.d/00start \
    vendor/revolt/prebuilt/common/etc/init.d/01sysctl:system/etc/init.d/01sysctl \
    vendor/revolt/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf \
    vendor/revolt/prebuilt/common/bin/sysinit:system/bin/sysinit

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

PRODUCT_PACKAGES += \
    openvpn \
    e2fsck \
    mke2fs \
    tune2fs \
    libssh \
    ssh \
    sshd \
    sshd-config \
    ssh-keygen \
    sftp \
    scp

# Default ringtone
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=Scarabaeus.ogg \
    ro.config.notification_sound=Antimony.ogg \
    ro.config.alarm_alert=Scandium.ogg

PRODUCT_COPY_FILES += packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

# ParanoidAndroid Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/revolt/prebuilt/preferences/$(TARGET_PRODUCT)

# Allow device family to add overlays and use a same prop.conf 
ifneq ($(OVERLAY_TARGET),) 
    PRODUCT_PACKAGE_OVERLAYS += vendor/revolt/overlay/$(OVERLAY_TARGET)
    PA_CONF_SOURCE := $(OVERLAY_TARGET)
else
    PA_CONF_SOURCE := $(TARGET_PRODUCT)
endif

PRODUCT_COPY_FILES += \
    vendor/revolt/prebuilt/$(PA_CONF_SOURCE).conf:system/etc/paranoid/properties.conf \
    vendor/revolt/prebuilt/$(PA_CONF_SOURCE).conf:system/etc/paranoid/backup.conf 

# Inherit common build.prop overrides
-include vendor/revolt/configs/common_versions.mk

# T-Mobile theme engine
-include vendor/revolt/configs/themes_common.mk