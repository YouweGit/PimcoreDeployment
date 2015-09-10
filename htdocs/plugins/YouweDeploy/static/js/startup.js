pimcore.registerNS("pimcore.plugin.youwedeploy");

pimcore.plugin.youwedeploy = Class.create(pimcore.plugin.admin, {
    getClassName: function() {
        return "pimcore.plugin.youwedeploy";
    },

    initialize: function() {
        pimcore.plugin.broker.registerPlugin(this);
    },
 
    pimcoreReady: function (params,broker){
        // alert("Example Ready!");
    }
});

var youwedeployPlugin = new pimcore.plugin.youwedeploy();

