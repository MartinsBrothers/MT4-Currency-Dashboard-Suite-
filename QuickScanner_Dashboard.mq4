//+------------------------------------------------------------------+
//| QuickScanner Dashboard.mq4                                       |
//| Fast, minimalist opportunity scanner                           |
//+------------------------------------------------------------------+

#property copyright "Dashboard Suite Lite"
#property version   "1.5"
#property description "Quick Opportunity Scanner"
#property indicator_chart_window

// Simplified inputs
input ENUM_TIMEFRAMES MainTimeframe = PERIOD_H1;
input bool ShowTop3 = true;
input bool HighImpactOnly = true;

#include <CurrencyStrength.mqh>
#include <GUI_Engine.mqh>

CCurrencyStrength strengthEngine;
CGUIEngine gui;

//+------------------------------------------------------------------+
//| Quick scanner initialization                                    |
//+------------------------------------------------------------------+
int OnInit()
{
   gui.CreateMainPanel("QuickScanner", 10, 10, 400, 250);
   strengthEngine.Init();
   
   CreateStrengthMeter();
   CreateTopOpportunities();
   CreateNextEvent();
   
   return(INIT_SUCCEEDED);
}
