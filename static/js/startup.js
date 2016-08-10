pimcore.registerNS("pimcore.plugin.deployment");

pimcore.plugin.deployment = Class.create(pimcore.plugin.admin, {
    getClassName: function() {
        return "pimcore.plugin.deployment";
    },

    initialize: function() {
        pimcore.plugin.broker.registerPlugin(this);
    },
 
    pimcoreReady: function (params,broker){
        // alert("Deployment Ready!");
    }
});

var deploymentPlugin = new pimcore.plugin.deployment();

