#!/bin/bash

#ANDROID_SDK="10 13 14 18 19 21"
ANDROID_SDK="21"
for opt
do
  case $opt in
    ANDROID_SDK=*)
    ANDROID_SDK=${opt#ANDROID_SDK=}
    ;;
  esac
done

for i in $ANDROID_SDK
do
  echo "Compiling for API LEVEL($i)..............."
  ndk-build NDK_PROJECT_PATH=./out/$i \
            APP_BUILD_SCRIPT=./Android.mk \
            APP_PLATFORM=android-$i \
            ANDROID_SDK=$i \
            APP_ABI=armeabi-v7a \
            APP_STL=gnustl_static \
            V=1
done
