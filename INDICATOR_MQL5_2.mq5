//+------------------------------------------------------------------+
//|                                               INDICATOR_MQL5.mq5 |
//|                                                    diegoPaladino |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "diegoPaladino"
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window

//+------------------------------------------------------------------+
//|   PROPRIEDADES DO INDICADOR                                      |
//+------------------------------------------------------------------+
#property indicator_buffers   1
#property indicator_plots     1

#property indicator_label1    "teste2"
#property indicator_type1     DRAW_LINE
#property indicator_style1    STYLE_SOLID
#property indicator_color1    clrGreen
#property indicator_width1    2


//+------------------------------------------------------------------+
//|  VARIAVEIS GLOBAIS                                               |
//+------------------------------------------------------------------+
double indBuffer[];


//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping
   SetIndexBuffer(0,indBuffer,INDICATOR_DATA);
//---
   ArrayInitialize(indBuffer,EMPTY_VALUE);
//
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
   if(prev_calculated==0)
     {
      for(int i=0;i<rates_total;i++)
        {
         indBuffer[i] = close[i];
        }
     }
//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
