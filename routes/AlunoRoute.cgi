#!/usr/bin/perl

use strict;
use warnings;
use CGI ':standard';

use lib "../rules";

use AlunoRule;

my $function = param('function');
my $id = param('id');
my $nome = param('nome');
my $matricula = param('matricula');
my $telefone = param('telefone');

if( $function eq "create" ) {
    my $newAluno = AlunoRule->new($id, $nome, $matricula, $telefone);
    $newAluno->create();
    my $q = CGI->new;
    print $q->redirect('../index.pl');

    
} ;

if( $function eq "updateById" ) {
    my $newAluno = AlunoRule->new($id, $nome, $matricula, $telefone);
    $newAluno->updateById($id);
    my $q = CGI->new;
    print $q->redirect('../index.pl');

    
} ;



