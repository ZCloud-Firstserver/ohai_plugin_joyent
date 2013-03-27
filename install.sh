#!/usr/bin/bash
set -x
set -e

/opt/local/gnu/bin/install -d /opt/local/etc/ohai/plugins -m 0755
curl -skf -o /opt/local/etc/ohai/plugins/joyent.rb https://raw.github.com/ZCloud-Firstserver/ohai_plugin_joyent/master/plugins/joyent.rb 
