'use strict';

(function () {
    function init() {
        new Router([
            new Route('home', 'home.html', true),            
            new Route('about', 'about.html')
        ]);
    }
    init();
}());
