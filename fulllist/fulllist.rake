namespace :fulllist do
  desc 'List nodes with parameters,classes and groups'
  task :nodes => :environment do
    regex = false

    if ENV['match']
      regex = ENV['match']
    end

    Node.find(:all).each do |node|
      if regex
        if node.name =~ /#{regex}/
          puts "Nodename: #{node.name}"
          print "Params  : " 
          first = true
          Parameter.find(node.parameters).each do |nodeparameter|
            if first 
              first = false
      	      print  "#{nodeparameter.key}=#{nodeparameter.value}"
            else
              print  "\,#{nodeparameter.key}=#{nodeparameter.value}"
            end
          end
 	  puts ""
          print "Groups  : "
          first = true
          NodeGroup.find(node.node_groups).each do |nodegroup|
            if first 
              first = false
              print "#{nodegroup.name}" 
            else
              print "\,#{nodegroup.name}"
            end
          end
          puts ""
          print "Classes : "
          first = true
          NodeClass.find(node.node_classes).each do |nodeclass|
            if first 
              first = false
              print "#{nodeclass.name}" 
            else
              print "\,#{nodeclass.name} " 
            end
          end
          puts ""
          puts ""
        end
      else
        puts "Nodename: #{node.name}"
        print "Params  : " 
        first = true
        Parameter.find(node.parameters).each do |nodeparameter|
          if first 
            first = false
	    print  "#{nodeparameter.key}=#{nodeparameter.value}"
          else
            print  "\,#{nodeparameter.key}=#{nodeparameter.value}"
          end
        end
 	puts ""
        print "Groups  : " 
        first = true
        NodeGroup.find(node.node_groups).each do |nodegroup|
          if first 
            first = false
            print "#{nodegroup.name}" 
          else
            print "\,#{nodegroup.name}"
          end
        end
 	puts ""
        print "Classes : " 
        first = true
        NodeClass.find(node.node_classes).each do |nodeclass|
          if first 
            first = false
            print "#{nodeclass.name}" 
          else
            print "\,#{nodeclass.name} " 
          end
        end
	puts ""
	puts ""
      end
    end
  end

  desc 'List groups with parameters,classes and nodes'
  task :groups => :environment do
    regex = false

    if ENV['match']
      regex = ENV['match']
    end

    NodeGroup.find(:all).each do |nodegroup|
      if regex
        if nodegroup.name =~ /#{regex}/
          puts "Group   : #{nodegroup.name}"
          print "Params  : "
          first = true
          Parameter.find(nodegroup.parameters).each do |groupparameter|
            if first
              first = false
              print  "#{groupparameter.key}=#{groupparameter.value}"
            else
              print  "\,#{groupparameter.key}=#{groupparameter.value}"
            end
          end
          puts ""
          print "Classes : "
          first = true
          NodeClass.find(nodegroup.node_classes).each do |groupclass|
            if first
              first = false
              print "#{groupclass.name}"
            else
              print "\,#{groupclass.name} "
            end
          end
          puts ""
          print "Nodes   : "
          first = true
          Node.find(nodegroup.nodes).each do |groupnode|
            if first
              first = false
              print "#{groupnode.name}"
            else
              print "\,#{groupnode.name} "
            end
          end
          puts ""
          puts ""
        end
      else
        puts "Group   : #{nodegroup.name}"
        print "Params  : "
        first = true
        Parameter.find(nodegroup.parameters).each do |groupparameter|
          if first
            first = false
            print  "#{groupparameter.key}=#{groupparameter.value}"
          else
            print  "\,#{groupparameter.key}=#{groupparameter.value}"
          end
        end
        puts ""
        print "Classes : "
        first = true
        NodeClass.find(nodegroup.node_classes).each do |groupclass|
          if first
            first = false
            print "#{groupclass.name}"
          else
            print "\,#{groupclass.name} "
          end
        end
        puts ""
        print "Nodes   : "
        first = true
        Node.find(nodegroup.nodes).each do |groupnode|
          if first
            first = false
            print "#{groupnode.name}"
          else
            print "\,#{groupnode.name} "
          end
        end
        puts ""
        puts ""
      end
    end
  end

end
