http_file(
  name = 'warp-linux',
  out = 'warp',
  executable = True,
  urls = [
    'https://github.com/dgiagio/warp/releases/download/v0.3.0/linux-x64.warp-packer',
  ],
  sha256 = 'ba5da4d224077fffea78c7872df47413234e4ee179c941c821aae0b33bd9f594',
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
    'cp -r $(location :openjdk8-linux) ./bundle/jdk',
    'cp -r $(location :buck-bottle-2019.01.10.01)/bin/buck ./bundle/bin/buck',
    'chmod +x ./bundle/buck.sh',
    '$(exe :warp-linux) -a linux-x64 -e buck.sh -i ./bundle -o $OUT',
  ]),
)
