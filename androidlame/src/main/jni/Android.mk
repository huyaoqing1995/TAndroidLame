LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := androidlame

LOCAL_SRC_FILES := \
    AndroidLame.c \
    ./libmp3lame/bitstream.c \
    ./libmp3lame/encoder.c \
    ./libmp3lame/fft.c \
    ./libmp3lame/gain_analysis.c \
    ./libmp3lame/id3tag.c \
    ./libmp3lame/lame.c \
    ./libmp3lame/mpglib_interface.c \
    ./libmp3lame/newmdct.c \
    ./libmp3lame/presets.c \
    ./libmp3lame/psymodel.c \
    ./libmp3lame/quantize.c \
    ./libmp3lame/quantize_pvt.c \
    ./libmp3lame/reservoir.c \
    ./libmp3lame/set_get.c \
    ./libmp3lame/tables.c \
    ./libmp3lame/takehiro.c \
    ./libmp3lame/util.c \
    ./libmp3lame/vbrquantize.c \
    ./libmp3lame/VbrTag.c \
    ./libmp3lame/version.c

# 使用 log 输出（可选）
LOCAL_LDLIBS := -llog

# 宏定义，便于兼容性开发
LOCAL_CFLAGS := -DSTDC_HEADERS -DFORCE_16KB_PAGES_COMPATIBLE

# 编译为 64 位（arm64-v8a，通常支持大页面）
LOCAL_MULTILIB := 64
LOCAL_ARM_MODE := arm
LOCAL_LDFLAGS += "-Wl,-z,max-page-size=16384"

include $(BUILD_SHARED_LIBRARY)