prebuilt_jar(
  name = 'rt8',
    binary_jar = 'rt8.jar',
)

android_resource(
  name = 'res',
  package = 'com.github.giorgiozamparelli.buckretrolambda',
  res = 'app/src/main/res',
  assets = 'app/src/main/assets',
  deps = [
  ]
)

android_library(

  name = 'android_library',
  srcs = glob(['app/src/main/java/**/*.java']),
  deps = [
    ':rt8',
    ':res',
  ],
  visibility = [
    'PUBLIC',
  ],

)

genrule(
  name = 'retrolambda',
  srcs = ['retrolambda.jar', 'apply-retrolambda.sh', ':android_library'],
  cmd = 'sh apply-retrolambda.sh',
  out = 'retrolambda__output/output.jar',
  deps = [
    ':android_library',
  ]
)

keystore(
  name = 'debug_keystore',
  store = 'keystore/debug.keystore',
  properties = 'keystore/debug.keystore.properties',
)

android_binary(
  name = 'android_binary',
  manifest = 'app/src/main/AndroidManifest.xml',
  target = 'Google Inc.:Google APIs:21',
  keystore = ':debug_keystore',
  no_dx = [':rt8'],
  deps = [
    ':retrolambda',
    ':android_library',
  ],
)