require 'barge'

module Beaker

  class Digitalocean < Beaker::Hypervisor

    SLEEPWAIT = 5

    def initialize(digitalocean_hosts, options)
      @options = options
      @logger = options[:logger]
      @hosts = digitalocean_hosts
      @vms = []
      @digitalocean_access_token = @options[:digitalocean_access_token]
      @digitalocean_ssh_keys = @options[:digitalocean_ssh_keys]
      @do ||= Barge::Client.new(access_token: @digitalocean_access_token )
    end
  
    def provision
      @hosts.each do |host|
        host[:vmhostname] = generate_host_name
        @logger.notify "Provisioning DigitalOcean #{host} droplet"
        opts = {
          :name     => host[:vmhostname],
          :image    => host[:image],
          :size     => host[:size],
          :region   => host[:region],
          :ssh_keys => [ @digitalocean_ssh_keys ],
        }
        vm = @do.droplet.create(opts)

        if vm.success?
          @logger.notify "Waiting for #{host.name} (#{host[:vmhostname]}) to respond"
          wait = 0
          loop do
            sleep(1)
            wait += 1
            if wait > 180
              fail 'Droplet taking too long to respond...'
            end
            @logger.notify "Waiting for #{host.name} (#{host[:vmhostname]}) to respond"
            @doresp = @do.droplet.show(vm.droplet.id)
            break if @doresp.droplet.status == 'active'
          end
          ip = @doresp.droplet.networks.v4.detect { |z| z.type == 'public' }
          host[:ip] = ip.ip_address
          @vms << vm
        end
      end
    end
  
    def cleanup
      @logger.notify "Cleaning DigitalOcean created instances"
      @vms.each do |vm|
          @logger.notify "Destroying host: #{vm.name}"
          @do.droplet.destroy(vm.droplet.id)
      end
    end
  end
end