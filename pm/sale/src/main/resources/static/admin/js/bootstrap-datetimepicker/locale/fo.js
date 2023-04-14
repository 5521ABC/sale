//! moment.js locale configuration
//! locale : faroese (fo)
//! author : Ragnar Johannesen : https://github.com/ragnar123

(function (global, factory) {
   typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('../moment')) :
   typeof define === 'function' && define.amd ? define(['moment'], factory) :
   factory(global.moment)
}(this, function (moment) { 'use strict';


    var fo = moment.defineLocale('fo', {
        months : 'januar_februar_mars_apr铆l_mai_juni_juli_august_september_oktober_november_desember'.split('_'),
        monthsShort : 'jan_feb_mar_apr_mai_jun_jul_aug_sep_okt_nov_des'.split('_'),
        weekdays : 'sunnudagur_m谩nadagur_t媒sdagur_mikudagur_h贸sdagur_fr铆ggjadagur_leygardagur'.split('_'),
        weekdaysShort : 'sun_m谩n_t媒s_mik_h贸s_fr铆_ley'.split('_'),
        weekdaysMin : 'su_m谩_t媒_mi_h贸_fr_le'.split('_'),
        longDateFormat : {
            LT : 'HH:mm',
            LTS : 'HH:mm:ss',
            L : 'DD/MM/YYYY',
            LL : 'D MMMM YYYY',
            LLL : 'D MMMM YYYY HH:mm',
            LLLL : 'dddd D. MMMM, YYYY HH:mm'
        },
        calendar : {
            sameDay : '[脥 dag kl.] LT',
            nextDay : '[脥 morgin kl.] LT',
            nextWeek : 'dddd [kl.] LT',
            lastDay : '[脥 gj谩r kl.] LT',
            lastWeek : '[s铆冒stu] dddd [kl] LT',
            sameElse : 'L'
        },
        relativeTime : {
            future : 'um %s',
            past : '%s s铆冒ani',
            s : 'f谩 sekund',
            m : 'ein minutt',
            mm : '%d minuttir',
            h : 'ein t铆mi',
            hh : '%d t铆mar',
            d : 'ein dagur',
            dd : '%d dagar',
            M : 'ein m谩na冒i',
            MM : '%d m谩na冒ir',
            y : 'eitt 谩r',
            yy : '%d 谩r'
        },
        ordinalParse: /\d{1,2}\./,
        ordinal : '%d.',
        week : {
            dow : 1, // Monday is the first day of the week.
            doy : 4  // The week that contains Jan 4th is the first week of the year.
        }
    });

    return fo;

}));
