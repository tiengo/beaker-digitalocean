# beaker-digitalocean

[Beaker's](https://github.com/puppetlabs/beaker) plugin that adds [DigitalOcean](http://www.digitalocean.com/) as a hypervisor.

## USAGE:

First off all, you need a validated DigitalOcean account with your API key generated and your ssh_key fingerprint at Digital Ocean (see nodeset example below).


## Nodeset example

```yaml
HOSTS:
  debian-7-x64:
    roles:
      - master
    platform: debian-78-x86_64
    hypervisor: digitalocean
    size: 512mb
    image: 10322059
    region: nyc3
CONFIG:
  type: git
  digitalocean_access_token: "123abc"
  digitalocean_ssh_keys: "aa:bb:cc:dd:ee:ff:gg:hh:ii:jj:kk:ll:mm:nn:oo:pp"
```