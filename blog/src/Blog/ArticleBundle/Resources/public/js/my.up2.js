
// Init navigation menu
jQuery(function () {
    // main navigation init
    jQuery('ul.sf-menu').superfish({
        delay: 1000, // the delay in milliseconds that the mouse can remain outside a sub-menu without it closing
        animation: {
            opacity: "show",
            height: "show"
        }, // used to animate the sub-menu open
        speed: "normal", // animation speed
        autoArrows: true, // generation of arrow mark-up (for submenu)
        disableHI: true // to disable hoverIntent detection
    });

    //Zoom fix
    //IPad/IPhone
    var viewportmeta = document.querySelector && document.querySelector('meta[name="viewport"]'),
        ua = navigator.userAgent,
        gestureStart = function () {
            viewportmeta.content = "width=device-width, minimum-scale=0.25, maximum-scale=1.6, initial-scale=1.0";
        },
        scaleFix = function () {
            if (viewportmeta && /iPhone|iPad/.test(ua) && !/Opera Mini/.test(ua)) {
                viewportmeta.content = "width=device-width, minimum-scale=1.0, maximum-scale=1.0";
                document.addEventListener("gesturestart", gestureStart, false);
            }
        };
    scaleFix();
})

jQuery(document).ready(function () {
    if (!device.mobile() && !device.tablet()) {
        jQuery('.nav-wrapper').tmStickUp({
            correctionSelector: jQuery('#wpadminbar')
            , listenSelector: jQuery('.listenSelector')
            , active: true, pseudo: true
        });
    }
})