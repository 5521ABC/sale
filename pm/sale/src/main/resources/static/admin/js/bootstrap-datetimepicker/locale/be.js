//! moment.js locale configuration
//! locale : belarusian (be)
//! author : Dmitry Demidov : https://github.com/demidov91
//! author: Praleska: http://praleska.pro/
//! Author : Menelion Elens煤le : https://github.com/Oire

(function (global, factory) {
   typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('../moment')) :
   typeof define === 'function' && define.amd ? define(['moment'], factory) :
   factory(global.moment)
}(this, function (moment) { 'use strict';


    function plural(word, num) {
        var forms = word.split('_');
        return num % 10 === 1 && num % 100 !== 11 ? forms[0] : (num % 10 >= 2 && num % 10 <= 4 && (num % 100 < 10 || num % 100 >= 20) ? forms[1] : forms[2]);
    }
    function relativeTimeWithPlural(number, withoutSuffix, key) {
        var format = {
            'mm': withoutSuffix ? '褏胁褨谢褨薪邪_褏胁褨谢褨薪褘_褏胁褨谢褨薪' : '褏胁褨谢褨薪褍_褏胁褨谢褨薪褘_褏胁褨谢褨薪',
            'hh': withoutSuffix ? '谐邪写蟹褨薪邪_谐邪写蟹褨薪褘_谐邪写蟹褨薪' : '谐邪写蟹褨薪褍_谐邪写蟹褨薪褘_谐邪写蟹褨薪',
            'dd': '写蟹械薪褜_写薪褨_写蟹褢薪',
            'MM': '屑械褋褟褑_屑械褋褟褑褘_屑械褋褟褑邪褳',
            'yy': '谐芯写_谐邪写褘_谐邪写芯褳'
        };
        if (key === 'm') {
            return withoutSuffix ? '褏胁褨谢褨薪邪' : '褏胁褨谢褨薪褍';
        }
        else if (key === 'h') {
            return withoutSuffix ? '谐邪写蟹褨薪邪' : '谐邪写蟹褨薪褍';
        }
        else {
            return number + ' ' + plural(format[key], +number);
        }
    }
    function monthsCaseReplace(m, format) {
        var months = {
            'nominative': '褋褌褍写蟹械薪褜_谢褞褌褘_褋邪泻邪胁褨泻_泻褉邪褋邪胁褨泻_褌褉邪胁械薪褜_褔褝褉胁械薪褜_谢褨锌械薪褜_卸薪褨胁械薪褜_胁械褉邪褋械薪褜_泻邪褋褌褉褘褔薪褨泻_谢褨褋褌邪锌邪写_褋薪械卸邪薪褜'.split('_'),
            'accusative': '褋褌褍写蟹械薪褟_谢褞褌邪谐邪_褋邪泻邪胁褨泻邪_泻褉邪褋邪胁褨泻邪_褌褉邪褳薪褟_褔褝褉胁械薪褟_谢褨锌械薪褟_卸薪褨褳薪褟_胁械褉邪褋薪褟_泻邪褋褌褉褘褔薪褨泻邪_谢褨褋褌邪锌邪写邪_褋薪械卸薪褟'.split('_')
        },
        nounCase = (/D[oD]?(\[[^\[\]]*\]|\s+)+MMMM?/).test(format) ?
            'accusative' :
            'nominative';
        return months[nounCase][m.month()];
    }
    function weekdaysCaseReplace(m, format) {
        var weekdays = {
            'nominative': '薪褟写蟹械谢褟_锌邪薪褟写蟹械谢邪泻_邪褳褌芯褉邪泻_褋械褉邪写邪_褔邪褑胁械褉_锌褟褌薪褨褑邪_褋褍斜芯褌邪'.split('_'),
            'accusative': '薪褟写蟹械谢褞_锌邪薪褟写蟹械谢邪泻_邪褳褌芯褉邪泻_褋械褉邪写褍_褔邪褑胁械褉_锌褟褌薪褨褑褍_褋褍斜芯褌褍'.split('_')
        },
        nounCase = (/\[ ?[袙胁] ?(?:屑褨薪褍谢褍褞|薪邪褋褌褍锌薪褍褞)? ?\] ?dddd/).test(format) ?
            'accusative' :
            'nominative';
        return weekdays[nounCase][m.day()];
    }

    var be = moment.defineLocale('be', {
        months : monthsCaseReplace,
        monthsShort : '褋褌褍写_谢褞褌_褋邪泻_泻褉邪褋_褌褉邪胁_褔褝褉胁_谢褨锌_卸薪褨胁_胁械褉_泻邪褋褌_谢褨褋褌_褋薪械卸'.split('_'),
        weekdays : weekdaysCaseReplace,
        weekdaysShort : '薪写_锌薪_邪褌_褋褉_褔褑_锌褌_褋斜'.split('_'),
        weekdaysMin : '薪写_锌薪_邪褌_褋褉_褔褑_锌褌_褋斜'.split('_'),
        longDateFormat : {
            LT : 'HH:mm',
            LTS : 'HH:mm:ss',
            L : 'DD.MM.YYYY',
            LL : 'D MMMM YYYY 谐.',
            LLL : 'D MMMM YYYY 谐., HH:mm',
            LLLL : 'dddd, D MMMM YYYY 谐., HH:mm'
        },
        calendar : {
            sameDay: '[小褢薪薪褟 褳] LT',
            nextDay: '[袟邪褳褌褉邪 褳] LT',
            lastDay: '[校褔芯褉邪 褳] LT',
            nextWeek: function () {
                return '[校] dddd [褳] LT';
            },
            lastWeek: function () {
                switch (this.day()) {
                case 0:
                case 3:
                case 5:
                case 6:
                    return '[校 屑褨薪褍谢褍褞] dddd [褳] LT';
                case 1:
                case 2:
                case 4:
                    return '[校 屑褨薪褍谢褘] dddd [褳] LT';
                }
            },
            sameElse: 'L'
        },
        relativeTime : {
            future : '锌褉邪蟹 %s',
            past : '%s 褌邪屑褍',
            s : '薪械泻邪谢褜泻褨 褋械泻褍薪写',
            m : relativeTimeWithPlural,
            mm : relativeTimeWithPlural,
            h : relativeTimeWithPlural,
            hh : relativeTimeWithPlural,
            d : '写蟹械薪褜',
            dd : relativeTimeWithPlural,
            M : '屑械褋褟褑',
            MM : relativeTimeWithPlural,
            y : '谐芯写',
            yy : relativeTimeWithPlural
        },
        meridiemParse: /薪芯褔褘|褉邪薪褨褑褘|写薪褟|胁械褔邪褉邪/,
        isPM : function (input) {
            return /^(写薪褟|胁械褔邪褉邪)$/.test(input);
        },
        meridiem : function (hour, minute, isLower) {
            if (hour < 4) {
                return '薪芯褔褘';
            } else if (hour < 12) {
                return '褉邪薪褨褑褘';
            } else if (hour < 17) {
                return '写薪褟';
            } else {
                return '胁械褔邪褉邪';
            }
        },
        ordinalParse: /\d{1,2}-(褨|褘|谐邪)/,
        ordinal: function (number, period) {
            switch (period) {
            case 'M':
            case 'd':
            case 'DDD':
            case 'w':
            case 'W':
                return (number % 10 === 2 || number % 10 === 3) && (number % 100 !== 12 && number % 100 !== 13) ? number + '-褨' : number + '-褘';
            case 'D':
                return number + '-谐邪';
            default:
                return number;
            }
        },
        week : {
            dow : 1, // Monday is the first day of the week.
            doy : 7  // The week that contains Jan 1st is the first week of the year.
        }
    });

    return be;

}));
