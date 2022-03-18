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

my $returnSucessJsonText = encode_json $returnSuccess;
my $returnSucessJson = $json->encode( $returnSucessJsonText );

my $returnFailedJsonText = encode_json $returnFailed;
my $returnFailedJson = $json->encode( $returnFailedJsonText );

my $returnUpdateSucessJsonText = encode_json $returnUpdateSuccess;
my $returnUpdateSucessJson = $json->encode( $returnUpdateSucessJsonText );

my $returnDeleteSucessJsonText = encode_json $returnDeleteSuccess;
my $returnDeleteSucessJson = $json->encode( $returnDeleteSucessJsonText );

if( $function eq "create" ) {
    my $newAluno = AlunoRule->new($id, $nome, $matricula, $telefone);
    my $rowsAffecteds = $newAluno->create();
    if ($rowsAffecteds > 0) {
    print $cgi->header(
        -type   => 'application/json',
        -status => 200,
    );
    print $returnSucessJson;
    
    } else {
        print $cgi->header(
        -type   => 'application/json',
        -status => 400,
    );
    print $returnFailedJson;
    }
       
} ;

if( $function eq "updateById" ) {
    my $newAluno = AlunoRule->new($id, $nome, $matricula, $telefone);
    my $rowsAffecteds = $newAluno->updateById($id);
    if ($rowsAffecteds > 0) {
    print $cgi->header(
        -type   => 'application/json',
        -status => 200,
    );
    print $returnUpdateSucessJson;
    
    } else {
        print $cgi->header(
        -type   => 'application/json',
        -status => 404,
    );
    print $returnFailedJson;
    }
    
} ;

if ( $function eq "deleteById") {
    my $newAluno = AlunoRule->new();
    my $rowsAffecteds = $newAluno->deleteById($deletedId);
    if ($rowsAffecteds > 0) {
    print $cgi->header(
        -type   => 'application/json',
        -status => 200,
    );
    print $returnDeleteSucessJson;
    
    } else {
        print $cgi->header(
        -type   => 'application/json',
        -status => 404,
    );
    print $returnFailedJson;
    }
    
}



