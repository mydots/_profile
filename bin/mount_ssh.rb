#!/usr/bin/env ruby
#
require 'optparse'
require 'pry'
##
## Usage:

operating_system = `uname -a`.scan(/Darwin|Linux/)

puts "Sorry, unrecognized operating system" if operating_system.empty?

mount_point = operating_system.first == "Darwin" ? "/Volumes" : "/mnt"

folder = nil
path = nil
ARGV.each do |arg|
  next unless arg.include? ":"
  elements = arg.split(":")
  folder = elements.pop
  elements = elements.join(":")
  binding.pry

end

sshfs_command = `which sshfs`.strip

command = ""

command += "mkdir -p #{mount_point}/#{folder} && " unless folder.nil?
command += " #{sshfs_command} -o transform_symlinks "
command += ARGV.join(" ")
command += " #{mount_point}/#{folder}" unless folder.nil?
command += " && cd #{mount_point}/#{folder}/" unless folder.nil?
puts "#{command}"
