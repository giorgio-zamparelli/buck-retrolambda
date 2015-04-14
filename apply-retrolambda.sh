echo "applying retrolambda"

SRCS_DIRECTORY=`pwd`

echo "1) unzip android library jar"
unzip -x buck-out/gen/lib__android_library__output/android_library.jar -d buck-out/gen/lib__android_library__output/android_library


echo "2) execute retrolambda"
#java -Dretrolambda.inputDir=buck-out/gen/lib__android_library__output/android_library/com/github/giorgiozamparelli/buckretrolambda/ -Dretrolambda.classpath=buck-out/gen/lib__android_library__output/android_library/com/github/giorgiozamparelli/buckretrolambda/ -javaagent:retrolambda.jar -jar retrolambda.jar
java -Dretrolambda.inputDir=buck-out/gen/lib__android_library__output/android_library/* -Dretrolambda.classpath=buck-out/gen/lib__android_library__output/android_library/* -javaagent:retrolambda.jar -jar retrolambda.jar


echo "3) recreate android library jar"
cd buck-out/gen/lib__android_library__output/android_library
zip -r ../android_library.jar .

echo "4) copy to output-jar"
cd $SRCS_DIRECTORY
mkdir -p ../retrolambda__output
cp buck-out/gen/lib__android_library__output/android_library.jar ../retrolambda__output/output.jar