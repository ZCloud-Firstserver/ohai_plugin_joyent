#  Copyright (C) 2013 HiganWorks LLC                                                       
# 
#  Licensed under MIT https://github.com/higanworks/LICENSES
#  Author: sawanoboriyu@higanworks.com
#  Reference from: sm-summary command
#

provides "joyent"
require_plugin "os"
require_plugin "platform"

if platform == "smartos" then
  joyent Mash.new
  joyent[:sm_uuid] = `/usr/bin/zonename`.chomp
  joyent[:sm_id] = `/usr/sbin/zoneadm list -p | awk -F: '{ print $1 }'`.chomp
  
  # retrieve image
  sm_image = `cat /etc/product | grep "^Image:" | awk -F': ' '{ print $2 }'`.split(" ")
  joyent[:sm_image_id] = sm_image[0]
  joyent[:sm_image_ver] = sm_image[1]
  
  ## retrieve baseimage
  sm_baseimage = `cat /etc/product | grep "^Base Image:" | awk -F': ' '{ print $2 }'`.split(" ")
  joyent[:sm_baseimage_id] = sm_baseimage[0]
  joyent[:sm_baseimage_ver] = sm_baseimage[1]
  
  ## retrieve pkgsrc
  joyent[:sm_pkgsrc] = `cat /opt/local/etc/pkg_install.conf | awk -F= '{ print $2 }'`.chomp
end
