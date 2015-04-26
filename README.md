# beaker-digitalocean

[Beaker's](https://github.com/puppetlabs/beaker) plugin that adds [DigitalOcean](http://www.digitalocean.com/) as a hypervisor.

## USAGE:

First off all, you need a validated DigitalOcean account with your API key generated and your ssh_key fingerprint at Digital Ocean (see nodeset example below).


## Nodeset example

You'll need to define a droplet size, image id, and region in your nodeset. When you run beaker, you'll also need to set the `DO_TOKEN` environment variable to your DigitalOcean API key, and the `DO_SSH_KEY` to the fingerprint of the SSH key you want beaker to use.

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
```

Or, if you'd prefer to define the ssh_key and access_token in your nodeset:

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
