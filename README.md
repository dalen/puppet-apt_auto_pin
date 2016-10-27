# apt_auto_pin

#### Table of Contents

1. [Description](#description)
1. [Usage](#usage)
1. [See also](#see-also)

## Description

Create apt pin files for all packages that have a version specified so `apt-get upgrade` won't
install a different version than what is specified in puppet.

## Usage

Together with the puppetlabs-apt module you can use a manifest like this:

```puppet
# Include the apt module somewhere in your code
include apt

# Add the auto pin resource and make it notify the apt update
apt_auto_pin { 'packages':  notify => Exec['apt_update'] }

# Install packages
package { 'foo': ensure => '0.1.2' }
package { 'bar': ensure => '1.2.3' }

# Ensure that packages are installed after apt-get update
Package<||> { require => Exec['apt_update'] }
```

`auto_apt_pin` doesn't require the puppetlabs-apt module though as it puts plain `File` resources
into `/etc/apt/conf.d`

## See also

* [hashbrowncipher-package_purging](https://github.com/hashbrowncipher/puppet-package_purging)
  which implements a similar thing using `dpkg hold` instead of apt pinning.
