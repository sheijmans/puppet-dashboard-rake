require 'rake_helpers'

namespace :mcollective do
  desc 'Perform MCollective actions based on the nodes in Puppet Dashboard Groups'
  task :groups => :environment do
    group = false
    perform_mco = false
    names = NodeGroup.all.map(&:name)

    if ENV['group']
      group = ENV['group']
    else
      puts 'Must specify a Puppet Dashboard Group name (group=<group>).'
      exit 1
    end

    if ENV['agent']
      agent = ENV['agent']
    else
      puts 'Must specify a MCollective agent (agent=<agent>).'
      exit 1
    end

    if ENV['action']
      action = ENV['action']
    else
      if ! action == 'find' and ! action == 'pind'
        puts 'Must specify a MCollective agent action (action=<action>).'
        exit 1
      end
    end

    if ENV['option']
      option = ENV['option']
    end

    if ! names.include? "#{group}"
      puts 'Puppet Dashboard Group does not exists!'
      exit 1
    end

    puts "Processing Puppet Dashboard group #{group} in MCollective: mco #{agent} #{action} #{option}"
    puts ""
    file = File.open('/tmp/group_nodes.txt', 'w')

    Node.find(get_group(group).nodes).each do |groupnode|
      file.puts "#{groupnode.name}\n"
      perform_mco = true
    end
    file.close

    if perform_mco
      sh %{/usr/bin/mco #{agent} #{action} #{option} --nodes #{file.path}}
    else
      puts "No nodes found for Puppet Dashboard Group #{group}."
    end

    File.delete('/tmp/group_nodes.txt')
  end
end
