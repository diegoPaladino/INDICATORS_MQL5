//+------------------------------------------------------------------+
//|                                                MOZILA_ALERTA.mq5 |
//|                                                    diegoPaladino |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "diegoPaladino"
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window

//+------------------------------------------------------------------+
//|  PROPRIEDADES DO INDICADOR                                       |
//+------------------------------------------------------------------+
#property indicator_buffers   1
#property indicator_plots     1

#property indicator_label1    "Teste"
#property indicator_type      DRAW_LINE
#property indicator_style     STYLE_SOLID
#property indicator_color     clrAliceBlue
#property indicator_width     2

//+------------------------------------------------------------------+
//|  VARIAVEIS GLOBAIS                                               |
//+------------------------------------------------------------------+
double indBuffer[]; //--- buffer do indicador



//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping

//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {
//---

//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
