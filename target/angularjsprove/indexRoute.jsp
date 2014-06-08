<html data-ng-app="demoApp">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.7/angular.min.js"
	type="text/javascript"></script>
<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
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
	
	
	
	<div class="row">
		<div class="col-md-3">.col-md-4</div>
		<div class="col-md-9">
			<h2>Example 3</h2>
			<div class="container2" data-ng-view=""></div>


		</div>
	</div>

	<script>
		var demoApp = angular.module('demoApp', []);

		demoApp.config(function($routeProvider) {
			$routeProvider.when('/', {
				controller : 'SimpleController',
				templateUrl : 'partials/view1.html'
			}).when('/view2', {
				controller : 'SimpleController',
				templateUrl : 'partials/view2.html'
			}).otherwise({
				redirectTo : '/'
			});

		});

		var controllers = {};

		controllers.SimpleController = function($scope) {
			$scope.customers = [ {
				name : 'danieleController',
				city : 'vigasio'
			}, {
				name : 'laraController',
				city : 'isolalta'
			} ];

			$scope.addCustomer = function() {
				$scope.customers.push({
					name : $scope.newCustomer.name,
					city : $scope.newCustomer.city
				});

			};

		};


		demoApp.controller(controllers);
	</script>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>

</body>
</html>