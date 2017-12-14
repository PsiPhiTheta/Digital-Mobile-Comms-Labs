%Author: T. Hollis
%Subject: Digital Mobile Communications

%1. Set up global variables
channel_length = 6;
bin_width = 0.000001;
exp_factor = 0.1;
xvals = [];
yvals = [];
i = 1;

%2. Caculate RMS delay spread of exponential power delay profile (with increasing decay factor)
while (exp_factor <= 5)
    tau = bin_width;
    exp_factor = exp_factor + 0.1;
    P = exp_factor*exp(-[1:channel_length]/exp_factor);
  
    mean_excess_delay = (P(1)*0*tau + P(2)*1*tau + P(3)*2*tau + P(4)*3*tau + P(5)*4*tau + P(6)*5*tau)/(P(1)+P(2)+P(3)+P(4)+P(5)+P(6));
    second_moment = (P(1)*(0*tau^2) + P(2)*((1*tau)^2) + P(3)*((2*tau)^2) + P(4)*((3*tau)^2) + P(5)*((4*tau)^2) + P(6)*((5*tau)^2))/(P(1)+P(2)+P(3)+P(4)+P(5)+P(6));
    RMS_delay_spread = sqrt(second_moment - (mean_excess_delay*mean_excess_delay));
    
    xvals(i) = exp_factor;
    yvals(i) = RMS_delay_spread;
    i = i+1;
end

%3. Plot into a graph
plot(xvals, yvals);
title({'RMS Delay Spread vs Decay Factor for exponential delay profile';''});
xlabel('Decay Factor') 
ylabel('RMS Delay Spread') 
