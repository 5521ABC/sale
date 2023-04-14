//! moment.js locale configuration
//! locale : latvian (lv)
//! author : Kristaps Karlsons : https://github.com/skakri
//! author : J膩nis Elmeris : https://github.com/JanisE

(function (global, factory) {
   typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('../moment')) :
   typeof define === 'function' && define.amd ? define(['moment'], factory) :
   factory(global.moment)
}(this, function (moment) { 'use strict';


    var units = {
        'm': 'min奴tes_min奴t膿m_min奴te_min奴tes'.split('_'),
        'mm': 'min奴tes_min奴t膿m_min奴te_min奴tes'.split('_'),
        'h': 'stundas_stund膩m_stunda_stundas'.split('_'),
        'hh': 'stundas_stund膩m_stunda_stundas'.split('_'),
        'd': 'dienas_dien膩m_diena_dienas'.split('_'),
        'dd': 'dienas_dien膩m_diena_dienas'.split('_'),
        'M': 'm膿ne拧a_m膿ne拧iem_m膿nesis_m膿ne拧i'.split('_'),
        'MM': 'm膿ne拧a_m膿ne拧iem_m膿nesis_m膿ne拧i'.split('_'),
        'y': 'gada_gadiem_gads_gadi'.split('_'),
        'yy': 'gada_gadiem_gads_gadi'.split('_')
    };
    /**
     * @param withoutSuffix boolean true = a length of time; false = before/after a period of time.
     */
    function format(forms, number, withoutSuffix) {
        if (withoutSuffix) {
            // E.g. "21 min奴te", "3 min奴tes".
            return number % 10 === 1 && number !== 11 ? forms[2] : forms[3];
        } else {
            // E.g. "21 min奴tes" as in "p膿c 21 min奴tes".
            // E.g. "3 min奴t膿m" as in "p膿c 3 min奴t膿m".
            return number % 10 === 1 && number !== 11 ? forms[0] : forms[1];
        }
    }
    function relativeTimeWithPlural(number, withoutSuffix, key) {
        return number + ' ' + format(units[key], number, withoutSuffix);
    }
    function relativeTimeWithSingular(number, withoutSuffix, key) {
        return format(units[key], number, withoutSuffix);
    }
    function relativeSeconds(number, withoutSuffix) {
        return withoutSuffix ? 'da啪as sekundes' : 'da啪膩m sekund膿m';
    }

    var lv = moment.defineLocale('lv', {
        months : 'janv膩ris_febru膩ris_marts_apr墨lis_maijs_j奴nijs_j奴lijs_augusts_septembris_oktobris_novembris_decembris'.split('_'),
        monthsShort : 'jan_feb_mar_apr_mai_j奴n_j奴l_aug_sep_okt_nov_dec'.split('_'),
        weekdays : 'sv膿tdiena_pirmdiena_otrdiena_tre拧diena_ceturtdiena_piektdiena_sestdiena'.split('_'),
        weekdaysShort : 'Sv_P_O_T_C_Pk_S'.split('_'),
        weekdaysMin : 'Sv_P_O_T_C_Pk_S'.split('_'),
        longDateFormat : {
            LT : 'HH:mm',
            LTS : 'HH:mm:ss',
            L : 'DD.MM.YYYY.',
            LL : 'YYYY. [gada] D. MMMM',
            LLL : 'YYYY. [gada] D. MMMM, HH:mm',
            LLLL : 'YYYY. [gada] D. MMMM, dddd, HH:mm'
        },
        calendar : {
            sameDay : '[艩odien pulksten] LT',
            nextDay : '[R墨t pulksten] LT',
            nextWeek : 'dddd [pulksten] LT',
            lastDay : '[Vakar pulksten] LT',
            lastWeek : '[Pag膩ju拧膩] dddd [pulksten] LT',
            sameElse : 'L'
        },
        relativeTime : {
            future : 'p膿c %s',
            past : 'pirms %s',
            s : relativeSeconds,
            m : relativeTimeWithSingular,
            mm : relativeTimeWithPlural,
            h : relativeTimeWithSingular,
            hh : relativeTimeWithPlural,
            d : relativeTimeWithSingular,
            dd : relativeTimeWithPlural,
            M : relativeTimeWithSingular,
            MM : relativeTimeWithPlural,
            y : relativeTimeWithSingular,
            yy : relativeTimeWithPlural
        },
        ordinalParse: /\d{1,2}\./,
        ordinal : '%d.',
        week : {
            dow : 1, // Monday is the first day of the week.
            doy : 4  // The week that contains Jan 4th is the first week of the year.
        }
    });

    return lv;

}));
