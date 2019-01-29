http_file(
  name = 'warp-linux',
  out = 'warp',
  executable = True,
  urls = [
    'https://github.com/dgiagio/warp/releases/download/v0.3.0/linux-x64.warp-packer',
  ],
  sha256 = 'ba5da4d224077fffea78c7872df47413234e4ee179c941c821aae0b33bd9f594',
)

http_file(
  name = 'warp-osx',
  out = 'warp',
  executable = True,
  urls = [
    'https://github.com/dgiagio/warp/releases/download/v0.3.0/macos-x64.warp-packer',
  ],
  sha256 = '01d00038dbbe4e5a6e2ca19c1235f051617ac0e6e582d2407a06cec33125044b',
)

http_file(
  name = 'warp-windows',
  out = 'warp.exe',
  executable = True,
  urls = [
    'https://github.com/dgiagio/warp/releases/download/v0.3.0/windows-x64.warp-packer.exe',
  ],
  sha256 = '4f9a0f223f0e9f689fc718fdf86a147a357921ffa69c236deadc3274091070c1',
)

http_archive(
  name = 'openjdk8-linux',
  out = 'out',
  urls = [
    'https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u202-b08/OpenJDK8U-jdk_x64_linux_hotspot_8u202b08.tar.gz',
  ],
  sha256 = 'f5a1c9836beb3ca933ec3b1d39568ecbb68bd7e7ca6a9989a21ff16a74d910ab',
  strip_prefix = 'jdk8u202-b08',
)

http_archive(
  name = 'openjre8-linux',
  out = 'out',
  urls = [
    'https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u202-b08/OpenJDK8U-jre_x64_linux_hotspot_8u202b08.tar.gz',
  ],
  sha256 = 'b3f9934c6fc83fb2e76a4ded31367e5312013e27d36eac82a6fe1423aae394ce',
  strip_prefix = 'jdk8u202-b08-jre',
)

http_archive(
  name = 'openjdk8-osx',
  out = 'out',
  urls = [
    'https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u202-b08/OpenJDK8U-jdk_x64_mac_hotspot_8u202b08.tar.gz',
  ],
  sha256 = '059f7c18faa6722aa636bbd79bcdff3aee6a6da5b34940b072ea6e3af85bbe1d',
  strip_prefix = 'jdk8u202-b08',
)

http_archive(
  name = 'openjre8-osx',
  out = 'out',
  urls = [
    'https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u202-b08/OpenJDK8U-jre_x64_mac_hotspot_8u202b08.tar.gz',
  ],
  sha256 = 'd7be3dfd5cd10323e1272e06d26f0709fbbc4a6f25a3992c2f2eef7022517fba',
  strip_prefix = 'jdk8u202-b08-jre',
)

http_archive(
  name = 'openjre8-windows',
  out = 'out',
  urls = [
    'https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u202-b08/OpenJDK8U-jre_x64_windows_hotspot_8u202b08.zip',
  ],
  sha256 = '6689bc1d726969e95976c7d8f6ae1730abcb31d2d0c3e2d1489a0bacd7867ab7',
  strip_prefix = 'jdk8u202-b08-jre',
)


http_archive(
  name = 'buck-bottle-2019.01.10.01',
  out = 'out',
  type = 'tar.gz',
  urls = [
    'https://github.com/facebook/buck/releases/download/v2019.01.10.01/buck-2019.01.10.01.yosemite.bottle.tar.gz',
  ],
  sha256 = '8663afcd14676b6cb45995a2fe892664dbc90a7aff2ac9eaa51db983795f2015',
  strip_prefix = 'buck/2019.01.10.01',
)

genrule(
  name = 'buck-2019.01.10.01-linux',
  out = 'buck-2019.01.10.01-linux',
  executable = True,
  srcs = [
    'buck.sh',
  ],
  cmd = ' && '.join([
    'cd $TMP',
    'mkdir -p bundle',
    'mkdir -p bundle/bin',
    'cp $SRCDIR/buck.sh ./bundle/buck.sh',
    'cp -r $(location :openjre8-linux) ./bundle/jre',
    'cp -r $(location :buck-bottle-2019.01.10.01)/bin/buck ./bundle/bin/buck',
    'chmod +x ./bundle/buck.sh',
    '$(exe :warp-linux) -a linux-x64 -e buck.sh -i ./bundle -o $OUT',
  ]),
)

genrule(
  name = 'buck-2019.01.10.01-osx',
  out = 'buck-2019.01.10.01-osx',
  executable = True,
  srcs = [
    'buck.sh',
  ],
  cmd = ' && '.join([
    'cd $TMP',
    'mkdir -p bundle',
    'mkdir -p bundle/bin',
    'cp $SRCDIR/buck.sh ./bundle/buck.sh',
    'cp -r $(location :openjre8-osx)/Contents/Home ./bundle/jre',
    'cp -r $(location :buck-bottle-2019.01.10.01)/bin/buck ./bundle/bin/buck',
    'chmod +x ./bundle/buck.sh',
    '$(exe :warp-osx) -a macos-x64 -e buck.sh -i ./bundle -o $OUT',
  ]),
)

genrule(
  name = 'buck-2019.01.10.01-windows',
  out = 'buck-2019.01.10.01-windows.exe',
  executable = True,
  srcs = [
    'buck.bat',
  ],
  cmd = ' && '.join([
    'cd $TMP',
    'mkdir -p bundle',
    'mkdir -p bundle/bin',
    'cp $SRCDIR/buck.bat ./bundle/buck.bat',
    'cp -r $(location :openjre8-windows) ./bundle/jre',
    'cp -r $(location :buck-bottle-2019.01.10.01)/bin/buck ./bundle/bin/buck',
    '$(exe :warp-windows) -a windows-x64 -e buck.bat -i ./bundle -o $OUT',
  ]),
  cmd_exe = ' & '.join([
    'cd $TMP',
    'mkdir "bundle/bin"',
    'cp $SRCDIR/buck.bat ./bundle/buck.bat',
    'cp -r $(location :openjre8-windows) ./bundle/jre',
    'cp -r $(location :buck-bottle-2019.01.10.01)/bin/buck ./bundle/bin/buck',
    '$(exe :warp-windows) -a windows-x64 -e buck.bat -i ./bundle -o $OUT',
  ]),
)
