(function ($) {

    RemoveTableRow = function (handler) {
        var div = $(handler).closest('#ingrediente');

        div.fadeOut(400, function () {
            div.remove();
        });

        return false;
    };

    AddTableRow = function () {
        var $clone = $('#hidden');
        window.count = window.count + 1;

        if ($clone.hasClass('hidden')) {
            var $clone = $clone.clone();
            $clone.removeClass('hidden');
            $clone.attr('id', 'ingrediente');
            $clone.css({ 'display': 'inline-flex' });
            $($clone).find(':input').each(function (el, i) {
                $(i).attr('name', i.name + window.count);
            });
            $clone.appendTo($('#conteudo'));
        } else {
            $clone.appendTo('#conteudo');
        }
        return false;
    };


})(jQuery);