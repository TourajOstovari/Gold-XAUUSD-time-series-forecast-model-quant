DataPast = xlsread("C:\Candles\TradeRoom1\XAUUSD_D1.csv");
CandleInfo = DataPast(end-3:end,:);
C1 = [CandleInfo(1,3) CandleInfo(1,6) CandleInfo(1,4) CandleInfo(1,5) CandleInfo(1,7) fftshift([CandleInfo(1,7) CandleInfo(1,3) CandleInfo(1,6) CandleInfo(1,4) CandleInfo(1,5)])];
C2 = [CandleInfo(2,3) CandleInfo(2,6) CandleInfo(2,4) CandleInfo(2,5) CandleInfo(2,7) fftshift([CandleInfo(2,7) CandleInfo(2,3) CandleInfo(2,6) CandleInfo(2,4) CandleInfo(2,5)])];
C3 = [CandleInfo(3,3) CandleInfo(3,6) CandleInfo(3,4) CandleInfo(3,5) CandleInfo(3,7) fftshift([CandleInfo(3,7) CandleInfo(3,3) CandleInfo(3,6) CandleInfo(3,4) CandleInfo(3,5)])];

ANS = double(net([C1 C2 C3 CandleInfo(4,3)]'));

if(double(CandleInfo(4,3))>ANS)
   disp('Bearish is coming ...') 
end
if(double(CandleInfo(4,3))<ANS)
    disp('Bullish is coming')
end