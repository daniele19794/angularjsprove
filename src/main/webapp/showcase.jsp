<html data-ng-app="showcase">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="webjars/angularjs/1.2.20/angular.min.js" type="text/javascript"></script>
<script src="webjars/angular-ui/0.4.0/angular-ui.js" type="text/javascript"></script>

<script src="resources/controllers/DatepickerDemoCtrl.js"></script>

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

	<div ng-controller="DatepickerDemoCtrl">
    <pre>Selected date is: <em>{{dt | date:'fullDate' }}</em></pre>

    <h4>Inline</h4>
    <div style="display:inline-block; min-height:290px;">
        <datepicker ng-model="dt" min-date="minDate" show-weeks="true" class="well well-sm"></datepicker>
    </div>

    <h4>Popup</h4>
    <div class="row">
        <div class="col-md-6">
            <p class="input-group">
              <input type="text" class="form-control" datepicker-popup="{{format}}" ng-model="dt" is-open="opened" min-date="minDate" max-date="'2015-06-22'" datepicker-options="dateOptions" date-disabled="disabled(date, mode)" ng-required="true" close-text="Close" />
              <span class="input-group-btn">
                <button type="button" class="btn btn-default" ng-click="open($event)"><i class="glyphicon glyphicon-calendar"></i></button>
              </span>
            </p>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <label>Format:</label> <select class="form-control" ng-model="format" ng-options="f for f in formats"><option></option></select>
        </div>
    </div>

    <hr />
    <button type="button" class="btn btn-sm btn-info" ng-click="today()">Today</button>
    <button type="button" class="btn btn-sm btn-default" ng-click="dt = '2009-08-24'">2009-08-24</button>
    <button type="button" class="btn btn-sm btn-danger" ng-click="clear()">Clear</button>
    <button type="button" class="btn btn-sm btn-default" ng-click="toggleMin()" tooltip="After today restriction">Min date</button>
</div>

	
	
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="resources/js/jquery-1.11.1.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed-->
	<script src="resources/js/bootstrap.min.js"></script>
</body>
</html>
