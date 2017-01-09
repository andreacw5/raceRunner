/**
 * Created by Andrea Zago on 09/01/2017.
 */
zingchart.THEME="classic";
var myConfig =
    {
        "globals":{
            "font-family": "arial"
        },
        "type": "line",
        "background-color": "white",
        "plotarea": {
            "margin": "15% 10% 12% 10%"
        },

        "legend": {
            "layout": "float",
            "align":"center",
            "vertical-align":"bottom",
            "alpha": 0.25,
            "shadow": "false",
            "border": "none",
            "item": {
                "font-size": "12px",
                "font-color": "#3c3c3c"
            }
        },
        "scale-x": {
            "labels": [
                "Gennaio",
                "Febbraio",
                "Marzo",
                "Aprile",
                "Maggio",
                "Giugno",
                "Luglio",
                "Agosto",
                "Settembre",
                "Ottobre",
                "Novembre",
                "Dicembre"

            ],
            "line-color": "#3c3c3c",
            "line-style": "solid",
            "line-width": "1px",
            "guide": {
                "line-color": "#3c3c3c",
                "line-width": "1px",
                "alpha": 0.2,
                "line-style": "dotted"
            },
            "tick": {
                "line-width": "2px",
                "line-color": "#3c3c3c"
            },
            "minor-ticks": 1,
            "minor-tick": {
                "alpha": 1,
                "placement": "outer",
                "line-color": "#3c3c3c"
            },
            "minor-guide": {
                "visible": false
            },
            "item": {
                "font-size": "12px",
                "font-color": "#3c3c3c",
                "font-family": "arial"
            }
        },
        "scale-y": {
            "values": "0:10000:100",
            "line-width": "1px",
            "line-color": "#3c3c3c",
            "format": "%v",
            "line-style": "solid",
            "multiplier": true,
            "guide": {
                "visible": true,
                "line-color": "#3c3c3c",
                "line-width": "1px",
                "alpha": 0.2,
                "line-style": "dotted"
            },
            "tick": {
                "line-width": "2px",
                "line-color": "#3c3c3c"
            },
            "minor-ticks": 1,
            "minor-tick": {
                "line-color": "#3c3c3c"
            },
            "item": {
                "font-size": "12px",
                "font-color": "#3c3c3c"
            },
            "minor-guide": {
                "visible": false
            },
            "label": {
                "text": "",
                "font-size": "10px",
                "font-weight": "normal",
                "font-color": "#3c3c3c",
                "font-angle":0,
                "offset-y":-200,
                "offset-x":30
            }
        },
        "crosshair-x": {
            "value-label": {
                "font-size": "12px",
                "font-color": "#c7c7c7",
                "background-color": "#3c3c3c",
                "text": "%t<br>%v",
                "decimals": 2,
                "border-radius": "5px",
                "thousands-separator": ",",
                "text-align": "left"
            },
            "scale-label": {
                "visible": false
            }
        },
        "tooltip": {
            "visible": false
        },
        "plot": {
            "shadow": false,
            "marker": {
                "visible": false
            }
        },
        "series": [
            {
                "values": [
                    1000,
                    1000,
                    1000,
                    1000,
                    1000,
                    1000,
                    1000,
                    1000,
                    1000,
                    1000,
                    1000,
                    1000
                ],
                "line-width": "1px",
                "line-style": "dashed",
                "line-segment-size":8,
                "line-color": "#3c3c3c",
                "text": "Eventi"
            },
            {
                "values": [
                    1000,
                    1000,
                    1000,
                    1000,
                    1000,
                    1000,
                    1000,
                    1000,
                    1000,
                    1000,
                    1000,
                    1000
                ],
                "line-width": "2px",
                "line-style": "dotted",
                "line-color": "#a12222",
                "text": "Distanze"
            }
        ]
    };

zingchart.render({
    id : 'myChart',
    data : myConfig,
    height: 627,
    width: 1000
});