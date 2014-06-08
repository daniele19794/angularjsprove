<html lang="en">
  <head>
    <meta charset="utf-8">
 
    <title>AngularJS Sorting &amp; Filtering Example</title>
 
    <style type="text/css">
      body{ font:12px arial, sans-serif; line-height:1.6em; margin:0 auto; max-width:960px; }
      form{ text-align:right; }
      h1, h2, hr, p, table{ margin-bottom:20px; }
      table{ width:100%; }
      th, td{ padding:5px; text-align:left; vertical-align:top; }
      th{ background:#ccc; }
      .even{ background-color:#efefef; }
    </style>
 
    <!-- include the core AngularJS library -->
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.1/angular.min.js"></script>
    <script>
    // create a method that we will use as the constructor for our contact list
    function ContactListCtrl($scope){
      // create an array of contacts (we could retrieve this data from a web service)
      $scope.contacts = [
        { "pfirstname":"Simon", "plastname":"Bingham", "ptelephone":"00000 000000" }
        , { "pfirstname":"Andy", "plastname":"Beer", "ptelephone":"00000 000000" }
        , { "pfirstname":"John", "plastname":"Whish", "ptelephone":"00000 000000" }
      ];
    };
    </script>
  </head>
 
  <!--
    use ngApp (http://docs.angularjs.org/api/ng.directive:ngApp) to bootstrap AngularJS 
    to our application and ngController 
    (http://docs.angularjs.org/api/ng.directive:ngController) 
    to create a new scope using our ContactListCtrl method (above) as the constructor
  -->
  <body ng-app ng-controller="ContactListCtrl">
    <h1>AngularJS Sorting &amp; Filtering Example</h1>
    
    <form>
      <!-- 
        use ngModel (http://docs.angularjs.org/api/ng.directive:ngModel) 
        to set-up a two way data binding called query 
      -->
      Search: <input ng-model="query">
 
      <!-- 
        use ngModel (http://docs.angularjs.org/api/ng.directive:ngModel)
        to set-up a two way data binding called sortorder 
      -->
      <select ng-model="sortorder">
        <option value="">-- sort order --</option>
        <option value="plastname">Ascending</option>
        <option value="-plastname">Descending</option>
      </select>
    </form>
    
    <!-- 
      display the number of (filtered) contacts using ngShow
      (http://docs.angularjs.org/api/ng.directive:ngShow) 
      to display additional text if a search query has been entered 
    -->
    <p>There are <strong>{{(contacts|filter:query).length}}</strong> contacts<span ng-show="query.length"> matching &quot;{{query}}&quot;</span>.</p>
    
    <!--- 
      use ngShow to detect whether filtered contacts exist
      and display the table if they do 
    ---> 
    <table class="contacts" ng-show="(contacts|filter:query).length">
      <tr>
        <th>Name</th>
        <th>Telephone</th>
      </tr>
 
      <!-- 
        use ngRepeat (http://docs.angularjs.org/api/ng.directive:ngRepeat) to loop 
        through and output our contacts with the filter and sort order applied 
      -->
      <tr ng-repeat="contact in contacts|filter:query|orderBy:sortorder">
        <!-- 
          use ngClassEven (http://docs.angularjs.org/api/ng.directive:ngClassEven)
          to apply a class to even rows so we can make our table stripey 
        -->
        <td ng-class-even="'even'">{{contact.plastname}}, {{contact.pfirstname}}</td>
        <td ng-class-even="'even'">{{contact.ptelephone}}</td>
      </tr>
    </table>
  </body>
</html>