//! moment.js locale configuration
//! locale : Hebrew (he)
//! author : Tomer Cohen : https://github.com/tomer
//! author : Moshe Simantov : https://github.com/DevelopmentIL
//! author : Tal Ater : https://github.com/TalAter

(function (global, factory) {
   typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('../moment')) :
   typeof define === 'function' && define.amd ? define(['moment'], factory) :
   factory(global.moment)
}(this, function (moment) { 'use strict';


    var he = moment.defineLocale('he', {
        months : '讬谞讜讗专_驻讘专讜讗专_诪专抓_讗驻专讬诇_诪讗讬_讬讜谞讬_讬讜诇讬_讗讜讙讜住讟_住驻讟诪讘专_讗讜拽讟讜讘专_谞讜讘诪讘专_讚爪诪讘专'.split('_'),
        monthsShort : '讬谞讜壮_驻讘专壮_诪专抓_讗驻专壮_诪讗讬_讬讜谞讬_讬讜诇讬_讗讜讙壮_住驻讟壮_讗讜拽壮_谞讜讘壮_讚爪诪壮'.split('_'),
        weekdays : '专讗砖讜谉_砖谞讬_砖诇讬砖讬_专讘讬注讬_讞诪讬砖讬_砖讬砖讬_砖讘转'.split('_'),
        weekdaysShort : '讗壮_讘壮_讙壮_讚壮_讛壮_讜壮_砖壮'.split('_'),
        weekdaysMin : '讗_讘_讙_讚_讛_讜_砖'.split('_'),
        longDateFormat : {
            LT : 'HH:mm',
            LTS : 'HH:mm:ss',
            L : 'DD/MM/YYYY',
            LL : 'D [讘]MMMM YYYY',
            LLL : 'D [讘]MMMM YYYY HH:mm',
            LLLL : 'dddd, D [讘]MMMM YYYY HH:mm',
            l : 'D/M/YYYY',
            ll : 'D MMM YYYY',
            lll : 'D MMM YYYY HH:mm',
            llll : 'ddd, D MMM YYYY HH:mm'
        },
        calendar : {
            sameDay : '[讛讬讜诐 讘志]LT',
            nextDay : '[诪讞专 讘志]LT',
            nextWeek : 'dddd [讘砖注讛] LT',
            lastDay : '[讗转诪讜诇 讘志]LT',
            lastWeek : '[讘讬讜诐] dddd [讛讗讞专讜谉 讘砖注讛] LT',
            sameElse : 'L'
        },
        relativeTime : {
            future : '讘注讜讚 %s',
            past : '诇驻谞讬 %s',
            s : '诪住驻专 砖谞讬讜转',
            m : '讚拽讛',
            mm : '%d 讚拽讜转',
            h : '砖注讛',
            hh : function (number) {
                if (number === 2) {
                    return '砖注转讬讬诐';
                }
                return number + ' 砖注讜转';
            },
            d : '讬讜诐',
            dd : function (number) {
                if (number === 2) {
                    return '讬讜诪讬讬诐';
                }
                return number + ' 讬诪讬诐';
            },
            M : '讞讜讚砖',
            MM : function (number) {
                if (number === 2) {
                    return '讞讜讚砖讬讬诐';
                }
                return number + ' 讞讜讚砖讬诐';
            },
            y : '砖谞讛',
            yy : function (number) {
                if (number === 2) {
                    return '砖谞转讬讬诐';
                } else if (number % 10 === 0 && number !== 10) {
                    return number + ' 砖谞讛';
                }
                return number + ' 砖谞讬诐';
            }
        }
    });

    return he;

}));
