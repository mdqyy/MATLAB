function ADC = calcADC(signal,signal_b0,b,b0)

    ADC = log(signal/signal_b0)...
        /-(b-b0);


end