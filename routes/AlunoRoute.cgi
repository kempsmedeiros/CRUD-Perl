#!/usr/bin/perl

use strict;
use warnings;
use CGI ':standard';

use lib "../rules";
use AlunoRule

print "Content-type: text/html\n\n";

my $function = param('function');
my $id = param('id');
my $nome = param('nome');
my $matricula = param('matricula');
my $telefone = param('telefone');

if( $function eq "create" ) {
    my $newAluno = AlunoRule->new($id, $nome, $matricula, $telefone);

    print "<div><h1>A funcao e: criar</h1></div>\n";
    print "<div><h1>O nome do novo aluno e: $newAluno->{nome}</h1></div>";
} else {
    print "nao deu certo";
}

