# Puppet r10k

 A code management tool known that helps in managing environment configurations related to different kind of environments that we can configure in Puppet such as development, testing, and production. This helps in storing environment-related configuration in the source code repository. Using the source control repo branches, r10k creates environments on Puppet master machine installs and updates environment using modules present in the repo.

## Installation

```
/opt/puppetlabs/puppet/bin/gem install r10k
```

### Configuration

Create file **/etc/puppetlabs/r10k/r10k.yaml**

```
:cachedir: '/var/puppet/r10k/cache'
:sources:
  :code:
   remote: 'https://git.fligno.com/reth.bagares/puppet-test.git'
   basedir: '/etc/puppetlabs/code/environments'

```

*remote* - control repo

*basedir* - control repo destination


### Deploy Environment

```
/opt/puppetlabs/puppet/bin/r10k deploy environment production --verbose --puppetfile
```

Where *production* is a branch for control repo to be deployed as an environment

### Install puppetfile

Change directory to *{basedir}/{branch}*, e.g */etc/puppetlabs/code/environments/production*

```
/opt/puppetlabs/puppet/bin/r10k puppetfile install
```

### Pull update from Puppet Server

Access Puppet Agent

```
/opt/puppetlabs/bin/puppet agent --test
```

## Note

**Puppetfile**

Sources of modules

*puppetforge*

```
mod 'puppetlabs/apache', :latest
```

*local*

```
mod 'nginx', local: true
mod 'php-fpm', local: true
mod 'mysql', local: true
```

*git*

```
git:    'https://github.com/puppetlabs/puppetlabs-apache',
branch: 'docs_experiment'

```

**environment.conf**

Add custom modules directory

```
modulepath = site-modules:modules:custom-modules:$basemodulepath

```

**manifests/site.pp**

Main manifest file to be executed during installation of puppetfile

**site-modules/profile**

Wrapper classes that use multiple component modules to configure a layered technology stack

**site-modules/role**

 Wrapper classes that use multiple profiles to build a complete system configuration