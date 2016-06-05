#!/usr/bin/env ruby

class ProgramInstaller
  attr_reader :list

  def initialize
    @list = []
  end

  def add_program(program_name)
    @list << program_name
  end

  def run
    command = "gem install #{@list.join(' ')}"
    puts command
    system(command, out: $stdout, err: $stderr)
  end
end

program_installer = ProgramInstaller.new

%i(
  bundler
  pry
  pry-stack_explorer
  pry-doc
  super_hooks
  rubocop
  awesome_print
).each { |p| program_installer.add_program(p) }

program_installer.run

