%Author: T. Hollis
%Subject: Digital Mobile Communications

%1. Set up global variables
channel_length = 6;
bin_width = 0.000001;

%2. Caculate RMS delay spread of uniform power delay profile
tau = bin_width;
P = ones(1, channel_length);
mean_excess_delay = (P(1)*0*tau + P(2)*1*tau + P(3)*2*tau + P(4)*3*tau + P(5)*4*tau + P(6)*5*tau)/(P(1)+P(2)+P(3)+P(4)+P(5)+P(6));
second_moment = (P(1)*(0*tau^2) + P(2)*((1*tau)^2) + P(3)*((2*tau)^2) + P(4)*((3*tau)^2) + P(5)*((4*tau)^2) + P(6)*((5*tau)^2))/(P(1)+P(2)+P(3)+P(4)+P(5)+P(6));
RMS_delay_spread = sqrt(second_moment - (mean_excess_delay*mean_excess_delay));

%3. Return value to command window
disp(['RMS delay spread of uniform power delay profile is: ' num2str(RMS_delay_spread) 's.'])
