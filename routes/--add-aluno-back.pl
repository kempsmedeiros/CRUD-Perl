#!/usr/bin/perl

use lib "../controllers"; 
use strict;
use CGI ':standard';
use Alunos;

my $q = CGI->new;
print $q->redirect('../index.pl');


my $id = param('id');
my $nome = param('nome');
my $matricula = param('matricula');
my $telefone = param('telefone');



my $newAluno = Alunos->new($id, $nome, $matricula, $telefone);
$newAluno->save();








