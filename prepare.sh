#/bin/bash
# vim: ts=2 sw=2 nocindent expandtab

TOP=${ANDROID_BUILD_TOP}

PIXEL_ROM_PATCHES_DIRNAME=${TOP}/vendor/pixelrom/patches

if [ '$1' != '-f' ]; then
  PATCH_BACKUP_DIR=`mktemp -d --suffix .pixelrom`
  echo "backup patches to ${PATCH_BACKUP_DIR}"

  TMP_PIXEL_ROM_PATCHES=${PATCH_BACKUP_DIR}/pixelrom

  rm -rf ${PATCH_BACKUP_DIR}
  mkdir -p ${TMP_PIXEL_ROM_PATCHES}

  cp -a ${PIXEL_ROM_PATCHES_DIRNAME}/* ${TMP_PIXEL_ROM_PATCHES}/ || exit 1
  PIXEL_ROM_PATCHES_DIRNAME=${TMP_PIXEL_ROM_PATCHES}
fi

repo forall -c "git reset --hard && git clean -fd && git am --abort"
repo abandon pixelrom
repo start pixelrom --all

for D in ${PIXEL_ROM_PATCHES_DIRNAME}/*
do
  PD=$(basename $D)
  APPLY_DIR=${PD//_/\/}
  echo $PD $APPLY_DIR
  echo "apply patches to" ${APPLY_DIR}
  for PATCH in ${D}/*
  do
    echo "apply" ${PATCH}
    ( cd ${APPLY_DIR} && git am ${PATCH} || exit 1 )
  done
done
