//+------------------------------------------------------------------+
//|                                                    OpenClose.mq5 |
//|                                                    diegoPaladino |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+

// Programe Seu Primeiro Indicador para MetaTrader 5
// tutorial from: https://www.youtube.com/watch?v=cLDjmvC-Y3s

#property copyright "diegoPaladino"
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_separate_window
//+------------------------------------------------------------------+
//|   PROPRIEDADES DO INDICADOR                                      |
//+------------------------------------------------------------------+
#property indicator_buffers   1
#property indicator_plots     1

#property indicator_label1    "teste2"
#property indicator_type1     DRAW_HISTOGRAM
#property indicator_style1    STYLE_SOLID
#property indicator_color1    clrGreen,clrRed
#property indicator_width1    2


//+------------------------------------------------------------------+
//|  VARIAVEIS GLOBAIS                                               |
//+------------------------------------------------------------------+
double indBuffer[]; //Buffer do indicador
//double indColor[];  //Buffer de cor


//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping
   SetIndexBuffer(0,indBuffer,INDICATOR_DATA);
   //SetIndexBuffer(1,indColor,INDICATOR_COLOR_INDEX);
//---
   ArrayInitialize(indBuffer,EMPTY_VALUE);
   //ArrayInitialize(indColor,EMPTY_VALUE);
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
//--- PRIMEIRA PLOTAGEM DO INDICADOR
   if(prev_calculated==0)
     {
      for(int i=0;i<rates_total;i++)
        {
         indBuffer[i]= open[i]-close[i];
        }
     }
     
//--- DEMAIS PLOTAGENS DO INDICADOR
   else
     {
      indBuffer[rates_total-1] = volume[rates_total-1];
     }

//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
