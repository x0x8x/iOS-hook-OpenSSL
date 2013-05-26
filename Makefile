#ARCHS = armv6
include theos/makefiles/common.mk

TWEAK_NAME = HookOpenSSL
HookOpenSSL_FILES = Tweak.xm
HookOpenSSL_LIBRARIES = crypto ssl

# https://github.com/st3fan/ios-openssl
HookOpenSSL_CFLAGS = "-I/Users/nabla/Downloads/ios-openssl-master/include/"
HookOpenSSL_LDFLAGS = "-L/Users/nabla/Downloads/ios-openssl-master/lib"

include $(THEOS_MAKE_PATH)/tweak.mk
