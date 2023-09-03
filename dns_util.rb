#!/usr/bin/env ruby

require 'resolv'

def dns_lookup(domain)
  Resolv::DNS.open do |dns|
    dns.each_resource(domain, Resolv::DNS::Resource::IN::A) do |resource|
      puts "#{domain}: #{resource.address}"
    end
  end
end

if ARGV.length != 1
  puts "Usage: ruby dns_util.rb <domain>"
  exit
end

domain = ARGV[0]
dns_lookup(domain)
