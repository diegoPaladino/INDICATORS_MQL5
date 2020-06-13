//+------------------------------------------------------------------+
//|                                             ZIG_ZAG-DOJI-1.0.mq5 |
//|                                                    diegoPaladino |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "diegoPaladino"
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window
#property indicator_buffers 4
#property indicator_plots   1
//--- plot ZigZag
#property indicator_label1  "ZigZag"
#property indicator_type1   DRAW_SECTION
#property indicator_color1  clrRed
#property indicator_style1  STYLE_SOLID
#property indicator_width1  1
//--- plot Direction
#property indicator_label2  "Direction"
#property indicator_type2   DRAW_LINE
#property indicator_style2  STYLE_SOLID
#property indicator_width2  1
//--- plot LastHighBar
#property indicator_label3  "LastHighBar"
#property indicator_type3   DRAW_LINE
#property indicator_style3  STYLE_SOLID
#property indicator_width3  1
//--- plot LastLowBar
#property indicator_label4  "LastLowBar"
#property indicator_type4   DRAW_LINE
#property indicator_style4  STYLE_SOLID
#property indicator_width4  1
//--- input parameters
input int      period=12;
//--- indicator buffers
double         ZigZagBuffer[];
double         DirectionBuffer[];
double         LastHighBarBuffer[];
double         LastLowBarBuffer[];
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping
   SetIndexBuffer(0,ZigZagBuffer,INDICATOR_CALCULATIONS);
   SetIndexBuffer(1,DirectionBuffer,INDICATOR_CALCULATIONS);
   SetIndexBuffer(2,LastHighBarBuffer,INDICATOR_CALCULATIONS);
   SetIndexBuffer(3,LastLowBarBuffer,INDICATOR_CALCULATIONS);
   
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
                
   int start;
   
   if(prev_calculated==0)
     {
      DirectionBuffer[0]=0;
      LastHighBarBuffer[0]=0;
      LastLowBarBuffer[0]=0;
      start=1;
     }             
   else
     {
      start=prev_calculated-1;
     }
     
   for(int i=start;i<rates_total;i++)
   
   
   DirectionBuffer[i]=DirectionBuffer[i-1];
   
   int ps = i-period+1;
   
   int hb=ArrayMaximum(high,ps,period);
   int lb=ArrayMinimum(low,ps,period);
   
   if(hb==i && lb!=i)
     {
      DirectionBuffer[i]=1;
     }
   else(lb==i && hb!=i)
     {
      DirectionBuffer[i]=-1;
     }
  }
//---
   
//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
