DEBUG=0
FINALPACKAGE=1
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SlideToShowNotification

SlideToShowNotification_FILES = Tweak.xm
SlideToShowNotification_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
