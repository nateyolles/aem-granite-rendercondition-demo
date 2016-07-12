(function(document, $) {
    'use strict';

    $(function(){
        var $setCookie,
            $deleteCookie,
            $resetPage;

        $setCookie = $('.set-cookie');
        $deleteCookie = $('.delete-cookie');
        $resetPage = $('.reset-page');

        $setCookie.click(function(e){
            e.preventDefault();
            Cookies.set('bat', 'qux');
            location.reload();
        });

        $deleteCookie.click(function(e){
            e.preventDefault();
            Cookies.remove('bat');
            location.reload();
        });

        $resetPage.click(function(){
            Cookies.remove('bat');
        })

    });
})(document, Granite.$);