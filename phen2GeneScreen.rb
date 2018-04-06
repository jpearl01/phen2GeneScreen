#!/usr/bin/env ruby

require 'bio'

# parse in newick/new hampshire format
input = Bio::FlatFile.open(Bio::Newick, "/home/jearl/data/shared/homes/jearl/mcat/mcat_severe/gene_trees/znuC.fasta.aln.tree")
#tree = input.next_entry.tree

while newick = input.next_entry
  newick.options[:bootstrap_style] = :disabled
  tree = newick.tree
  #tree.reparse
  tree.each_node do |node|
  	next if tree.descendents(node).empty?
  	tree.descendents(node).each do |curr_node|
	  	next unless tree.descendents(curr_node).empty?
	    printf "id: %s\n", curr_node.name || ''
	  end
  end
end