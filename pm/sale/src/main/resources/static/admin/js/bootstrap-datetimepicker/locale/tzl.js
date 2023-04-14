//! moment.js locale configuration
//! locale : talossan (tzl)
//! author : Robin van der Vliet : https://github.com/robin0van0der0v with the help of Iust矛 Canun

(function (global, factory) {
   typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('../moment')) :
   typeof define === 'function' && define.amd ? define(['moment'], factory) :
   factory(global.moment)
}(this, function (moment) { 'use strict';



    var tzl = moment.defineLocale('tzl', {
        months : 'Januar_Fevraglh_Mar莽_Avr茂u_Mai_G眉n_Julia_Guscht_Setemvar_Listop盲ts_Noemvar_Zecemvar'.split('_'),
        monthsShort : 'Jan_Fev_Mar_Avr_Mai_G眉n_Jul_Gus_Set_Lis_Noe_Zec'.split('_'),
        weekdays : 'S煤ladi_L煤ne莽i_Maitzi_M谩rcuri_Xh煤adi_Vi茅ner莽i_S谩turi'.split('_'),
        weekdaysShort : 'S煤l_L煤n_Mai_M谩r_Xh煤_Vi茅_S谩t'.split('_'),
        weekdaysMin : 'S煤_L煤_Ma_M谩_Xh_Vi_S谩'.split('_'),
        longDateFormat : {
            LT : 'HH.mm',
            LTS : 'LT.ss',
            L : 'DD.MM.YYYY',
            LL : 'D. MMMM [dallas] YYYY',
            LLL : 'D. MMMM [dallas] YYYY LT',
            LLLL : 'dddd, [li] D. MMMM [dallas] YYYY LT'
        },
        meridiem : function (hours, minutes, isLower) {
            if (hours > 11) {
                return isLower ? 'd\'o' : 'D\'O';
            } else {
                return isLower ? 'd\'a' : 'D\'A';
            }
        },
        calendar : {
            sameDay : '[oxhi 脿] LT',
            nextDay : '[dem脿 脿] LT',
            nextWeek : 'dddd [脿] LT',
            lastDay : '[ieiri 脿] LT',
            lastWeek : '[s眉r el] dddd [lasteu 脿] LT',
            sameElse : 'L'
        },
        relativeTime : {
            future : 'osprei %s',
            past : 'ja%s',
            s : processRelativeTime,
            m : processRelativeTime,
            mm : processRelativeTime,
            h : processRelativeTime,
            hh : processRelativeTime,
            d : processRelativeTime,
            dd : processRelativeTime,
            M : processRelativeTime,
            MM : processRelativeTime,
            y : processRelativeTime,
            yy : processRelativeTime
        },
        ordinalParse: /\d{1,2}\./,
        ordinal : '%d.',
        week : {
            dow : 1, // Monday is the first day of the week.
            doy : 4  // The week that contains Jan 4th is the first week of the year.
        }
    });

    function processRelativeTime(number, withoutSuffix, key, isFuture) {
        var format = {
            's': ['viensas secunds', '\'iensas secunds'],
            'm': ['\'n m铆ut', '\'iens m铆ut'],
            'mm': [number + ' m铆uts', ' ' + number + ' m铆uts'],
            'h': ['\'n 镁ora', '\'iensa 镁ora'],
            'hh': [number + ' 镁oras', ' ' + number + ' 镁oras'],
            'd': ['\'n ziua', '\'iensa ziua'],
            'dd': [number + ' ziuas', ' ' + number + ' ziuas'],
            'M': ['\'n mes', '\'iens mes'],
            'MM': [number + ' mesen', ' ' + number + ' mesen'],
            'y': ['\'n ar', '\'iens ar'],
            'yy': [number + ' ars', ' ' + number + ' ars']
        };
        return isFuture ? format[key][0] : (withoutSuffix ? format[key][0] : format[key][1].trim());
    }

    return tzl;

}));
