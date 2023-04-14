//! moment.js locale configuration
//! locale : modern greek (el)
//! author : Aggelos Karalias : https://github.com/mehiel

(function (global, factory) {
   typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('../moment')) :
   typeof define === 'function' && define.amd ? define(['moment'], factory) :
   factory(global.moment)
}(this, function (moment) { 'use strict';


    var el = moment.defineLocale('el', {
        monthsNominativeEl : '螜伪谓慰蠀维蟻喂慰蟼_桅蔚尾蟻慰蠀维蟻喂慰蟼_螠维蟻蟿喂慰蟼_螒蟺蟻委位喂慰蟼_螠维喂慰蟼_螜慰蠉谓喂慰蟼_螜慰蠉位喂慰蟼_螒蠉纬慰蠀蟽蟿慰蟼_危蔚蟺蟿苇渭尾蟻喂慰蟼_螣魏蟿蠋尾蟻喂慰蟼_螡慰苇渭尾蟻喂慰蟼_螖蔚魏苇渭尾蟻喂慰蟼'.split('_'),
        monthsGenitiveEl : '螜伪谓慰蠀伪蟻委慰蠀_桅蔚尾蟻慰蠀伪蟻委慰蠀_螠伪蟻蟿委慰蠀_螒蟺蟻喂位委慰蠀_螠伪螑慰蠀_螜慰蠀谓委慰蠀_螜慰蠀位委慰蠀_螒蠀纬慰蠉蟽蟿慰蠀_危蔚蟺蟿蔚渭尾蟻委慰蠀_螣魏蟿蠅尾蟻委慰蠀_螡慰蔚渭尾蟻委慰蠀_螖蔚魏蔚渭尾蟻委慰蠀'.split('_'),
        months : function (momentToFormat, format) {
            if (/D/.test(format.substring(0, format.indexOf('MMMM')))) { // if there is a day number before 'MMMM'
                return this._monthsGenitiveEl[momentToFormat.month()];
            } else {
                return this._monthsNominativeEl[momentToFormat.month()];
            }
        },
        monthsShort : '螜伪谓_桅蔚尾_螠伪蟻_螒蟺蟻_螠伪蠆_螜慰蠀谓_螜慰蠀位_螒蠀纬_危蔚蟺_螣魏蟿_螡慰蔚_螖蔚魏'.split('_'),
        weekdays : '螝蠀蟻喂伪魏萎_螖蔚蠀蟿苇蟻伪_韦蟻委蟿畏_韦蔚蟿维蟻蟿畏_螤苇渭蟺蟿畏_螤伪蟻伪蟽魏蔚蠀萎_危维尾尾伪蟿慰'.split('_'),
        weekdaysShort : '螝蠀蟻_螖蔚蠀_韦蟻喂_韦蔚蟿_螤蔚渭_螤伪蟻_危伪尾'.split('_'),
        weekdaysMin : '螝蠀_螖蔚_韦蟻_韦蔚_螤蔚_螤伪_危伪'.split('_'),
        meridiem : function (hours, minutes, isLower) {
            if (hours > 11) {
                return isLower ? '渭渭' : '螠螠';
            } else {
                return isLower ? '蟺渭' : '螤螠';
            }
        },
        isPM : function (input) {
            return ((input + '').toLowerCase()[0] === '渭');
        },
        meridiemParse : /[螤螠]\.?螠?\.?/i,
        longDateFormat : {
            LT : 'h:mm A',
            LTS : 'h:mm:ss A',
            L : 'DD/MM/YYYY',
            LL : 'D MMMM YYYY',
            LLL : 'D MMMM YYYY h:mm A',
            LLLL : 'dddd, D MMMM YYYY h:mm A'
        },
        calendarEl : {
            sameDay : '[危萎渭蔚蟻伪 {}] LT',
            nextDay : '[螒蠉蟻喂慰 {}] LT',
            nextWeek : 'dddd [{}] LT',
            lastDay : '[围胃蔚蟼 {}] LT',
            lastWeek : function () {
                switch (this.day()) {
                    case 6:
                        return '[蟿慰 蟺蟻慰畏纬慰蠉渭蔚谓慰] dddd [{}] LT';
                    default:
                        return '[蟿畏谓 蟺蟻慰畏纬慰蠉渭蔚谓畏] dddd [{}] LT';
                }
            },
            sameElse : 'L'
        },
        calendar : function (key, mom) {
            var output = this._calendarEl[key],
                hours = mom && mom.hours();
            if (typeof output === 'function') {
                output = output.apply(mom);
            }
            return output.replace('{}', (hours % 12 === 1 ? '蟽蟿畏' : '蟽蟿喂蟼'));
        },
        relativeTime : {
            future : '蟽蔚 %s',
            past : '%s 蟺蟻喂谓',
            s : '位委纬伪 未蔚蠀蟿蔚蟻蠈位蔚蟺蟿伪',
            m : '苇谓伪 位蔚蟺蟿蠈',
            mm : '%d 位蔚蟺蟿维',
            h : '渭委伪 蠋蟻伪',
            hh : '%d 蠋蟻蔚蟼',
            d : '渭委伪 渭苇蟻伪',
            dd : '%d 渭苇蟻蔚蟼',
            M : '苇谓伪蟼 渭萎谓伪蟼',
            MM : '%d 渭萎谓蔚蟼',
            y : '苇谓伪蟼 蠂蟻蠈谓慰蟼',
            yy : '%d 蠂蟻蠈谓喂伪'
        },
        ordinalParse: /\d{1,2}畏/,
        ordinal: '%d畏',
        week : {
            dow : 1, // Monday is the first day of the week.
            doy : 4  // The week that contains Jan 4st is the first week of the year.
        }
    });

    return el;

}));
