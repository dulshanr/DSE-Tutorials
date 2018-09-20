#!/usr/bin/env bash

#parameter passing
for item in $@; do
case $item in
(*=*) eval $item;
esac
done

#hadoop fs -rm -r -f $outputPath
rm -r -f $outputPath

pig -x local -stop_on_failure -param outerJoinMethod=$outerJoinMethod -param inputPath1=$inputPath1 -param inputPath2=$inputPath2 -param schema1=$schema1 -param schema2=$schema2 -param joinField1=$joinField1 -param joinField2=$joinField2 -param join_method=$join_method -param delimeter=$delimeter -param outputPath=$outputPath $pigScriptPath;
