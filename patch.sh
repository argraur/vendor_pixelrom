echo "Patching frameworks/base!"
cd frameworks/
patch -p1 -i ../vendor/pixelrom/patch/frameworks_base.patch
cd ..
echo "done xd"