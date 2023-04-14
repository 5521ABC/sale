//! moment.js locale configuration
//! locale : Albanian (sq)
//! author : Flak毛rim Ismani : https://github.com/flakerimi
//! author: Menelion Elens煤le: https://github.com/Oire (tests)
//! author : Oerd Cukalla : https://github.com/oerd (fixes)

(function (global, factory) {
   typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('../moment')) :
   typeof define === 'function' && define.amd ? define(['moment'], factory) :
   factory(global.moment)
}(this, function (moment) { 'use strict';


    var sq = moment.defineLocale('sq', {
        months : 'Janar_Shkurt_Mars_Prill_Maj_Qershor_Korrik_Gusht_Shtator_Tetor_N毛ntor_Dhjetor'.split('_'),
        monthsShort : 'Jan_Shk_Mar_Pri_Maj_Qer_Kor_Gus_Sht_Tet_N毛n_Dhj'.split('_'),
        weekdays : 'E Diel_E H毛n毛_E Mart毛_E M毛rkur毛_E Enjte_E Premte_E Shtun毛'.split('_'),
        weekdaysShort : 'Die_H毛n_Mar_M毛r_Enj_Pre_Sht'.split('_'),
        weekdaysMin : 'D_H_Ma_M毛_E_P_Sh'.split('_'),
        meridiemParse: /PD|MD/,
        isPM: function (input) {
            return input.charAt(0) === 'M';
        },
        meridiem : function (hours, minutes, isLower) {
            return hours < 12 ? 'PD' : 'MD';
        },
        longDateFormat : {
            LT : 'HH:mm',
            LTS : 'HH:mm:ss',
            L : 'DD/MM/YYYY',
            LL : 'D MMMM YYYY',
            LLL : 'D MMMM YYYY HH:mm',
            LLLL : 'dddd, D MMMM YYYY HH:mm'
        },
        calendar : {
            sameDay : '[Sot n毛] LT',
            nextDay : '[Nes毛r n毛] LT',
            nextWeek : 'dddd [n毛] LT',
            lastDay : '[Dje n毛] LT',
            lastWeek : 'dddd [e kaluar n毛] LT',
            sameElse : 'L'
        },
        relativeTime : {
            future : 'n毛 %s',
            past : '%s m毛 par毛',
            s : 'disa sekonda',
            m : 'nj毛 minut毛',
            mm : '%d minuta',
            h : 'nj毛 or毛',
            hh : '%d or毛',
            d : 'nj毛 dit毛',
            dd : '%d dit毛',
            M : 'nj毛 muaj',
            MM : '%d muaj',
            y : 'nj毛 vit',
            yy : '%d vite'
        },
        ordinalParse: /\d{1,2}\./,
        ordinal : '%d.',
        week : {
            dow : 1, // Monday is the first day of the week.
            doy : 4  // The week that contains Jan 4th is the first week of the year.
        }
    });

    return sq;

}));
