<html data-ng-app="">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.7/angular.min.js" type="text/javascript"></script>

</head>
</head>

<body>
<h2>Hellooooo World!</h2>

<h2>Mdule</h2>
<div class="container">

Name: <input type="text" data-ng-model="name"> {{name}}
</div>

<h2>Example 2</h2>
<div class="container2" data-ng-init="customers=[{name:'daniele',city:'vigasio'},{name:'lara',city:'isolalta'}]">

<h3> looping with the ng-repeat Directive</h3>
<ul>
<li data-ng-repeat="cust in customers | filter:name | orderBy:'city' ">{{cust.name | uppercase}} - {{cust.city | uppercase}}</li>

</ul>

</div>

<h2>Example 3 </h2>
<div class="container2" data-ng-controller="SimpleController" >

<h3> MVC</h3>
Name: <input type="text" data-ng-model="name"> {{name}}

<ul>
<li data-ng-repeat="cust in customers | filter:name | orderBy:'city' ">{{cust.name | uppercase}} - {{cust.city | uppercase}}</li>

</ul>

</div>

<script>

function SimpleController($scope){
	$scope.customers=
		[{name:'danieleController',city:'vigasio'},
		{name:'laraController',city:'isolalta'}];	
	
}


</script>



</body>
</html>
