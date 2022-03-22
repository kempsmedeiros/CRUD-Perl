package AlunoRule;

use strict;
use warnings;
use JSON;
use Encode qw(decode encode);
use lib "../models";
use AlunoModel;

my $json = JSON->new->allow_nonref;


sub new {
   my $class = shift;
   my $self = {
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
    my $rowsAffecteds = $alunoModel->create();
    return $rowsAffecteds;
    
}

sub getAll {
    my ($self) = @_;
    my $alunoModel = AlunoModel->new($self->{id}, $self->{nome}, $self->{matricula}, $self->{telefone});
    my $stateHandler = $alunoModel->getAll();
    my @listOfData;
    while (my @data = $stateHandler->fetchrow_array()) {
    my $id = $data[0];
    my $nome = $data[1];
    my $matricula = $data[2];
    my $telefone = $data[3];
    my $row = {
        id => $id,
        nome => $nome,
        matricula => $matricula,
        telefone => $telefone,
    };
    push @listOfData, $row;        
    };
    my $jsonList = $json->encode(\@listOfData);
    return $jsonList;
}   

sub getById {
    my ($self, $id_passed) = @_;
    my $alunoModel = AlunoModel->new($self->{id}, $self->{nome}, $self->{matricula}, $self->{telefone});
    my $stateHandler = $alunoModel->getById($id_passed);
    my @listOfData;
    while (my @data = $stateHandler->fetchrow_array()) {
    my $id = $data[0];
    my $nome = $data[1];
    my $matricula = $data[2];
    my $telefone = $data[3];
    my $row = {
        id => $id,
        nome => $nome,
        matricula => $matricula,
        telefone => $telefone,
    };
    push @listOfData, $row;   
    }
    my $jsonList = $json->encode(\@listOfData);
    return $jsonList;
} 

sub updateById {
    my ($self, $id_passed) = @_;
    my $alunoModel = AlunoModel->new($self->{id}, $self->{nome}, $self->{matricula}, $self->{telefone});
    my $rowsAffecteds = $alunoModel->updateById();
    return $rowsAffecteds;
}

sub deleteById {
    my ($self, $id_passed) = @_;
    my $alunoModel = AlunoModel->new();
    my $rowsAffecteds = $alunoModel->deleteById($id_passed);
    return $rowsAffecteds;
}


1;