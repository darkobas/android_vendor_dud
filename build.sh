#!/bin/bash
#
# Created by Michael S Corigliano for Team AOSPAL (michael.s.corigliano@gmail.com)
# Parts of the original AOSPA build script have also been implemented in this script,
# it can be found here: https://www.github.com/AOSPA/android_vendor_pa/build.sh
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
convertsecs() {
 ((h=${1}/3600))
 ((m=(${1}%3600)/60))
 ((s=${1}%60))
 printf "%02d:%02d:%02d\n" $h $m $s
}

   DUD_MAJOR=$(cat vendor/dud/vendor.mk | grep 'DUD_VERSION_MAJOR := *' | sed  's/DUD_VERSION_MAJOR := //g')
   DUD_MINOR=$(cat vendor/dud/vendor.mk | grep 'DUD_VERSION_MINOR := *' | sed  's/DUD_VERSION_MINOR := //g')
   DUD_MAINTENANCE=$(cat vendor/dud/vendor.mk | grep 'DUD_VERSION_MAINTENANCE := *' | sed  's/DUD_VERSION_MAINTENANCE := //g')
   DUD_TAG=$(cat vendor/dud/vendor.mk | grep 'DUD_TYPE := *' | sed  's/DUD_TYPE := //g')
# Get build version
MAJOR=$(cat vendor/dud/vendor.mk | grep 'PA_VERSION_MAJOR := *' | sed  's/PA_VERSION_MAJOR := //g')
MINOR=$(cat vendor/dud/vendor.mk | grep 'PA_VERSION_MINOR := *' | sed  's/PA_VERSION_MINOR := //g')
MAINTENANCE=$(cat vendor/dud/vendor.mk | grep 'PA_VERSION_MAINTENANCE := *' | sed  's/PA_VERSION_MAINTENANCE := //g')
TAG=$(cat vendor/dud/vendor.mk | grep 'PA_VERSION_TAG := *' | sed  's/PA_VERSION_TAG := //g')

if [ -n "$TAG" ]; then
        VERSION=$MAJOR.$MINOR$MAINTENANCE-$TAG
else
        VERSION=$MAJOR.$MINOR$MAINTENANCE
fi

DEVICE="$1"
if [[ -z "$DEVICE" ]]; then exit 0
fi
 
#Generate Changelog
export CHANGELOG=true

#Use Prebuilt Chromium
export USE_PREBUILT_CHROMIUM=1

# start
   echo -e "Building Darkobas uber DROID for $DEVICE";
   echo -e "$DUD_TAG $DUD_MAJOR.$DUD_MINOR for $DEVICE";
   echo -e "";
   echo -e ""
 
# make 'build-logs' directory if it doesn't already exist
   echo -e "Making a 'build-logs' directory if you haven't already...";
   mkdir -p build-logs
 
# invoke the environment setup script to start the building process
   echo -e "Setting up build environment..."
   . build/envsetup.sh
   clear

echo "create new changelog ?
	1) yes 
	2) no"
read n
case $n in
1)
echo -e "generating changelog....."
./vendor/dud/utils/changelog.sh
echo -e "$PRODUCT_OUT/CHANGELOG.txt created"
;;
2)
echo "skippin changelog"
;;
*) invalid option;;
esac

echo "generate OpenDelta ?
	1) yes
	2) no
	3) dev"
read n
case $n in
1)
export OPENDELTA=1
;;
2)
echo "skip OpenDelta"
export OPENDELTA=2
;;
3)
export OPENDELTA=3
;;
*) invalid option;;
esac

lunch dud_$DEVICE-userdebug
   echo -e "Starting build...";
rm $OUT/system/build.prop
rm $OUT/*.zip
rm $OUT/*.md5sum
START=$(date +%s)

mka bacon 2>&1 | tee build-logs/dud_$DEVICE-$timestamp.txt

if [ "$OPENDELTA" = 1 ]; then
opendelta.sh $DEVICE
fi
if [ "$OPENDELTA" = 3 ];then
opendeltadev.sh $DEVICE
fi

END=$(date +%s)
DIFF=$(( $END - $START ))
# we're done
   echo -e "Finished building Darkobas uber Droid RoM in $(convertsecs $DIFF)";
   echo -e "If for some reason your build failed,";
   echo -e "please check the 'build-logs' directory to figure out why.";
   echo -e "";
   echo -e ""
