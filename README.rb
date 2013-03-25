Ohai Plugin for Joyent
==============

Add custom attributes for Joyent SmartMachine


Sample
----

<pre><code>
 "joyent"=>
  {"sm_uuid"=>"xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
   "sm_id"=>"5",
   "sm_image_id"=>"chefserver",
   "sm_image_ver"=>"1.0.18",
   "sm_baseimage_id"=>"base64",
   "sm_baseimage_ver"=>"1.8.4",
   "sm_pkgsrc"=>"http://pkgsrc.joyent.com/sdc6/2012Q2/x86_64/All"}}
</code></pre>

Output Test
----

    ruby ./test_print.rb


Usage
---

Configuring chef-client to load custom ohai-plugins:

1. edit /etc/chef/client.rb or solo.rb
2. add the following line to the end of the file:

   Ohai::Config[:plugin_path] << '/opt/local/etc/ohai/plugins' #you can choose any path you want

3. add your custom plugins there (i.e. /opt/local/etc/ohai/plugins)
4. execute the client:
   chef-client  or chef-solo

Contributing
------------

e.g.

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: sawanoboryu@higanworks.com (HiganWorks LLC)

Licensed under MIT https://github.com/higanworks/LICENSES

