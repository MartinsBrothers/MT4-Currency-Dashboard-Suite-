//+------------------------------------------------------------------+
//| Currency Strength Engine.mq4                                     |
//| Core calculation engine for all dashboards                       |
//+------------------------------------------------------------------+

#property copyright "Dashboard Suite"
#property version   "1.00"
#property strict

// Strength calculation for 8 major currencies
input int CalculationPeriod = 14;
input ENUM_TIMEFRAMES StrengthTimeframe = PERIOD_H1;

double currencyStrength[8];
string currencyNames[8] = {"USD", "EUR", "GBP", "JPY", "CHF", "CAD", "AUD", "NZD"};

//+------------------------------------------------------------------+
//| Calculate currency strength                                      |
//+------------------------------------------------------------------+
void CalculateStrength()
{
   for(int i = 0; i < 8; i++)
   {
      currencyStrength[i] = GetSingleCurrencyStrength(currencyNames[i]);
   }
   NormalizeStrength();
}

//+------------------------------------------------------------------+
//| Get strength for single currency                                |
//+------------------------------------------------------------------+
double GetSingleCurrencyStrength(string currency)
{
   double strength = 0;
   int pairCount = 0;
   
   for(int i = 0; i < SymbolsTotal(true); i++)
   {
      string symbol = SymbolName(i, true);
      if(StringFind(symbol, currency) >= 0)
      {
         strength += CalculateMomentum(symbol);
         pairCount++;
      }
   }
   
   return (pairCount > 0) ? strength / pairCount : 0;
}
