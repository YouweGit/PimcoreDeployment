/**
 * Pimcore
 *
 * LICENSE
 *
 * This source file is subject to the new BSD license that is bundled
 * with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * http://www.pimcore.org/license
 *
 * @copyright  Copyright (c) 2009-2014 pimcore GmbH (http://www.pimcore.org)
 * @license    http://www.pimcore.org/license     New BSD License
 */

pimcore.registerNS("pimcore.object.classes.layout.region");
pimcore.object.classes.layout.region = Class.create(pimcore.object.classes.layout.layout, {

    type: "region",

    initialize: function (treeNode, initData) {
        this.type = "region";

        this.initData(initData);

        this.treeNode = treeNode;
    },

    getTypeName: function () {
        return t("region");
    },

    getIconClass: function () {
        return "pimcore_icon_layout_region";
    }

});