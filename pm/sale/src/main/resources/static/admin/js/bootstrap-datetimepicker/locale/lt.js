//! moment.js locale configuration
//! locale : Lithuanian (lt)
//! author : Mindaugas Moz奴ras : https://github.com/mmozuras

(function (global, factory) {
   typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('../moment')) :
   typeof define === 'function' && define.amd ? define(['moment'], factory) :
   factory(global.moment)
}(this, function (moment) { 'use strict';


    var units = {
        'm' : 'minut臈_minut臈s_minut臋',
        'mm': 'minut臈s_minu膷i懦_minutes',
        'h' : 'valanda_valandos_valand膮',
        'hh': 'valandos_valand懦_valandas',
        'd' : 'diena_dienos_dien膮',
        'dd': 'dienos_dien懦_dienas',
        'M' : 'm臈nuo_m臈nesio_m臈nes寞',
        'MM': 'm臈nesiai_m臈nesi懦_m臈nesius',
        'y' : 'metai_met懦_metus',
        'yy': 'metai_met懦_metus'
    },
    weekDays = 'sekmadienis_pirmadienis_antradienis_tre膷iadienis_ketvirtadienis_penktadienis_拧e拧tadienis'.split('_');
    function translateSeconds(number, withoutSuffix, key, isFuture) {
        if (withoutSuffix) {
            return 'kelios sekund臈s';
        } else {
            return isFuture ? 'keli懦 sekund啪i懦' : 'kelias sekundes';
        }
    }
    function monthsCaseReplace(m, format) {
        var months = {
                'nominative': 'sausis_vasaris_kovas_balandis_gegu啪臈_bir啪elis_liepa_rugpj奴tis_rugs臈jis_spalis_lapkritis_gruodis'.split('_'),
                'accusative': 'sausio_vasario_kovo_baland啪io_gegu啪臈s_bir啪elio_liepos_rugpj奴膷io_rugs臈jo_spalio_lapkri膷io_gruod啪io'.split('_')
            },
            nounCase = (/D[oD]?(\[[^\[\]]*\]|\s+)+MMMM?/).test(format) ?
                'accusative' :
                'nominative';
        return months[nounCase][m.month()];
    }
    function translateSingular(number, withoutSuffix, key, isFuture) {
        return withoutSuffix ? forms(key)[0] : (isFuture ? forms(key)[1] : forms(key)[2]);
    }
    function special(number) {
        return number % 10 === 0 || (number > 10 && number < 20);
    }
    function forms(key) {
        return units[key].split('_');
    }
    function translate(number, withoutSuffix, key, isFuture) {
        var result = number + ' ';
        if (number === 1) {
            return result + translateSingular(number, withoutSuffix, key[0], isFuture);
        } else if (withoutSuffix) {
            return result + (special(number) ? forms(key)[1] : forms(key)[0]);
        } else {
            if (isFuture) {
                return result + forms(key)[1];
            } else {
                return result + (special(number) ? forms(key)[1] : forms(key)[2]);
            }
        }
    }
    function relativeWeekDay(moment, format) {
        var nominative = format.indexOf('dddd HH:mm') === -1,
            weekDay = weekDays[moment.day()];
        return nominative ? weekDay : weekDay.substring(0, weekDay.length - 2) + '寞';
    }

    var lt = moment.defineLocale('lt', {
        months : monthsCaseReplace,
        monthsShort : 'sau_vas_kov_bal_geg_bir_lie_rgp_rgs_spa_lap_grd'.split('_'),
        weekdays : relativeWeekDay,
        weekdaysShort : 'Sek_Pir_Ant_Tre_Ket_Pen_艩e拧'.split('_'),
        weekdaysMin : 'S_P_A_T_K_Pn_艩'.split('_'),
        longDateFormat : {
            LT : 'HH:mm',
            LTS : 'HH:mm:ss',
            L : 'YYYY-MM-DD',
            LL : 'YYYY [m.] MMMM D [d.]',
            LLL : 'YYYY [m.] MMMM D [d.], HH:mm [val.]',
            LLLL : 'YYYY [m.] MMMM D [d.], dddd, HH:mm [val.]',
            l : 'YYYY-MM-DD',
            ll : 'YYYY [m.] MMMM D [d.]',
            lll : 'YYYY [m.] MMMM D [d.], HH:mm [val.]',
            llll : 'YYYY [m.] MMMM D [d.], ddd, HH:mm [val.]'
        },
        calendar : {
            sameDay : '[艩iandien] LT',
            nextDay : '[Rytoj] LT',
            nextWeek : 'dddd LT',
            lastDay : '[Vakar] LT',
            lastWeek : '[Pra臈jus寞] dddd LT',
            sameElse : 'L'
        },
        relativeTime : {
            future : 'po %s',
            past : 'prie拧 %s',
            s : translateSeconds,
            m : translateSingular,
            mm : translate,
            h : translateSingular,
            hh : translate,
            d : translateSingular,
            dd : translate,
            M : translateSingular,
            MM : translate,
            y : translateSingular,
            yy : translate
        },
        ordinalParse: /\d{1,2}-oji/,
        ordinal : function (number) {
            return number + '-oji';
        },
        week : {
            dow : 1, // Monday is the first day of the week.
            doy : 4  // The week that contains Jan 4th is the first week of the year.
        }
    });

    return lt;

}));
