# -*- encoding: utf-8 -*-
$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "beaker-digitalocean"
  s.version     = '0.0.1'
  s.authors     = ["Andre Tiengo"]
  s.email       = ["andretiengo@gmail.com"]
  s.homepage    = "https://github.com/tiengo/beaker-digitalocean"
  s.summary     = %q{Let's test Puppet, using Digital Ocean!}
  s.description = %q{Puppetlabs accceptance testing harness, using Digital Ocean as a hypervisor}
  s.license     = 'Apache2'

  s.files         = [ "lib/beaker/hypervisor/digitalocean.rb" ]
  s.require_paths = [ "lib" ]

  s.add_runtime_dependency 'barge', '>= 0.11.0'
end
