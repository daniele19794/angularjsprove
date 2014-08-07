<html data-ng-app="demoApp" ng-controller="personController">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="webjars/angularjs/1.2.20/angular.min.js" type="text/javascript"></script>
<script src="resources/filters/customFilters.js"></script>
<script src="resources/services/ProgetttoFactory.js"></script>
<script src="resources/controllers/ProgettoController.js"></script>


<style>
.sidebar-nav-fixed {
	padding: 9px 0;
	position: fixed;
	left: 20px;
	top: 60px;
	width: 250px;
}

#main-container {
    margin-top: 60px;
}

.row-fluid>.span-fixed-sidebar {
	margin-left: 290px;
}
</style>

<!-- Bootstrap -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet">

</head>

<body>

	
		<ng-include src="'resources/navigations.html'"> </ng-include>

	
	
	
	<ng-include src="'resources/modalNewProgetto.html'"> </ng-include>
	<ng-include src="'resources/modalNewItem.html'"> </ng-include>

	<div class="alert alert-info" ng-show="showInfo">{{infoMessage}}</div>
	<div class="alert alert-danger" ng-show="showAlert">{{alertMessage}}</div>

 <p class="input-group">
              <input type="text" class="form-control" datepicker-popup="{{format}}" ng-model="dt" is-open="opened" min-date="minDate" max-date="'2015-06-22'" datepicker-options="dateOptions" date-disabled="disabled(date, mode)" ng-required="true" close-text="Close" />
              <span class="input-group-btn">
                <button type="button" class="btn btn-default" data-ng-click='open($event)'><i class="glyphicon glyphicon-calendar"></i></button>
              </span>
            </p>

	<div class="row">
		<div class="col-md-2">
			<div class="affix">
				<h2>Progetti</h2>

				<ul class="nav nav-pills nav-stacked"
					data-ng-repeat="row in progettiStatici">
					<li ng-class="{ active: isActive('/{{row.titolo }}') }"><a
						href="#{{ row.titolo }}" target="_self"> {{ row.titolo }}</a></li>
				</ul>
			</div>

		</div>
		<div class="col-md-9">
			<h2>Items</h2>
			<div class="container2" data-ng-view=""></div>

			Cerca: <input ng-model="searchText">
			</form>
			{{progetti}}
			<div>

				Progetto selezionato - {{selectedProgetto.id}} - Titolo
				{{selectedProgetto.titolo}} <br> <br> <a
					data-toggle="modal" href="#modalAddItem" class="btn btn-primary">Aggiungi
					Item</a>

				<!-- 
				<ng-include src="'resources/itemsList.html'"> </ng-include>
	 -->



				<!-- inizio -->

				<div ng-repeat="row in progettiStatici">

					<h2 id="{{ row.titolo }}">
						<div id="{{ row.titolo }}">{{ row.titolo }}</div>
					</h2>


					<ng-include src="'resources/itemsList.html'"> </ng-include>


				</div>

				<!-- fine -->
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
						data-ng-click="currentProgetto()" class="btn btn-primary">Aggiungi
						Item</a> <br> <br> <br>
				</div>

			</div>
		</div>
	</div>

	<script>
		
	</script>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="resources/js/jquery-1.11.1.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed-->
	<script src="resources/js/bootstrap.min.js"></script>
</body>
</html>
