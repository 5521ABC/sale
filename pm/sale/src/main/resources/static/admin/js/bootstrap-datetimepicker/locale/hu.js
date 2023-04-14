//! moment.js locale configuration
//! locale : hungarian (hu)
//! author : Adam Brunner : https://github.com/adambrunner

(function (global, factory) {
   typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('../moment')) :
   typeof define === 'function' && define.amd ? define(['moment'], factory) :
   factory(global.moment)
}(this, function (moment) { 'use strict';


    var weekEndings = 'vas谩rnap h茅tf艖n kedden szerd谩n cs眉t枚rt枚k枚n p茅nteken szombaton'.split(' ');
    function translate(number, withoutSuffix, key, isFuture) {
        var num = number,
            suffix;
        switch (key) {
        case 's':
            return (isFuture || withoutSuffix) ? 'n茅h谩ny m谩sodperc' : 'n茅h谩ny m谩sodperce';
        case 'm':
            return 'egy' + (isFuture || withoutSuffix ? ' perc' : ' perce');
        case 'mm':
            return num + (isFuture || withoutSuffix ? ' perc' : ' perce');
        case 'h':
            return 'egy' + (isFuture || withoutSuffix ? ' 贸ra' : ' 贸r谩ja');
        case 'hh':
            return num + (isFuture || withoutSuffix ? ' 贸ra' : ' 贸r谩ja');
        case 'd':
            return 'egy' + (isFuture || withoutSuffix ? ' nap' : ' napja');
        case 'dd':
            return num + (isFuture || withoutSuffix ? ' nap' : ' napja');
        case 'M':
            return 'egy' + (isFuture || withoutSuffix ? ' h贸nap' : ' h贸napja');
        case 'MM':
            return num + (isFuture || withoutSuffix ? ' h贸nap' : ' h贸napja');
        case 'y':
            return 'egy' + (isFuture || withoutSuffix ? ' 茅v' : ' 茅ve');
        case 'yy':
            return num + (isFuture || withoutSuffix ? ' 茅v' : ' 茅ve');
        }
        return '';
    }
    function week(isFuture) {
        return (isFuture ? '' : '[m煤lt] ') + '[' + weekEndings[this.day()] + '] LT[-kor]';
    }

    var hu = moment.defineLocale('hu', {
        months : 'janu谩r_febru谩r_m谩rcius_谩prilis_m谩jus_j煤nius_j煤lius_augusztus_szeptember_okt贸ber_november_december'.split('_'),
        monthsShort : 'jan_feb_m谩rc_谩pr_m谩j_j煤n_j煤l_aug_szept_okt_nov_dec'.split('_'),
        weekdays : 'vas谩rnap_h茅tf艖_kedd_szerda_cs眉t枚rt枚k_p茅ntek_szombat'.split('_'),
        weekdaysShort : 'vas_h茅t_kedd_sze_cs眉t_p茅n_szo'.split('_'),
        weekdaysMin : 'v_h_k_sze_cs_p_szo'.split('_'),
        longDateFormat : {
            LT : 'H:mm',
            LTS : 'H:mm:ss',
            L : 'YYYY.MM.DD.',
            LL : 'YYYY. MMMM D.',
            LLL : 'YYYY. MMMM D. H:mm',
            LLLL : 'YYYY. MMMM D., dddd H:mm'
        },
        meridiemParse: /de|du/i,
        isPM: function (input) {
            return input.charAt(1).toLowerCase() === 'u';
        },
        meridiem : function (hours, minutes, isLower) {
            if (hours < 12) {
                return isLower === true ? 'de' : 'DE';
            } else {
                return isLower === true ? 'du' : 'DU';
            }
        },
        calendar : {
            sameDay : '[ma] LT[-kor]',
            nextDay : '[holnap] LT[-kor]',
            nextWeek : function () {
                return week.call(this, true);
            },
            lastDay : '[tegnap] LT[-kor]',
            lastWeek : function () {
                return week.call(this, false);
            },
            sameElse : 'L'
        },
        relativeTime : {
            future : '%s m煤lva',
            past : '%s',
            s : translate,
            m : translate,
            mm : translate,
            h : translate,
            hh : translate,
            d : translate,
            dd : translate,
            M : translate,
            MM : translate,
            y : translate,
            yy : translate
        },
        ordinalParse: /\d{1,2}\./,
        ordinal : '%d.',
        week : {
            dow : 1, // Monday is the first day of the week.
            doy : 7  // The week that contains Jan 1st is the first week of the year.
        }
    });

    return hu;

}));
