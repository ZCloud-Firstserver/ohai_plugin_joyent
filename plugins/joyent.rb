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

  # get uuid
  zonename  = Mixlib::ShellOut.new("/usr/bin/zonename")
  zonename.run_command
  joyent[:sm_uuid] = zonename.stdout.chomp

  # get zone id unless globalzone
  sm_id = Mixlib::ShellOut.new("/usr/sbin/zoneadm list -p | awk -F: '{ print $1 }'")
  sm_id.run_command
  joyent[:sm_id] = sm_id.stdout.chomp unless joyent[:sm_uuid] == "global"
  
  # retrieve image name and pkgsrc
  if ::File.exists?("/etc/product") then
    ::File.open("/etc/product") do |file|
      while line = file.gets
        case line
        when /^Image/
          sm_image = line.split(" ") 
          joyent[:sm_image_id] = sm_image[1]
          joyent[:sm_image_ver] = sm_image[2]
        when /^Base Image/
          sm_baseimage = line.split(" ")
          joyent[:sm_baseimage_id] = sm_baseimage[2]
          joyent[:sm_baseimage_ver] = sm_baseimage[3]
        end
      end
    end

    ## retrieve pkgsrc
    joyent[:sm_pkgsrc] = `cat /opt/local/etc/pkg_install.conf | awk -F= '{ print $2 }'`.chomp
  end
end
