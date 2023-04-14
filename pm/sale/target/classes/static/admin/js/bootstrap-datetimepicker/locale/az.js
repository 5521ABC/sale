//! moment.js locale configuration
//! locale : azerbaijani (az)
//! author : topchiyev : https://github.com/topchiyev

(function (global, factory) {
   typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('../moment')) :
   typeof define === 'function' && define.amd ? define(['moment'], factory) :
   factory(global.moment)
}(this, function (moment) { 'use strict';


    var suffixes = {
        1: '-inci',
        5: '-inci',
        8: '-inci',
        70: '-inci',
        80: '-inci',
        2: '-nci',
        7: '-nci',
        20: '-nci',
        50: '-nci',
        3: '-眉nc眉',
        4: '-眉nc眉',
        100: '-眉nc眉',
        6: '-nc谋',
        9: '-uncu',
        10: '-uncu',
        30: '-uncu',
        60: '-谋nc谋',
        90: '-谋nc谋'
    };

    var az = moment.defineLocale('az', {
        months : 'yanvar_fevral_mart_aprel_may_iyun_iyul_avqust_sentyabr_oktyabr_noyabr_dekabr'.split('_'),
        monthsShort : 'yan_fev_mar_apr_may_iyn_iyl_avq_sen_okt_noy_dek'.split('_'),
        weekdays : 'Bazar_Bazar ert蓹si_脟蓹r艧蓹nb蓹 ax艧am谋_脟蓹r艧蓹nb蓹_C眉m蓹 ax艧am谋_C眉m蓹_艦蓹nb蓹'.split('_'),
        weekdaysShort : 'Baz_BzE_脟Ax_脟蓹r_CAx_C眉m_艦蓹n'.split('_'),
        weekdaysMin : 'Bz_BE_脟A_脟蓹_CA_C眉_艦蓹'.split('_'),
        longDateFormat : {
            LT : 'HH:mm',
            LTS : 'HH:mm:ss',
            L : 'DD.MM.YYYY',
            LL : 'D MMMM YYYY',
            LLL : 'D MMMM YYYY HH:mm',
            LLLL : 'dddd, D MMMM YYYY HH:mm'
        },
        calendar : {
            sameDay : '[bug眉n saat] LT',
            nextDay : '[sabah saat] LT',
            nextWeek : '[g蓹l蓹n h蓹ft蓹] dddd [saat] LT',
            lastDay : '[d眉n蓹n] LT',
            lastWeek : '[ke莽蓹n h蓹ft蓹] dddd [saat] LT',
            sameElse : 'L'
        },
        relativeTime : {
            future : '%s sonra',
            past : '%s 蓹vv蓹l',
            s : 'birne莽蓹 saniyy蓹',
            m : 'bir d蓹qiq蓹',
            mm : '%d d蓹qiq蓹',
            h : 'bir saat',
            hh : '%d saat',
            d : 'bir g眉n',
            dd : '%d g眉n',
            M : 'bir ay',
            MM : '%d ay',
            y : 'bir il',
            yy : '%d il'
        },
        meridiemParse: /gec蓹|s蓹h蓹r|g眉nd眉z|ax艧am/,
        isPM : function (input) {
            return /^(g眉nd眉z|ax艧am)$/.test(input);
        },
        meridiem : function (hour, minute, isLower) {
            if (hour < 4) {
                return 'gec蓹';
            } else if (hour < 12) {
                return 's蓹h蓹r';
            } else if (hour < 17) {
                return 'g眉nd眉z';
            } else {
                return 'ax艧am';
            }
        },
        ordinalParse: /\d{1,2}-(谋nc谋|inci|nci|眉nc眉|nc谋|uncu)/,
        ordinal : function (number) {
            if (number === 0) {  // special case for zero
                return number + '-谋nc谋';
            }
            var a = number % 10,
                b = number % 100 - a,
                c = number >= 100 ? 100 : null;
            return number + (suffixes[a] || suffixes[b] || suffixes[c]);
        },
        week : {
            dow : 1, // Monday is the first day of the week.
            doy : 7  // The week that contains Jan 1st is the first week of the year.
        }
    });

    return az;

}));
