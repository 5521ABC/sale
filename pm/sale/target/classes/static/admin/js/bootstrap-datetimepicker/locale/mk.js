//! moment.js locale configuration
//! locale : macedonian (mk)
//! author : Borislav Mickov : https://github.com/B0k0

(function (global, factory) {
   typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('../moment')) :
   typeof define === 'function' && define.amd ? define(['moment'], factory) :
   factory(global.moment)
}(this, function (moment) { 'use strict';


    var mk = moment.defineLocale('mk', {
        months : '褬邪薪褍邪褉懈_褎械胁褉褍邪褉懈_屑邪褉褌_邪锌褉懈谢_屑邪褬_褬褍薪懈_褬褍谢懈_邪胁谐褍褋褌_褋械锌褌械屑胁褉懈_芯泻褌芯屑胁褉懈_薪芯械屑胁褉懈_写械泻械屑胁褉懈'.split('_'),
        monthsShort : '褬邪薪_褎械胁_屑邪褉_邪锌褉_屑邪褬_褬褍薪_褬褍谢_邪胁谐_褋械锌_芯泻褌_薪芯械_写械泻'.split('_'),
        weekdays : '薪械写械谢邪_锌芯薪械写械谢薪懈泻_胁褌芯褉薪懈泻_褋褉械写邪_褔械褌胁褉褌芯泻_锌械褌芯泻_褋邪斜芯褌邪'.split('_'),
        weekdaysShort : '薪械写_锌芯薪_胁褌芯_褋褉械_褔械褌_锌械褌_褋邪斜'.split('_'),
        weekdaysMin : '薪e_锌o_胁褌_褋褉_褔械_锌械_褋a'.split('_'),
        longDateFormat : {
            LT : 'H:mm',
            LTS : 'H:mm:ss',
            L : 'D.MM.YYYY',
            LL : 'D MMMM YYYY',
            LLL : 'D MMMM YYYY H:mm',
            LLLL : 'dddd, D MMMM YYYY H:mm'
        },
        calendar : {
            sameDay : '[袛械薪械褋 胁芯] LT',
            nextDay : '[校褌褉械 胁芯] LT',
            nextWeek : 'dddd [胁芯] LT',
            lastDay : '[袙褔械褉邪 胁芯] LT',
            lastWeek : function () {
                switch (this.day()) {
                case 0:
                case 3:
                case 6:
                    return '[袙芯 懈蟹屑懈薪邪褌邪褌邪] dddd [胁芯] LT';
                case 1:
                case 2:
                case 4:
                case 5:
                    return '[袙芯 懈蟹屑懈薪邪褌懈芯褌] dddd [胁芯] LT';
                }
            },
            sameElse : 'L'
        },
        relativeTime : {
            future : '锌芯褋谢械 %s',
            past : '锌褉械写 %s',
            s : '薪械泻芯谢泻褍 褋械泻褍薪写懈',
            m : '屑懈薪褍褌邪',
            mm : '%d 屑懈薪褍褌懈',
            h : '褔邪褋',
            hh : '%d 褔邪褋邪',
            d : '写械薪',
            dd : '%d 写械薪邪',
            M : '屑械褋械褑',
            MM : '%d 屑械褋械褑懈',
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

    return mk;

}));
