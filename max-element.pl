#!/usr/bin/perl
# Enter your code here. Read input from STDIN. Print output to STDOUT

# Initialise some stuff
$justStarting = 1;
my @elements;
my @maxvals;

# The information about the input format for this challenge states:
# "It is guaranteed that each query is valid"
# therefore we can dispense with any kind of input validation for this challenge

while (<STDIN>) {
  # Lose the line terminator(s)
  chomp $_;
  
  # The first line contains the number of queries, which we don't need
  if ($justStarting) {
    $justStarting = 0;
    # skip
    next;
  }
  
  # This code uses 2 arrays/stacks
  # The first one, @elements, is used for the push/pop operations,
  # the second one, @maxvals, keeps track of the maximum value seen so far
  
  # Get the query
  my ($action, $value) = split / /, $_;
  
  # push, pop or print?
  
  # push
  # Is the value being pushed onto the @elements stack is >= the current maximum
  # value, then push it on to the @maxvals stack as well
  if ($action == 1) {
    if ($value >= $maxvals[-1]) {
      push @maxvals, $value;
    }
    push @elements, $value;
    
  # pop
  # If the value being popped off the @elements == the value at the top of the
  # @maxvals stack, then pop it as well
  } elsif ($action == 2) {
    if ($elements[-1] == $maxvals[-1]) {
      pop @maxvals;
    }
    pop @elements;
    
  # print
  # The current maximum value will be at the top of the @maxval stack
  } else {
    printf $maxvals[-1] . "\n";
  }
}


