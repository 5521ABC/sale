//! moment.js locale configuration
//! locale : bulgarian (bg)
//! author : Krasen Borisov : https://github.com/kraz

(function (global, factory) {
   typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('../moment')) :
   typeof define === 'function' && define.amd ? define(['moment'], factory) :
   factory(global.moment)
}(this, function (moment) { 'use strict';


    var bg = moment.defineLocale('bg', {
        months : '褟薪褍邪褉懈_褎械胁褉褍邪褉懈_屑邪褉褌_邪锌褉懈谢_屑邪泄_褞薪懈_褞谢懈_邪胁谐褍褋褌_褋械锌褌械屑胁褉懈_芯泻褌芯屑胁褉懈_薪芯械屑胁褉懈_写械泻械屑胁褉懈'.split('_'),
        monthsShort : '褟薪褉_褎械胁_屑邪褉_邪锌褉_屑邪泄_褞薪懈_褞谢懈_邪胁谐_褋械锌_芯泻褌_薪芯械_写械泻'.split('_'),
        weekdays : '薪械写械谢褟_锌芯薪械写械谢薪懈泻_胁褌芯褉薪懈泻_褋褉褟写邪_褔械褌胁褗褉褌褗泻_锌械褌褗泻_褋褗斜芯褌邪'.split('_'),
        weekdaysShort : '薪械写_锌芯薪_胁褌芯_褋褉褟_褔械褌_锌械褌_褋褗斜'.split('_'),
        weekdaysMin : '薪写_锌薪_胁褌_褋褉_褔褌_锌褌_褋斜'.split('_'),
        longDateFormat : {
            LT : 'H:mm',
            LTS : 'H:mm:ss',
            L : 'D.MM.YYYY',
            LL : 'D MMMM YYYY',
            LLL : 'D MMMM YYYY H:mm',
            LLLL : 'dddd, D MMMM YYYY H:mm'
        },
        calendar : {
            sameDay : '[袛薪械褋 胁] LT',
            nextDay : '[校褌褉械 胁] LT',
            nextWeek : 'dddd [胁] LT',
            lastDay : '[袙褔械褉邪 胁] LT',
            lastWeek : function () {
                switch (this.day()) {
                case 0:
                case 3:
                case 6:
                    return '[袙 懈蟹屑懈薪邪谢邪褌邪] dddd [胁] LT';
                case 1:
                case 2:
                case 4:
                case 5:
                    return '[袙 懈蟹屑懈薪邪谢懈褟] dddd [胁] LT';
                }
            },
            sameElse : 'L'
        },
        relativeTime : {
            future : '褋谢械写 %s',
            past : '锌褉械写懈 %s',
            s : '薪褟泻芯谢泻芯 褋械泻褍薪写懈',
            m : '屑懈薪褍褌邪',
            mm : '%d 屑懈薪褍褌懈',
            h : '褔邪褋',
            hh : '%d 褔邪褋邪',
            d : '写械薪',
            dd : '%d 写薪懈',
            M : '屑械褋械褑',
            MM : '%d 屑械褋械褑邪',
            y : '谐芯写懈薪邪',
            yy : '%d 谐芯写懈薪懈'
        },
        ordinalParse: /\d{1,2}-(械胁|械薪|褌懈|胁懈|褉懈|屑懈)/,
        ordinal : function (number) {
            var lastDigit = number % 10,
                last2Digits = number % 100;
            if (number === 0) {
                return number + '-械胁';
            } else if (last2Digits === 0) {
                return number + '-械薪';
            } else if (last2Digits > 10 && last2Digits < 20) {
                return number + '-褌懈';
            } else if (lastDigit === 1) {
                return number + '-胁懈';
            } else if (lastDigit === 2) {
                return number + '-褉懈';
            } else if (lastDigit === 7 || lastDigit === 8) {
                return number + '-屑懈';
            } else {
                return number + '-褌懈';
            }
        },
        week : {
            dow : 1, // Monday is the first day of the week.
            doy : 7  // The week that contains Jan 1st is the first week of the year.
        }
    });

    return bg;

}));
