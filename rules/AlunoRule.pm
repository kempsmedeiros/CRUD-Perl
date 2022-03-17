package AlunoRule;

use strict;
use warnings;



sub new {
   my $class = shift;
   my $self = {
        #member variables
        id => shift,
        nome => shift,
        matricula => shift,
        telefone => shift,

    };
    bless $self, $class;
    return $self;
}


1;