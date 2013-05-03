# Puppet Dashboard rake fulllist

Puppet Dashboard Rake file to use Puppet Dashboard Group with MCollective.
The rake file queries the Puppet Dashboard Group and will use all nodes in this group, to run the MCollective command.

To use this rake file you need:

  * MCollective 2.2.1 at least
  * Puppet Dashboard 1.x
  
# TODO

  * ???

## Rake File Installation

Place the rake file in [Puppet-Dashboard]/lib/tasks directory.

## Usage

The following options are available;
  * mcollective:groups		Perform MCollective actions based on the nodes in Puppet Dashboard Group

### mcollective:groups

Perform MCollective actions based on the nodes in Puppet Dashboard Group

    $ rake -f /usr/share/puppet-dashboard/Rakefile RAILS_ENV=production mcollective:groups group=<group_name> agent=<mco agent> action=<mco agent action> [option=<mco agent action option>]

Example

    $ rake -f /usr/share/puppet-dashboard/Rakefile RAILS_ENV=production mcollective:groups group=test agent=puppet action=runonce option=--noop
	Processing Puppet Dashboard group IMT in MCollective: mco puppet runonce --noop
	
	/usr/bin/mco puppet runonce --noop --nodes /tmp/group_nodes.txt
	
	* [ ============================================================> ] 4 / 4
	
	
		
	
	Finished processing 4 / 4 hosts in 2044.99 ms
	$
