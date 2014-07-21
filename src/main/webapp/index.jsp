<html data-ng-app="demoApp" ng-controller="personController">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="resources/js/angular.min.js" type="text/javascript"></script>
<script src="resources/filters/customFilters.js"></script>
<script src="resources/controllers/ProgettoController.js"></script>

<!-- Bootstrap -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet">

</head>


<body>
	<ng-include src="'resources/navigations.html'" > </ng-include>
	<ng-include src="'resources/modalNewProgetto.html'"> </ng-include>
	<ng-include src="'resources/modalNewItem.html'"> </ng-include>

	<div class="alert alert-info" ng-show="showAlert">{{alertMessage}}</div>
	<div class="alert alert-danger" ng-show="showAlert">{{alertMessage}}</div>


	<button class="btn btn-danger btn-mini" data-ng-click="getProgetti()">http</button>
	<div class="row">
		<div class="col-md-3">
			<h2>Progetti</h2>
			<a data-ng-repeat="row in progettiStatici"
				class=" btn btn-block btn-default btn-lg"
				ng-class="getProgettoClass(row)" ng-click="selectProgetto(row)">
				<b>{{row.titolo}} </b><br />
			</a>

		</div>
		<div class="col-md-9">
			<h2>Items</h2>
			<div class="container2" data-ng-view=""></div>

			Cerca: <input ng-model="searchText">
			</form>
			{{progetti}}
			<div>

				Progetto selezionato - {{selectedProgetto.id}} - Titolo
				{{selectedProgetto.titolo}} <br> <br>


				<div class="well" ng-repeat="i in itemsStaticidb ">
					<h3>
						<strong>{{i.titolo}}</strong>

					</h3>
				</div>

				<ng-include src="'resources/itemsList.html'"> </ng-include>

				<a data-toggle="modal" href="#myModal" class="btn btn-primary">Aggiungi
					Progetto</a>

				<div data-ng-repeat="row in progetti|filter:searchText">
					<b>{{row.progetto.titolo}} </b><br />
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
							<td>{{i.dataInizio}}</td>
							<td>{{i.dataFine}}</td>
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
		
	</script> <!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> <script
		src="resources/js/jquery-1.11.1.min.js"></script> <!-- Include all compiled plugins (below), or include individual files as needed-->
	<script src="resources/js/bootstrap.min.js"></script>
</body>
</html>
