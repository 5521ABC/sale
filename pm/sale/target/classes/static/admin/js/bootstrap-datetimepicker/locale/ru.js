//! moment.js locale configuration
//! locale : russian (ru)
//! author : Viktorminator : https://github.com/Viktorminator
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
            'mm': withoutSuffix ? '屑懈薪褍褌邪_屑懈薪褍褌褘_屑懈薪褍褌' : '屑懈薪褍褌褍_屑懈薪褍褌褘_屑懈薪褍褌',
            'hh': '褔邪褋_褔邪褋邪_褔邪褋芯胁',
            'dd': '写械薪褜_写薪褟_写薪械泄',
            'MM': '屑械褋褟褑_屑械褋褟褑邪_屑械褋褟褑械胁',
            'yy': '谐芯写_谐芯写邪_谢械褌'
        };
        if (key === 'm') {
            return withoutSuffix ? '屑懈薪褍褌邪' : '屑懈薪褍褌褍';
        }
        else {
            return number + ' ' + plural(format[key], +number);
        }
    }
    function monthsCaseReplace(m, format) {
        var months = {
            'nominative': '褟薪胁邪褉褜_褎械胁褉邪谢褜_屑邪褉褌_邪锌褉械谢褜_屑邪泄_懈褞薪褜_懈褞谢褜_邪胁谐褍褋褌_褋械薪褌褟斜褉褜_芯泻褌褟斜褉褜_薪芯褟斜褉褜_写械泻邪斜褉褜'.split('_'),
            'accusative': '褟薪胁邪褉褟_褎械胁褉邪谢褟_屑邪褉褌邪_邪锌褉械谢褟_屑邪褟_懈褞薪褟_懈褞谢褟_邪胁谐褍褋褌邪_褋械薪褌褟斜褉褟_芯泻褌褟斜褉褟_薪芯褟斜褉褟_写械泻邪斜褉褟'.split('_')
        },
        nounCase = (/D[oD]?(\[[^\[\]]*\]|\s+)+MMMM?/).test(format) ?
            'accusative' :
            'nominative';
        return months[nounCase][m.month()];
    }
    function monthsShortCaseReplace(m, format) {
        var monthsShort = {
            'nominative': '褟薪胁_褎械胁_屑邪褉褌_邪锌褉_屑邪泄_懈褞薪褜_懈褞谢褜_邪胁谐_褋械薪_芯泻褌_薪芯褟_写械泻'.split('_'),
            'accusative': '褟薪胁_褎械胁_屑邪褉_邪锌褉_屑邪褟_懈褞薪褟_懈褞谢褟_邪胁谐_褋械薪_芯泻褌_薪芯褟_写械泻'.split('_')
        },
        nounCase = (/D[oD]?(\[[^\[\]]*\]|\s+)+MMMM?/).test(format) ?
            'accusative' :
            'nominative';
        return monthsShort[nounCase][m.month()];
    }
    function weekdaysCaseReplace(m, format) {
        var weekdays = {
            'nominative': '胁芯褋泻褉械褋械薪褜械_锌芯薪械写械谢褜薪懈泻_胁褌芯褉薪懈泻_褋褉械写邪_褔械褌胁械褉谐_锌褟褌薪懈褑邪_褋褍斜斜芯褌邪'.split('_'),
            'accusative': '胁芯褋泻褉械褋械薪褜械_锌芯薪械写械谢褜薪懈泻_胁褌芯褉薪懈泻_褋褉械写褍_褔械褌胁械褉谐_锌褟褌薪懈褑褍_褋褍斜斜芯褌褍'.split('_')
        },
        nounCase = (/\[ ?[袙胁] ?(?:锌褉芯褕谢褍褞|褋谢械写褍褞褖褍褞|褝褌褍)? ?\] ?dddd/).test(format) ?
            'accusative' :
            'nominative';
        return weekdays[nounCase][m.day()];
    }

    var ru = moment.defineLocale('ru', {
        months : monthsCaseReplace,
        monthsShort : monthsShortCaseReplace,
        weekdays : weekdaysCaseReplace,
        weekdaysShort : '胁褋_锌薪_胁褌_褋褉_褔褌_锌褌_褋斜'.split('_'),
        weekdaysMin : '胁褋_锌薪_胁褌_褋褉_褔褌_锌褌_褋斜'.split('_'),
        monthsParse : [/^褟薪胁/i, /^褎械胁/i, /^屑邪褉/i, /^邪锌褉/i, /^屑邪[泄|褟]/i, /^懈褞薪/i, /^懈褞谢/i, /^邪胁谐/i, /^褋械薪/i, /^芯泻褌/i, /^薪芯褟/i, /^写械泻/i],
        longDateFormat : {
            LT : 'HH:mm',
            LTS : 'HH:mm:ss',
            L : 'DD.MM.YYYY',
            LL : 'D MMMM YYYY 谐.',
            LLL : 'D MMMM YYYY 谐., HH:mm',
            LLLL : 'dddd, D MMMM YYYY 谐., HH:mm'
        },
        calendar : {
            sameDay: '[小械谐芯写薪褟 胁] LT',
            nextDay: '[袟邪胁褌褉邪 胁] LT',
            lastDay: '[袙褔械褉邪 胁] LT',
            nextWeek: function () {
                return this.day() === 2 ? '[袙芯] dddd [胁] LT' : '[袙] dddd [胁] LT';
            },
            lastWeek: function (now) {
                if (now.week() !== this.week()) {
                    switch (this.day()) {
                    case 0:
                        return '[袙 锌褉芯褕谢芯械] dddd [胁] LT';
                    case 1:
                    case 2:
                    case 4:
                        return '[袙 锌褉芯褕谢褘泄] dddd [胁] LT';
                    case 3:
                    case 5:
                    case 6:
                        return '[袙 锌褉芯褕谢褍褞] dddd [胁] LT';
                    }
                } else {
                    if (this.day() === 2) {
                        return '[袙芯] dddd [胁] LT';
                    } else {
                        return '[袙] dddd [胁] LT';
                    }
                }
            },
            sameElse: 'L'
        },
        relativeTime : {
            future : '褔械褉械蟹 %s',
            past : '%s 薪邪蟹邪写',
            s : '薪械褋泻芯谢褜泻芯 褋械泻褍薪写',
            m : relativeTimeWithPlural,
            mm : relativeTimeWithPlural,
            h : '褔邪褋',
            hh : relativeTimeWithPlural,
            d : '写械薪褜',
            dd : relativeTimeWithPlural,
            M : '屑械褋褟褑',
            MM : relativeTimeWithPlural,
            y : '谐芯写',
            yy : relativeTimeWithPlural
        },
        meridiemParse: /薪芯褔懈|褍褌褉邪|写薪褟|胁械褔械褉邪/i,
        isPM : function (input) {
            return /^(写薪褟|胁械褔械褉邪)$/.test(input);
        },
        meridiem : function (hour, minute, isLower) {
            if (hour < 4) {
                return '薪芯褔懈';
            } else if (hour < 12) {
                return '褍褌褉邪';
            } else if (hour < 17) {
                return '写薪褟';
            } else {
                return '胁械褔械褉邪';
            }
        },
        ordinalParse: /\d{1,2}-(泄|谐芯|褟)/,
        ordinal: function (number, period) {
            switch (period) {
            case 'M':
            case 'd':
            case 'DDD':
                return number + '-泄';
            case 'D':
                return number + '-谐芯';
            case 'w':
            case 'W':
                return number + '-褟';
            default:
                return number;
            }
        },
        week : {
            dow : 1, // Monday is the first day of the week.
            doy : 7  // The week that contains Jan 1st is the first week of the year.
        }
    });

    return ru;

}));
