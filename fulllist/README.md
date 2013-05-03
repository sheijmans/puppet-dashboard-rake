# Puppet Dashboard rake fulllist

Puppet Dashboard Rake file to display all Puppet Dashboard information of nodes/groups.

To use this rake file you need:

  * MCollective 2.2.1 at least
  * Puppet Dashboard 1.x
  
# TODO

  * ???

## Rake File Installation

Place the rake file in [Puppet-Dashboard]/lib/tasks directory.

## Usage

The following options are available;
  * fulllist:nodes		List nodes with parameters,classes and groups
  * fulllist:groups		List groups with parameters,classes and nodes

### fulllist:node

List nodes with parameters,classes and groups

    $ rake -f /usr/share/puppet-dashboard/Rakefile RAILS_ENV=production fulllist:nodes

or with the match-option

    $ rake -f /usr/share/puppet-dashboard/Rakefile RAILS_ENV=production fulllist:nodes match=abcd

Will display the following information from Puppet Dashboard

    Nodename: node_name
	Params  : param1=a,param2=b,param3=c
	Groups  : group1,group2
	Classes : class1,class2,class3

	
### fulllist:groups

List groups with parameters,classes and nodes

    $ rake -f /usr/share/puppet-dashboard/Rakefile RAILS_ENV=production fulllist:groups

or with the match-option

    $ rake -f /usr/share/puppet-dashboard/Rakefile RAILS_ENV=production fulllist:groups match=abcd

Will display the following information from Puppet Dashboard

    Group   : group_name
    Params  : param1=a,param2=b,param3=c
    Classes : class1,class2,class3
    Nodes   : node1,node2,node3
