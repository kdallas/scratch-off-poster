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
