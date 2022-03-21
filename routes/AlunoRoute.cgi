#!/usr/bin/perl

use strict;
use warnings;
use Encode qw(decode encode);
use CGI::Carp qw(fatalsToBrowser warningsToBrowser);
use CGI ':standard';
use lib "../rules";
use JSON;
use AlunoRule;

my $cgi = CGI->new();
my $json = JSON->new->allow_nonref;


my $function = param('function');
my $id = param('id');
my $nome = param('nome');
my $matricula = param('matricula');
my $telefone = param('telefone');
my $deletedId = param('deleteId');

sub createAlunoWithData {
    my $newAluno = AlunoRule->new($id, $nome, $matricula, $telefone);
    return $newAluno
}


my $returnSuccess = {
    statuscode => 200,
    message => "OK - Usuario criado com sucesso"
};

my $returnFailed = {
    statuscode => 400,
    message => "Bad Request"
};

my $returnUpdateSuccess = {
    statuscode => 200,
    message => "OK - Usuario atualizado com sucesso"
};

my $returnDeleteSuccess = {
    statuscode => 200,
    message => "OK - Usuario deletado com sucesso"
};


sub convertToJson {
    my ($return) = @_;
    my $returnJsonText = encode_json $return;
    my $jsonFinal = $json->encode($returnJsonText);
    return $jsonFinal;
}

my $returnSuccessJson = convertToJson($returnSuccess);
my $returnFailedJson = convertToJson($returnFailed);
my $returnUpdateSucessJson = convertToJson($returnUpdateSuccess);
my $returnDeleteSucessJson = convertToJson($returnDeleteSuccess);

sub printHeader {
    my ($rowsAffecteds, $message) = @_;
    if ($rowsAffecteds > 0) {
    print $cgi->header(
        -type   => 'application/json',
        -status => 200,
    );
    print $message;
    
    } else {
        print $cgi->header(
        -type   => 'application/json',
        -status => 400,
    );
    print $returnFailedJson;
    }
}


if( $function eq "create" ) {
    my $newAluno = createAlunoWithData();
    my $rowsAffecteds = $newAluno->create();
    printHeader($rowsAffecteds, $returnSuccessJson);
       
} ;

if( $function eq "updateById" ) {
    my $newAluno = createAlunoWithData();
    my $rowsAffecteds = $newAluno->updateById($id);
    printHeader($rowsAffecteds, $returnUpdateSucessJson);
    
} ;

if ( $function eq "deleteById") {
    my $newAluno = AlunoRule->new();
    my $rowsAffecteds = $newAluno->deleteById($deletedId);
    printHeader($rowsAffecteds, $returnDeleteSucessJson);
    
}


