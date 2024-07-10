#!/bin/sh
set -e

# If any arguments passed, execute those, otherwise execute supervisord
if [ $# -gt 0 ]; then
    exec "$@"
else
    exec supervisord -c /etc/supervisor/conf.d/supervisord.conf
fi