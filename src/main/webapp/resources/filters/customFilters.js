/// <reference path="../angular.js" />


angular.module("customFilters", [])

.filter("range", function ($filter) {
	console.log('filtro paginazione');
    return function (data, page, size) {
    	//console.log('data ' + data);
    	//console.log('page ' + page);
    	//console.log('size ' + size);
        if (angular.isArray(data) && angular.isNumber(page) && angular.isNumber(size)) {
            var start_index = (page - 1) * size;
           // console.log('start_index ' + start_index);
            if (data.length < start_index) {
                return [];
            } else {
                return $filter("limitTo")(data.splice(start_index), size);
            }
        } else {
        	
            return data;
        }
    }
})
.filter("pageCount", function () {
    return function (data, size) {
        if (angular.isArray(data)) {
            var result = [];
            for (var i = 0; i < Math.ceil(data.length / size) ; i++) {
                result.push(i);
            }
            return result;
        } else {
            return data;
        }
    }
});

