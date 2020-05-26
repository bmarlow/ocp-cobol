#!/bin/bash


/src/helloworld-exe >> /tmp/index.html
echo "</body>" >> /tmp/index.html
echo "COBOL Compiler info:<p>" >> /tmp/index.html
cobcrun --version >> /tmp/index.html
echo "</html>" >> /tmp/index.html
