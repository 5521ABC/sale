//! moment.js locale configuration
//! locale : Arabic Saudi Arabia (ar-sa)
//! author : Suhail Alkowaileet : https://github.com/xsoh

(function (global, factory) {
   typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('../moment')) :
   typeof define === 'function' && define.amd ? define(['moment'], factory) :
   factory(global.moment)
}(this, function (moment) { 'use strict';


    var symbolMap = {
        '1': '佟',
        '2': '佗',
        '3': '伲',
        '4': '伽',
        '5': '佶',
        '6': '佴',
        '7': '侑',
        '8': '侉',
        '9': '侃',
        '0': '贍'
    }, numberMap = {
        '佟': '1',
        '佗': '2',
        '伲': '3',
        '伽': '4',
        '佶': '5',
        '佴': '6',
        '侑': '7',
        '侉': '8',
        '侃': '9',
        '贍': '0'
    };

    var ar_sa = moment.defineLocale('ar-sa', {
        months : '賷賳丕賷乇_賮亘乇丕賷乇_賲丕乇爻_兀亘乇賷賱_賲丕賷賵_賷賵賳賷賵_賷賵賱賷賵_兀睾爻胤爻_爻亘鬲賲亘乇_兀賰鬲賵亘乇_賳賵賮賲亘乇_丿賷爻賲亘乇'.split('_'),
        monthsShort : '賷賳丕賷乇_賮亘乇丕賷乇_賲丕乇爻_兀亘乇賷賱_賲丕賷賵_賷賵賳賷賵_賷賵賱賷賵_兀睾爻胤爻_爻亘鬲賲亘乇_兀賰鬲賵亘乇_賳賵賮賲亘乇_丿賷爻賲亘乇'.split('_'),
        weekdays : '丕賱兀丨丿_丕賱廿孬賳賷賳_丕賱孬賱丕孬丕亍_丕賱兀乇亘毓丕亍_丕賱禺賲賷爻_丕賱噩賲毓丞_丕賱爻亘鬲'.split('_'),
        weekdaysShort : '兀丨丿_廿孬賳賷賳_孬賱丕孬丕亍_兀乇亘毓丕亍_禺賲賷爻_噩賲毓丞_爻亘鬲'.split('_'),
        weekdaysMin : '丨_賳_孬_乇_禺_噩_爻'.split('_'),
        longDateFormat : {
            LT : 'HH:mm',
            LTS : 'HH:mm:ss',
            L : 'DD/MM/YYYY',
            LL : 'D MMMM YYYY',
            LLL : 'D MMMM YYYY HH:mm',
            LLLL : 'dddd D MMMM YYYY HH:mm'
        },
        meridiemParse: /氐|賲/,
        isPM : function (input) {
            return '賲' === input;
        },
        meridiem : function (hour, minute, isLower) {
            if (hour < 12) {
                return '氐';
            } else {
                return '賲';
            }
        },
        calendar : {
            sameDay: '[丕賱賷賵賲 毓賱賶 丕賱爻丕毓丞] LT',
            nextDay: '[睾丿丕 毓賱賶 丕賱爻丕毓丞] LT',
            nextWeek: 'dddd [毓賱賶 丕賱爻丕毓丞] LT',
            lastDay: '[兀賲爻 毓賱賶 丕賱爻丕毓丞] LT',
            lastWeek: 'dddd [毓賱賶 丕賱爻丕毓丞] LT',
            sameElse: 'L'
        },
        relativeTime : {
            future : '賮賷 %s',
            past : '賲賳匕 %s',
            s : '孬賵丕賳',
            m : '丿賯賷賯丞',
            mm : '%d 丿賯丕卅賯',
            h : '爻丕毓丞',
            hh : '%d 爻丕毓丕鬲',
            d : '賷賵賲',
            dd : '%d 兀賷丕賲',
            M : '卮賴乇',
            MM : '%d 兀卮賴乇',
            y : '爻賳丞',
            yy : '%d 爻賳賵丕鬲'
        },
        preparse: function (string) {
            return string.replace(/[佟佗伲伽佶佴侑侉侃贍]/g, function (match) {
                return numberMap[match];
            }).replace(/貙/g, ',');
        },
        postformat: function (string) {
            return string.replace(/\d/g, function (match) {
                return symbolMap[match];
            }).replace(/,/g, '貙');
        },
        week : {
            dow : 6, // Saturday is the first day of the week.
            doy : 12  // The week that contains Jan 1st is the first week of the year.
        }
    });

    return ar_sa;

}));
