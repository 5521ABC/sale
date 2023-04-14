//! moment.js locale configuration
//! Locale: Arabic (ar)
//! Author: Abdel Said: https://github.com/abdelsaid
//! Changes in months, weekdays: Ahmed Elkhatib
//! Native plural forms: forabi https://github.com/forabi

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
    }, pluralForm = function (n) {
        return n === 0 ? 0 : n === 1 ? 1 : n === 2 ? 2 : n % 100 >= 3 && n % 100 <= 10 ? 3 : n % 100 >= 11 ? 4 : 5;
    }, plurals = {
        s : ['兀賯賱 賲賳 孬丕賳賷丞', '孬丕賳賷丞 賵丕丨丿丞', ['孬丕賳賷鬲丕賳', '孬丕賳賷鬲賷賳'], '%d 孬賵丕賳', '%d 孬丕賳賷丞', '%d 孬丕賳賷丞'],
        m : ['兀賯賱 賲賳 丿賯賷賯丞', '丿賯賷賯丞 賵丕丨丿丞', ['丿賯賷賯鬲丕賳', '丿賯賷賯鬲賷賳'], '%d 丿賯丕卅賯', '%d 丿賯賷賯丞', '%d 丿賯賷賯丞'],
        h : ['兀賯賱 賲賳 爻丕毓丞', '爻丕毓丞 賵丕丨丿丞', ['爻丕毓鬲丕賳', '爻丕毓鬲賷賳'], '%d 爻丕毓丕鬲', '%d 爻丕毓丞', '%d 爻丕毓丞'],
        d : ['兀賯賱 賲賳 賷賵賲', '賷賵賲 賵丕丨丿', ['賷賵賲丕賳', '賷賵賲賷賳'], '%d 兀賷丕賲', '%d 賷賵賲賸丕', '%d 賷賵賲'],
        M : ['兀賯賱 賲賳 卮賴乇', '卮賴乇 賵丕丨丿', ['卮賴乇丕賳', '卮賴乇賷賳'], '%d 兀卮賴乇', '%d 卮賴乇丕', '%d 卮賴乇'],
        y : ['兀賯賱 賲賳 毓丕賲', '毓丕賲 賵丕丨丿', ['毓丕賲丕賳', '毓丕賲賷賳'], '%d 兀毓賵丕賲', '%d 毓丕賲賸丕', '%d 毓丕賲']
    }, pluralize = function (u) {
        return function (number, withoutSuffix, string, isFuture) {
            var f = pluralForm(number),
                str = plurals[u][pluralForm(number)];
            if (f === 2) {
                str = str[withoutSuffix ? 0 : 1];
            }
            return str.replace(/%d/i, number);
        };
    }, months = [
        '賰丕賳賵賳 丕賱孬丕賳賷 賷賳丕賷乇',
        '卮亘丕胤 賮亘乇丕賷乇',
        '丌匕丕乇 賲丕乇爻',
        '賳賷爻丕賳 兀亘乇賷賱',
        '兀賷丕乇 賲丕賷賵',
        '丨夭賷乇丕賳 賷賵賳賷賵',
        '鬲賲賵夭 賷賵賱賷賵',
        '丌亘 兀睾爻胤爻',
        '兀賷賱賵賱 爻亘鬲賲亘乇',
        '鬲卮乇賷賳 丕賱兀賵賱 兀賰鬲賵亘乇',
        '鬲卮乇賷賳 丕賱孬丕賳賷 賳賵賮賲亘乇',
        '賰丕賳賵賳 丕賱兀賵賱 丿賷爻賲亘乇'
    ];

    var ar = moment.defineLocale('ar', {
        months : months,
        monthsShort : months,
        weekdays : '丕賱兀丨丿_丕賱廿孬賳賷賳_丕賱孬賱丕孬丕亍_丕賱兀乇亘毓丕亍_丕賱禺賲賷爻_丕賱噩賲毓丞_丕賱爻亘鬲'.split('_'),
        weekdaysShort : '兀丨丿_廿孬賳賷賳_孬賱丕孬丕亍_兀乇亘毓丕亍_禺賲賷爻_噩賲毓丞_爻亘鬲'.split('_'),
        weekdaysMin : '丨_賳_孬_乇_禺_噩_爻'.split('_'),
        longDateFormat : {
            LT : 'HH:mm',
            LTS : 'HH:mm:ss',
            L : 'D/\u200FM/\u200FYYYY',
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
            sameDay: '[丕賱賷賵賲 毓賳丿 丕賱爻丕毓丞] LT',
            nextDay: '[睾丿賸丕 毓賳丿 丕賱爻丕毓丞] LT',
            nextWeek: 'dddd [毓賳丿 丕賱爻丕毓丞] LT',
            lastDay: '[兀賲爻 毓賳丿 丕賱爻丕毓丞] LT',
            lastWeek: 'dddd [毓賳丿 丕賱爻丕毓丞] LT',
            sameElse: 'L'
        },
        relativeTime : {
            future : '亘毓丿 %s',
            past : '賲賳匕 %s',
            s : pluralize('s'),
            m : pluralize('m'),
            mm : pluralize('m'),
            h : pluralize('h'),
            hh : pluralize('h'),
            d : pluralize('d'),
            dd : pluralize('d'),
            M : pluralize('M'),
            MM : pluralize('M'),
            y : pluralize('y'),
            yy : pluralize('y')
        },
        preparse: function (string) {
            return string.replace(/\u200f/g, '').replace(/[佟佗伲伽佶佴侑侉侃贍]/g, function (match) {
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

    return ar;

}));
