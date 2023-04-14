//! moment.js locale configuration
//! locale : chuvash (cv)
//! author : Anatoly Mironov : https://github.com/mirontoli

(function (global, factory) {
   typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('../moment')) :
   typeof define === 'function' && define.amd ? define(['moment'], factory) :
   factory(global.moment)
}(this, function (moment) { 'use strict';


    var cv = moment.defineLocale('cv', {
        months : '泻討褉谢邪褔_薪邪褉討褋_锌褍褕_邪泻邪_屑邪泄_耀訔褉褌屑械_褍褌討_耀褍褉谢邪_邪胁討薪_褞锌邪_褔映泻_褉邪褕褌邪胁'.split('_'),
        monthsShort : '泻討褉_薪邪褉_锌褍褕_邪泻邪_屑邪泄_耀訔褉_褍褌討_耀褍褉_邪胁薪_褞锌邪_褔映泻_褉邪褕'.split('_'),
        weekdays : '胁褘褉褋邪褉薪懈泻褍薪_褌褍薪褌懈泻褍薪_褘褌谢邪褉懈泻褍薪_褞薪泻褍薪_泻訔耀薪械褉薪懈泻褍薪_褝褉薪械泻褍薪_褕討屑邪褌泻褍薪'.split('_'),
        weekdaysShort : '胁褘褉_褌褍薪_褘褌谢_褞薪_泻訔耀_褝褉薪_褕討屑'.split('_'),
        weekdaysMin : '胁褉_褌薪_褘褌_褞薪_泻耀_褝褉_褕屑'.split('_'),
        longDateFormat : {
            LT : 'HH:mm',
            LTS : 'HH:mm:ss',
            L : 'DD-MM-YYYY',
            LL : 'YYYY [耀褍谢褏懈] MMMM [褍泄討褏訔薪] D[-屑訔褕訔]',
            LLL : 'YYYY [耀褍谢褏懈] MMMM [褍泄討褏訔薪] D[-屑訔褕訔], HH:mm',
            LLLL : 'dddd, YYYY [耀褍谢褏懈] MMMM [褍泄討褏訔薪] D[-屑訔褕訔], HH:mm'
        },
        calendar : {
            sameDay: '[袩邪褟薪] LT [褋械褏械褌褉械]',
            nextDay: '[蝎褉邪薪] LT [褋械褏械褌褉械]',
            lastDay: '[訓薪械褉] LT [褋械褏械褌褉械]',
            nextWeek: '[要懈褌械褋] dddd LT [褋械褏械褌褉械]',
            lastWeek: '[袠褉褌薪訔] dddd LT [褋械褏械褌褉械]',
            sameElse: 'L'
        },
        relativeTime : {
            future : function (output) {
                var affix = /褋械褏械褌$/i.exec(output) ? '褉械薪' : /耀褍谢$/i.exec(output) ? '褌邪薪' : '褉邪薪';
                return output + affix;
            },
            past : '%s 泻邪褟谢谢邪',
            s : '锌訔褉-懈泻 耀械泻泻褍薪褌',
            m : '锌訔褉 屑懈薪褍褌',
            mm : '%d 屑懈薪褍褌',
            h : '锌訔褉 褋械褏械褌',
            hh : '%d 褋械褏械褌',
            d : '锌訔褉 泻褍薪',
            dd : '%d 泻褍薪',
            M : '锌訔褉 褍泄討褏',
            MM : '%d 褍泄討褏',
            y : '锌訔褉 耀褍谢',
            yy : '%d 耀褍谢'
        },
        ordinalParse: /\d{1,2}-屑訔褕/,
        ordinal : '%d-屑訔褕',
        week : {
            dow : 1, // Monday is the first day of the week.
            doy : 7  // The week that contains Jan 1st is the first week of the year.
        }
    });

    return cv;

}));
