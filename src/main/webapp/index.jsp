<html data-ng-app="demoApp" ng-controller="personController">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="resources/js/angular.min.js" type="text/javascript"></script>

<!-- Bootstrap -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet">

</head>

<body>
	<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Brand</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Link</a></li>
					<li><a href="#">Link</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Dropdown <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li class="divider"></li>
							<li><a href="#">Separated link</a></li>
							<li class="divider"></li>
							<li><a href="#">One more separated link</a></li>
						</ul></li>
				</ul>
				<form class="navbar-form navbar-left" role="search">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search">
					</div>
					<button type="submit" class="btn btn-default">Submit</button>
				</form>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">Link</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Dropdown <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li class="divider"></li>
							<li><a href="#">Separated link</a></li>
						</ul></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<div class="alert alert-danger" ng-show="showAlert">{{alertMessage}}</div>



	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title">Aggiungi Progetto</h4>
				</div>
				<div class="container"></div>
				<div class="modal-body">

					<div class="input-group">
						<span class="input-group-addon">Nome</span> <input type="text"
							class="form-control" placeholder="inserire nome"
							data-ng-model="formAddProgetto.titolo">
					</div>

				</div>
				<div class="modal-footer">
					<a href="#" data-dismiss="modal" class="btn">Chiudi</a>

					<button data-ng-click='addProgetto()' data-dismiss="modal"
						class="btn btn-primary">Add Progetto</button>

				</div>
			</div>
		</div>
	</div>

	<div class="modal" id="modalAddItem">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title">Aggiungi Item</h4>
				</div>
				<div class="container"></div>
				<div class="modal-body">

					<div class="input-group">
						<span class="input-group-addon">Nome</span> <input type="text"
							class="form-control" placeholder="inserire nome"
							data-ng-model="formAddItem.titolo">
					</div>

				</div>
				<div class="modal-footer">
					<a href="#" data-dismiss="modal" class="btn">Chiudi</a>

					<button data-ng-click='addItem()' data-dismiss="modal"
						class="btn btn-primary">Add Item</button>

				</div>
			</div>
		</div>
	</div>



	<button class="btn btn-danger btn-mini" data-ng-click="getProgetti()">http</button>
	<div class="row">
		<div class="col-md-3">.col-md-4</div>
		<div class="col-md-9">
			<h2>Example 4</h2>
			<div class="container2" data-ng-view=""></div>

			Cerca: <input ng-model="searchText">
			</form>

			<div>
				<br> <a data-toggle="modal" href="#myModal"
					class="btn btn-primary">Aggiungi Progetto</a>

				<div data-ng-repeat="row in progetti|filter:searchText">
					<b>{{row.titolo}} </b><br />
					<button data-ng-click='deleteProgetto(row)' class="btn btn-danger">Delete
					</button>

					<table class="table table-striped">

						<thead>
							<tr>
								<th><a href=""
									ng-click="predicate = 'titolo'; reverse=!reverse">Titolo</a></th>
								<th>Data Inizio</th>
								<th>Data Fine</th>
								<th></th>
							</tr>
							 
						</thead>
						<tr data-ng-repeat="i in row.items | orderBy:predicate:reverse">
							<td>{{i.titolo}}</td>
							<td>{{$index+1}}</td>
							<td>date</td>
							<td><button class="btn btn-danger btn-mini"
									data-ng-click="deleteItem($parent.$index,i)">
									<i class="icon-trash icon-white">delete</i>
								</button></td>

						</tr>

					</table>

					<a data-toggle="modal" href="#modalAddItem"
						data-ng-click="currentProgetto(row)" class="btn btn-primary">Aggiungi
						Item</a> <br> <br> <br>
				</div>


			</div>
		</div>
	</div>

	<script>
		var demoApp = angular
				.module('demoApp', [])
				.controller(
						'personController',
						function($scope, $http) {

							$scope.showAlert = false;
							$scope.alertMessage = '';

							$scope.formAddProgetto = {};
							$scope.formAddProgetto.titolo = "";

							$scope.formAddItem = {};
							$scope.formAddItem.titolo = "";
							$scope.formAddItem.progetto = "";

							$scope.progetti = [ {
								titolo : 'Front End',
								dataInizio : '9/10/2012',
								dataFine : '10/10/2012',
								items : [ {

									titolo : 'Fatca',
									milestones : [ {
										nome : 'f1'
									}, {
										nome : 'f2'
									}

									]

								}, {
									titolo : 'Gianos',
									milestones : [ {
										nome : 'f1'
									}, {
										nome : 'f2'
									}

									]
								}, {
									titolo : 'Reg 40',
									milestones : [ {
										nome : 'f1'
									}, {
										nome : 'f2'
									}

									]
								} ]
							}, {
								titolo : 'Front End Direzionale',
								dataInizio : '9/10/2012',
								dataFine : '10/10/2012',
								items : [ {

									titolo : 'Misto',
									milestones : [ {
										nome : 'f1'
									}, {
										nome : 'f2'
									}

									]
								}, {
									titolo : 'vita',
									milestones : [ {
										nome : 'f1'
									}, {
										nome : 'f2'
									}

									]
								} ]
							}

							];

							$scope.showError = function() {
								console.log('showerror');
							}

							$scope.deleteProgetto = function(row) {
								console.info(row);
								$scope.progetti.splice(row, 1);
							}

							$scope.currentProgetto = function(row) {
								console.info('provaaaa' + row);
								$scope.formAddItem.progetto = row;
							}

							$scope.addProgetto = function() {
								$scope.progetti.push({
									titolo : $scope.formAddProgetto.titolo,
									dataInizio : '10/10/2012',
									dataFine : '10/10/2012',
								//items:{item:{titolo:'item1'},item:{titolo:'item1'}}
								});
								console.info($scope.formAddProgetto.titolo);
							};

							$scope.deleteItem = function(rowIndex, i) {
								console.info('prova' + i + 'sdaf ' + rowIndex);
								$scope.progetti[rowIndex].items.splice(
										$scope.progetti[rowIndex].items
												.indexOf(i), 1);

							};
							$scope.chiama = function() {
								console.log('chiama');
								var responsePromise = $http
										.get("http://localhost:8080/angularjsprove/rest/emp/dummy");

								responsePromise.success(function(data, status,
										headers, config) {

									console.log('adfasdf ' +data.titolo);
									//$scope.myData.name = data.name;

								});
								responsePromise
										.error(function(data, status, headers,
												config) {
											$scope.showAlert = true;
											$scope.alertMessage = 'Errore nel recupero dati dal server';

										});
							};

							$scope.getProgetti = function() {
								console.log('getProgetti');
								console.log('chiama');
								var responsePromise = $http
										.get("http://localhost:8080/angularjsprove/rest/emps");

								responsePromise.success(function(data, status,
										headers, config) {

									console.log(data);
									//$scope.myData.name = data.name;

								});
								
								responsePromise
										.error(function(data, status, headers,
												config) {
											$scope.showAlert = true;
											$scope.alertMessage = 'Errore nel recupero dati dal server';

										});
							};

							$scope.addItem = function() {
								$scope.progetti[$scope.progetti
										.indexOf($scope.formAddItem.progetto)].items
										.push({
											titolo : $scope.formAddItem.titolo,

										//items:{item:{titolo:'item1'},item:{titolo:'item1'}}
										});

							}

						});
	</script>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="resources/js/jquery-1.11.1.min.js"></script>

	<!-- Include all compiled plugins (below), or include individual files as needed-->
	<script src="resources/js/bootstrap.min.js"></script>

</body>
</html>
