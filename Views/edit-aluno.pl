#!/usr/bin/perl


use CGI ':standard';
use JSON;
use Encode qw(decode encode);

my $json = JSON->new->allow_nonref;

print "Content-type: text/html\n\n";

my $id = param('editedId');

print <<HTML; 
<!DOCTYPE html>
<html lang="en" ng-app="editPage">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap\@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.7/angular.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.7/angular-route.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.7/angular-animate.js"></script>
    <script type="text/javascript">
      angular
          .module('editPage', [])
          .controller('alunoToUpdate', [ '\$scope', '\$http', function(\$scope, \$http) {
               \$scope.text = "Hiii";
               \$scope.getAlunoById = function () {
                  \$http.get('http://localhost/cgi-bin/CRUD-Perl-refactored/routes/AlunoRoute.cgi?function=getById&editedId=' + $id)
                  .then(function(res) {
                    \$scope.AlunoEdited = res.data[0];
                    console.log(\$scope.AlunoEdited);
                });
               };
               \$scope.getAlunoById();
               \$scope.submit = function(){
                    
                    \$http.get('http://localhost/cgi-bin/CRUD-Perl-refactored/routes/AlunoRoute.cgi?function=updateById&id=' + \$scope.AlunoEdited.id + '&nome=' + \$scope.AlunoEdited.nome + '&matricula=' + \$scope.AlunoEdited.matricula + '&telefone=' + \$scope.AlunoEdited.telefone)
                    .then(function(res) {
                    \$scope.AlunoEdited = res.data[0];
                    window.location.href = "http://localhost/cgi-bin/CRUD-Perl-refactored/index.cgi";
                });
               };

          }]);


    </script>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Aluno</title>
</head>
<body>
     <div class="container" ng-controller="alunoToUpdate">
     <h1 class="mt-2">Editar aluno</h1>
     <form ng-submit="submit()">
     <input type="hidden" name="function" value="updateById"/>
     <div>
     <input type='hidden' name='id' ng-model="AlunoEdited.id">
     </div>
     <div>
     <label for='nome' class='form-label'>Nome: </label>
     <input type='text' name='nome' ng-model="AlunoEdited.nome"></div>
     <div>
     <label for='matricula' class='form-label'>Matricula: </label>
     <input type='text' name='matricula' ng-model="AlunoEdited.matricula"></div>
     <div>
     <label for='telefone' class='form-label'>Telefone: </label>
     <input type='text' name='telefone' ng-model="AlunoEdited.telefone"></div>
     <div>
     <input type="submit" class="btn btn-primary">
     </div>
     </form>
     </div>
 </body>
</html>
HTML
