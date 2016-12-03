#!/bin/bash
# Install rbenv globally and replace /usr/bin commands

git clone https://github.com/rbenv/rbenv.git /opt/rbenv
cd /opt/rbenv
git checkout v1.1.0

ln -s /opt/rbenv/bin/rbenv /usr/bin/rbenv

# modify global shell script init files
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> /etc/profile.d/rbenv.sh
echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh
chmod a+x /etc/profile.d/rbenv.sh

echo 'source /etc/profile.d/*rbenv*' >> /etc/bash.bashrc

# replace commands in /usr/bin. we HAVE to do this to avoid wrapping
# calls with "bash -c -l" (and there are some places we might not be
# able to do that anyway.) we assume /root as home directory when HOME
# isn't set, which is the case with /etc/my_init.d scripts.

cat >/usr/bin/ruby <<EOL
#!/bin/bash
if [ -z "\$HOME" ]
then
  HOME=/root
fi
eval "\$(rbenv init -)"
exec \$HOME/.rbenv/shims/ruby \$@
EOL

ln -s /usr/bin/ruby /usr/bin/ruby2.3

cat >/usr/bin/gem <<EOL
#!/bin/bash
if [ -z "\$HOME" ]
then
  HOME=/root
fi
eval "\$(rbenv init -)"
exec \$HOME/.rbenv/shims/gem \$@
EOL

cat >/usr/bin/bundle <<EOL
#!/bin/bash
if [ -z "\$HOME" ]
then
  HOME=/root
fi
eval "\$(rbenv init -)"
exec \$HOME/.rbenv/shims/bundle \$@
EOL

chmod a+x /usr/bin/ruby
chmod a+x /usr/bin/ruby2.3
chmod a+x /usr/bin/gem
chmod a+x /usr/bin/bundle

