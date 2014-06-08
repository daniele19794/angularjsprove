<html ng-app="Demo" ng-controller="DemoController">
<head>
    <meta charset="utf-8" />
 
    <title>
        Grouping Nested ngRepeat Lists In AngularJS
    </title>
</head>
<body>
 
    <h1>
        Grouping Nested ngRepeat Lists In AngularJS
    </h1>
 
    <p>
        Group by:
        <a ng-click="groupBy( 'gender' )">Gender</a> -
        <a ng-click="groupBy( 'hair' )">Hair</a>
    </p>
 
    <!-- BEGIN: Outer ngRepeat. -->
    <div ng-repeat="group in groups">
 
        <h2>
            {{ group.label }}
        </h2>
 
        <ul>
            <!-- BEGIN: Inner ngRepeat. -->
            <li ng-repeat="friend in group.friends">
 
                {{ friend.name }}
 
            </li>
            <!-- END: Inner ngRepeat. -->
        </ul>
 
    </div>
    <!-- END: Outer ngRepeat. -->
 
 
 
    <!-- Load jQuery and AngularJS from the CDN. -->
    <script
        type="text/javascript"
        src="//code.jquery.com/jquery-1.9.1.min.js">
    </script>
    <script
        type="text/javascript"
        src="//ajax.googleapis.com/ajax/libs/angularjs/1.0.4/angular.min.js">
    </script>
 
    <!-- Load the app module and its classes. -->
    <script type="text/javascript">
 
 
        // Define our AngularJS application module.
        var demo = angular.module( "Demo", [] );
 
 
        // -------------------------------------------------- //
        // -------------------------------------------------- //
 
 
        // I am the main controller for the application.
        demo.controller(
            "DemoController",
            function( $scope, $timeout ) {
 
 
                // -- Define Controller Methods. ------------ //
 
 
                // I sort the given collection on the given property.
                function sortOn( collection, name ) {
 
                    collection.sort(
                        function( a, b ) {
 
                            if ( a[ name ] <= b[ name ] ) {
 
                                return( -1 );
 
                            }
 
                            return( 1 );
 
                        }
                    );
 
                }
 
 
                // -- Define Scope Methods. ----------------- //
 
 
                // I group the friends list on the given property.
                $scope.groupBy = function( attribute ) {
 
                    // First, reset the groups.
                    $scope.groups = [];
 
                    // Now, sort the collection of friend on the
                    // grouping-property. This just makes it easier
                    // to split the collection.
                    sortOn( $scope.friends, attribute );
 
                    // I determine which group we are currently in.
                    var groupValue = "_INVALID_GROUP_VALUE_";
 
                    // As we loop over each friend, add it to the
                    // current group - we'll create a NEW group every
                    // time we come across a new attribute value.
                    for ( var i = 0 ; i < $scope.friends.length ; i++ ) {
 
                        var friend = $scope.friends[ i ];
 
                        // Should we create a new group?
                        if ( friend[ attribute ] !== groupValue ) {
 
                            var group = {
                                label: friend[ attribute ],
                                friends: []
                            };
 
                            groupValue = group.label;
 
                            $scope.groups.push( group );
 
                        }
 
                        // Add the friend to the currently active
                        // grouping.
                        group.friends.push( friend );
 
                    }
 
                };
 
 
                // -- Define Scope Variables. --------------- //
 
 
                // I am the raw collection of friends.
                $scope.friends = [
                    {
                        name: "Michael",
                        gender: "Male",
                        hair: "Brunette"
                    },
                    {
                        name: "George Michael",
                        gender: "Male",
                        hair: "Brunette"
                    },
                    {
                        name: "Gob",
                        gender: "Male",
                        hair: "Brunette"
                    },
                    {
                        name: "Tobias",
                        gender: "Male",
                        hair: "Black"
                    },
                    {
                        name: "Lindsay",
                        gender: "Female",
                        hair: "Blonde"
                    },
                    {
                        name: "Maeby",
                        gender: "Female",
                        hair: "Black"
                    }
                ];
 
                // I am the grouped collection. Each one of these
                // will contain a sub-collection of friends.
                $scope.groups = [];
 
 
            }
        );
 
 
    </script>
 
</body>
</html>