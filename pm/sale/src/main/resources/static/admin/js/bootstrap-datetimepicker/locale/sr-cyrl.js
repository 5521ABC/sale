//! moment.js locale configuration
//! locale : Serbian-cyrillic (sr-cyrl)
//! author : Milan Jana膷kovi膰<milanjanackovic@gmail.com> : https://github.com/milan-j

(function (global, factory) {
   typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('../moment')) :
   typeof define === 'function' && define.amd ? define(['moment'], factory) :
   factory(global.moment)
}(this, function (moment) { 'use strict';


    var translator = {
        words: { //Different grammatical cases
            m: ['褬械写邪薪 屑懈薪褍褌', '褬械写薪械 屑懈薪褍褌械'],
            mm: ['屑懈薪褍褌', '屑懈薪褍褌械', '屑懈薪褍褌邪'],
            h: ['褬械写邪薪 褋邪褌', '褬械写薪芯谐 褋邪褌邪'],
            hh: ['褋邪褌', '褋邪褌邪', '褋邪褌懈'],
            dd: ['写邪薪', '写邪薪邪', '写邪薪邪'],
            MM: ['屑械褋械褑', '屑械褋械褑邪', '屑械褋械褑懈'],
            yy: ['谐芯写懈薪邪', '谐芯写懈薪械', '谐芯写懈薪邪']
        },
        correctGrammaticalCase: function (number, wordKey) {
            return number === 1 ? wordKey[0] : (number >= 2 && number <= 4 ? wordKey[1] : wordKey[2]);
        },
        translate: function (number, withoutSuffix, key) {
            var wordKey = translator.words[key];
            if (key.length === 1) {
                return withoutSuffix ? wordKey[0] : wordKey[1];
            } else {
                return number + ' ' + translator.correctGrammaticalCase(number, wordKey);
            }
        }
    };

    var sr_cyrl = moment.defineLocale('sr-cyrl', {
        months: ['褬邪薪褍邪褉', '褎械斜褉褍邪褉', '屑邪褉褌', '邪锌褉懈谢', '屑邪褬', '褬褍薪', '褬褍谢', '邪胁谐褍褋褌', '褋械锌褌械屑斜邪褉', '芯泻褌芯斜邪褉', '薪芯胁械屑斜邪褉', '写械褑械屑斜邪褉'],
        monthsShort: ['褬邪薪.', '褎械斜.', '屑邪褉.', '邪锌褉.', '屑邪褬', '褬褍薪', '褬褍谢', '邪胁谐.', '褋械锌.', '芯泻褌.', '薪芯胁.', '写械褑.'],
        weekdays: ['薪械写械褭邪', '锌芯薪械写械褭邪泻', '褍褌芯褉邪泻', '褋褉械写邪', '褔械褌胁褉褌邪泻', '锌械褌邪泻', '褋褍斜芯褌邪'],
        weekdaysShort: ['薪械写.', '锌芯薪.', '褍褌芯.', '褋褉械.', '褔械褌.', '锌械褌.', '褋褍斜.'],
        weekdaysMin: ['薪械', '锌芯', '褍褌', '褋褉', '褔械', '锌械', '褋褍'],
        longDateFormat: {
            LT: 'H:mm',
            LTS : 'H:mm:ss',
            L: 'DD. MM. YYYY',
            LL: 'D. MMMM YYYY',
            LLL: 'D. MMMM YYYY H:mm',
            LLLL: 'dddd, D. MMMM YYYY H:mm'
        },
        calendar: {
            sameDay: '[写邪薪邪褋 褍] LT',
            nextDay: '[褋褍褌褉邪 褍] LT',
            nextWeek: function () {
                switch (this.day()) {
                case 0:
                    return '[褍] [薪械写械褭褍] [褍] LT';
                case 3:
                    return '[褍] [褋褉械写褍] [褍] LT';
                case 6:
                    return '[褍] [褋褍斜芯褌褍] [褍] LT';
                case 1:
                case 2:
                case 4:
                case 5:
                    return '[褍] dddd [褍] LT';
                }
            },
            lastDay  : '[褬褍褔械 褍] LT',
            lastWeek : function () {
                var lastWeekDays = [
                    '[锌褉芯褕谢械] [薪械写械褭械] [褍] LT',
                    '[锌褉芯褕谢芯谐] [锌芯薪械写械褭泻邪] [褍] LT',
                    '[锌褉芯褕谢芯谐] [褍褌芯褉泻邪] [褍] LT',
                    '[锌褉芯褕谢械] [褋褉械写械] [褍] LT',
                    '[锌褉芯褕谢芯谐] [褔械褌胁褉褌泻邪] [褍] LT',
                    '[锌褉芯褕谢芯谐] [锌械褌泻邪] [褍] LT',
                    '[锌褉芯褕谢械] [褋褍斜芯褌械] [褍] LT'
                ];
                return lastWeekDays[this.day()];
            },
            sameElse : 'L'
        },
        relativeTime : {
            future : '蟹邪 %s',
            past   : '锌褉械 %s',
            s      : '薪械泻芯谢懈泻芯 褋械泻褍薪写懈',
            m      : translator.translate,
            mm     : translator.translate,
            h      : translator.translate,
            hh     : translator.translate,
            d      : '写邪薪',
            dd     : translator.translate,
            M      : '屑械褋械褑',
            MM     : translator.translate,
            y      : '谐芯写懈薪褍',
            yy     : translator.translate
        },
        ordinalParse: /\d{1,2}\./,
        ordinal : '%d.',
        week : {
            dow : 1, // Monday is the first day of the week.
            doy : 7  // The week that contains Jan 1st is the first week of the year.
        }
    });

    return sr_cyrl;

}));
