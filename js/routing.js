'use strict';

function Route(name, htmlName, defaultRoute) {
    try {
        if(!name || !htmlName) {
            //throw 'error: name and htmlName params are mandatories';
            console.error('error: name and htmlName params are mandatory');
        }
        this.__construct(name, htmlName, defaultRoute);
    } catch (e) {
        console.error(e);
    }
}

Route.prototype = {
    name: undefined,
    htmlName: undefined,
    default: undefined,
    __construct: function (name, htmlName, defaultRoute) {
        this.name = name;
        this.htmlName = htmlName;
        this.default = defaultRoute;
    },
    isActiveRoute: function (hashedPath) {
        return hashedPath.replace('#', '') === this.name;
    }
};

function Router(routes) {
    try {
        if (!routes) {
            //throw 'error: routes param is mandatory';
            console.error('error: routes param is mandatory');
        }
        this.__construct(routes);
        this.init();
    } catch (e) {
        console.error(e);
    }
}

Router.prototype = {
    routes: undefined,
    rootElem: undefined,
    __construct: function (routes) {
        this.routes = routes;
        this.rootElem = document.getElementById('app');
    },
    init: function () {
        var r = this.routes;
        (function(scope, r) {
            window.addEventListener('hashchange', function () {
                scope.hasChanged(scope, r);
            });
        })(this, r);
        this.hasChanged(this, r);
    },
    hasChanged: function(scope, r){
        var i,length,route;
        if (window.location.hash.length > 0) {
            for (i = 0, length = r.length; i < length; i++) {
                route = r[i];
                if(route.isActiveRoute(window.location.hash.substr(1))) {
                    scope.goToRoute(route.htmlName);
                }
            }
        } else {
            for (i = 0, length = r.length; i < length; i++) {
                route = r[i];
                if(route.default) {
                    scope.goToRoute(route.htmlName);
                }
            }
        }
    },
    goToRoute: function (htmlName) {
        (function(scope) {
            var url = 'views/' + htmlName,
                xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState === 4 && this.status === 200) {
                    scope.rootElem.innerHTML = this.responseText;
                }
            };
            xhttp.open('GET', url, true);
            xhttp.send();
        })(this);
    }
};

(function () {
    function init() {
        new Router([
            new Route('home', 'home.html', true),
            new Route('about', 'about.html')
        ]);
    }
    init();
}());
