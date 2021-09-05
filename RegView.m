if(exist('net'))
    format long;
    close all;
    global today_price_open;
    global p1_price_open;
    global p1_price_close;
    global p1_price_high;
    global p1_price_low;
    global p1_price_volume;
    global p2_price_open;
    global p2_price_close;
    global p2_price_high;
    global p2_price_low;
    global p2_price_volume;
    p1_price_open = double(input('Candle 1 (3 ago candle) weekly/daily/monthly chart''s open price? '));
    p1_price_close = double(input('Candle 1 (3 ago candle) weekly/daily/monthly chart''s closed price? '));
    p1_price_high = double(input('Candle 1 (3 ago candle) weekly/daily/monthly chart''s highest price? '));
    p1_price_low = double(input('Candle 1 (3 ago candle) weekly/daily/monthly chart''s lowest price? '));
    p1_price_volume = double(input('Candle 1 (3 ago candle) weekly/daily/monthly chart''s volume? '));
    disp(' ')
    Candle1 = [p1_price_open p1_price_close p1_price_high p1_price_low p1_price_volume  fftshift([p1_price_volume p1_price_open p1_price_close p1_price_high p1_price_low])];
    p2_price_open = double(input('Candle 2 (2 ago candle) weekly/daily/monthly chart''s open price? '));
    p2_price_close = double(input('Candle 2 (2 ago candle) weekly/daily/monthly chart''s closed price? '));
    p2_price_high = double(input('Candle 2 (2 ago candle) weekly/daily/monthly chart''s highest price? '));
    p2_price_low = double(input('Candle 2 (2 ago candle) weekly/daily/monthly chart''s lowest price? '));
    p2_price_volume = double(input('Candle 2 (2 ago candle) weekly/daily/monthly chart''s volume? '));
    disp(' ')
    Candle2 = [p2_price_open p2_price_close p2_price_high p2_price_low p2_price_volume fftshift([p2_price_volume p2_price_open p2_price_close p2_price_high p2_price_low])];
    
    p3_price_open = double(input('Candle 3 (1 ago candle) weekly/daily/monthly chart''s open price? ')); 
    p3_price_close = double(input('Candle 3 (1 ago candle) weekly/daily/monthly chart''sclosed price? ')); 
    p3_price_high = double(input('Candle 3 (1 ago candle) weekly/daily/monthly chart''s highest price? '));
    p3_price_low = double(input('Candle 3 (1 ago candle) weekly/daily/monthly chart''s lowest price? '));
    p3_price_volume = double(input('Candle 3 (1 ago candle) weekly/daily/monthly chart''s volume? ')); 
    disp(' ') 
    Candle3 = [p3_price_open p3_price_close p3_price_high p3_price_low p3_price_volume fftshift([p2_price_volume p2_price_open p2_price_close p2_price_high p2_price_low])];
    
    
    
    today_price_open = double(input('Current weekly/daily/monthly chart''s open price? '));
%     Candle1 = Candle1'; Candle2 = Candle2';
%     ans1 = [p1_price_open p1_price_close p1_price_high p1_price_low];
%     ans2 = [p2_price_open p2_price_close p2_price_high p2_price_low];
   ans = double(net([inputx1 inputx2 inputx3 Data(4:end,3)]'));
    figure(1)
    plot(ans)
    hold on
    plot(Data(3:end,6))
    legend('Prediction TimeSeries','Close Price')
    hold off
    %predicted = double(t);
    % for predict_counter = 1:20 predicted((length(t)+predict_counter)) =
    % double(ans); ans = double(net([ans fftshift(ans)]')); end
    sprintf('+Open Price+ %f  || +Forecasted Price+  %f',today_price_open,double(net([Candle1 Candle2 Candle3 today_price_open]')))
    if(double(today_price_open) > double(net([Candle1 Candle2 Candle3 today_price_open]')))
        disp('-Trend is Bearish-')
    elseif(double(today_price_open)<double(net([Candle1 Candle2 Candle3 today_price_open]')))
        disp('+Trend is Bullish+')
    end
    if(double(today_price_open)==double(net([Candle1 Candle2 Candle3 today_price_open]')))
        disp('Natural Trend')
    end
end