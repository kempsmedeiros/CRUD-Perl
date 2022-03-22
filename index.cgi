#!/usr/bin/perl


use CGI ':standard';
use Encode qw(decode encode);


my $cgi = CGI->new;
print $cgi->header();


print <<HTML;
<!doctype html>
<html ng-app="allAlunos">
  <head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap\@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.7/angular.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.7/angular-route.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.7/angular-animate.js"></script>
    <script type="text/javascript">
      angular
      .module('allAlunos', [])
      .controller('listOfAlunos', ['\$scope', '\$http', function(\$scope, \$http) {
        \$scope.title = "Lista de Alunos";
        \$scope.carregar = function() {
          \$http.get('http://localhost/cgi-bin/CRUD-Perl-refactored/routes/AlunoRoute.cgi?function=getAll')
          .then(function(res) {
            \$scope.alunos = res.data;
          });
        };
        \$scope.carregar();
        \$scope.deletar = function(id) {
    
          \$http({
          method: 'GET',
          url: 'http://localhost/cgi-bin/CRUD-Perl-refactored/routes/AlunoRoute.cgi?function=deleteById&deleteId=' + id,
          headers: {
          'Content-type': 'application/json;charset=utf-8'
          }
          })
          .then(function(response) {
          console.log(response.data);
          \$scope.carregar();
          });
          
        }

      }]);
    </script>
   
  </head>
  <body>
  <div class="container" ng-controller="listOfAlunos">
  
   <h1 class="mt-2">{{title}}</h1>
   <table class='table'>
   <tr><td>ID</td><td>Nome</td><td>Matricula</td><td>Telefone</td><td>Editar</td><td>Deletar</td></tr>
   <tr ng-repeat="aluno in alunos">
   <td>{{aluno.id}}</td>
   <td>{{aluno.nome}}</td>
   <td>{{aluno.matricula}}</td>
   <td>{{aluno.telefone}}</td>
   <td><a class='btn btn-primary' href='Views/edit-aluno.pl?editedId={{aluno.id}}'>Edit</a></td>
   <td><a class='btn btn-danger' ng-click='deletar(aluno.id)'>Delete</a></td>
   </tr>
 </table>

 <br>
 <a class='btn btn-success' href='Views/add-aluno.pl'>CLIQUE AQUI</a> 
        Para adicionar um novo aluno</div></body></html>
HTML