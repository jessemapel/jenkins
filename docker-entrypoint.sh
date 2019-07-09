#!/bin/bash -e

for file in $(ls /docker-entrypoint.d/); do
    printf 'Running %s...\n' $file
    . /docker-entrypoint.d/$file
    printf 'Finished %s\n\n' $file
done

if [ -z "$1" ] || [[ "$1" == "--"* ]]; then
    su -p -c 'PATH=$JAVA_HOME/bin:$PATH /usr/local/bin/jenkins.sh' jenkins
else
    exec "$@"
fi

