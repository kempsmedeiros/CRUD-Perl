package AlunoRule;

use strict;
use warnings;

use lib "../models";

use AlunoModel;




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

sub create {
    my ($self) = @_;
    my $alunoModel = AlunoModel->new($self->{id}, $self->{nome}, $self->{matricula}, $self->{telefone});
    $alunoModel->create();
    
}


1;