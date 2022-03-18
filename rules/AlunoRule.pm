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

sub getAll {
    my ($self) = @_;
    my $alunoModel = AlunoModel->new($self->{id}, $self->{nome}, $self->{matricula}, $self->{telefone});
    my $stateHandler = $alunoModel->getAll();
    return $stateHandler;
}   

sub getById {
    my ($self, $id_passed) = @_;
    my $alunoModel = AlunoModel->new($self->{id}, $self->{nome}, $self->{matricula}, $self->{telefone});
    my $stateHandler = $alunoModel->getById($id_passed);
    return $stateHandler;

} 

sub updateById {
    my ($self, $id_passed) = @_;
    my $alunoModel = AlunoModel->new($self->{id}, $self->{nome}, $self->{matricula}, $self->{telefone});
    $alunoModel->updateById();
}


1;