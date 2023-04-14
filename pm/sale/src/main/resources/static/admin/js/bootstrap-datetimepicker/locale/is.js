//! moment.js locale configuration
//! locale : icelandic (is)
//! author : Hinrik 脰rn Sigur冒sson : https://github.com/hinrik

(function (global, factory) {
   typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('../moment')) :
   typeof define === 'function' && define.amd ? define(['moment'], factory) :
   factory(global.moment)
}(this, function (moment) { 'use strict';


    function plural(n) {
        if (n % 100 === 11) {
            return true;
        } else if (n % 10 === 1) {
            return false;
        }
        return true;
    }
    function translate(number, withoutSuffix, key, isFuture) {
        var result = number + ' ';
        switch (key) {
        case 's':
            return withoutSuffix || isFuture ? 'nokkrar sek煤ndur' : 'nokkrum sek煤ndum';
        case 'm':
            return withoutSuffix ? 'm铆n煤ta' : 'm铆n煤tu';
        case 'mm':
            if (plural(number)) {
                return result + (withoutSuffix || isFuture ? 'm铆n煤tur' : 'm铆n煤tum');
            } else if (withoutSuffix) {
                return result + 'm铆n煤ta';
            }
            return result + 'm铆n煤tu';
        case 'hh':
            if (plural(number)) {
                return result + (withoutSuffix || isFuture ? 'klukkustundir' : 'klukkustundum');
            }
            return result + 'klukkustund';
        case 'd':
            if (withoutSuffix) {
                return 'dagur';
            }
            return isFuture ? 'dag' : 'degi';
        case 'dd':
            if (plural(number)) {
                if (withoutSuffix) {
                    return result + 'dagar';
                }
                return result + (isFuture ? 'daga' : 'd枚gum');
            } else if (withoutSuffix) {
                return result + 'dagur';
            }
            return result + (isFuture ? 'dag' : 'degi');
        case 'M':
            if (withoutSuffix) {
                return 'm谩nu冒ur';
            }
            return isFuture ? 'm谩nu冒' : 'm谩nu冒i';
        case 'MM':
            if (plural(number)) {
                if (withoutSuffix) {
                    return result + 'm谩nu冒ir';
                }
                return result + (isFuture ? 'm谩nu冒i' : 'm谩nu冒um');
            } else if (withoutSuffix) {
                return result + 'm谩nu冒ur';
            }
            return result + (isFuture ? 'm谩nu冒' : 'm谩nu冒i');
        case 'y':
            return withoutSuffix || isFuture ? '谩r' : '谩ri';
        case 'yy':
            if (plural(number)) {
                return result + (withoutSuffix || isFuture ? '谩r' : '谩rum');
            }
            return result + (withoutSuffix || isFuture ? '谩r' : '谩ri');
        }
    }

    var is = moment.defineLocale('is', {
        months : 'jan煤ar_febr煤ar_mars_apr铆l_ma铆_j煤n铆_j煤l铆_谩g煤st_september_okt贸ber_n贸vember_desember'.split('_'),
        monthsShort : 'jan_feb_mar_apr_ma铆_j煤n_j煤l_谩g煤_sep_okt_n贸v_des'.split('_'),
        weekdays : 'sunnudagur_m谩nudagur_镁ri冒judagur_mi冒vikudagur_fimmtudagur_f枚studagur_laugardagur'.split('_'),
        weekdaysShort : 'sun_m谩n_镁ri_mi冒_fim_f枚s_lau'.split('_'),
        weekdaysMin : 'Su_M谩_脼r_Mi_Fi_F枚_La'.split('_'),
        longDateFormat : {
            LT : 'H:mm',
            LTS : 'H:mm:ss',
            L : 'DD/MM/YYYY',
            LL : 'D. MMMM YYYY',
            LLL : 'D. MMMM YYYY [kl.] H:mm',
            LLLL : 'dddd, D. MMMM YYYY [kl.] H:mm'
        },
        calendar : {
            sameDay : '[铆 dag kl.] LT',
            nextDay : '[谩 morgun kl.] LT',
            nextWeek : 'dddd [kl.] LT',
            lastDay : '[铆 g忙r kl.] LT',
            lastWeek : '[s铆冒asta] dddd [kl.] LT',
            sameElse : 'L'
        },
        relativeTime : {
            future : 'eftir %s',
            past : 'fyrir %s s铆冒an',
            s : translate,
            m : translate,
            mm : translate,
            h : 'klukkustund',
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
            doy : 4  // The week that contains Jan 4th is the first week of the year.
        }
    });

    return is;

}));
