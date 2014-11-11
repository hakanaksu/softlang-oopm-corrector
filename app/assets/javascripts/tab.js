function loadSpinner($aTarget, options) {
    var settings = $.extend({}, {type: 'panel', colspan: 0, text_msg: ''}, options);
    switch (settings.type) {
        case('panel'):
            $aTarget.html('<br/><br/><br/><center><i class="fa fa-spinner fa-spin fa-2x"></i></center><br/><br/><br/>');
            break;
        case ('table'):
            $aTarget.html('<tr><td colspan="' + settings.colspan + '"><center><i class="fa fa-spinner fa-spin fa-2x"></i></center></td></tr>');
            break;
        case ('section'):
            $aTarget.html('<center style="padding-top: 5%; padding-bottom: 5%;"><i class="fa fa-spinner fa-spin fa-5x"></i><br/><br/> <h2>' + settings.text_msg + '</h2></center>');
            break;
    }
}

function ajaxTab($aTargetTab, aUrl, aErrorMsg) {
    $.ajax({
        type: 'GET',
        url: aUrl,
        success: function (data) {
            $aTargetTab.html(data);
        },
        error: function () {
            $aTargetTab.html(aErrorMsg);
        }
    });
}