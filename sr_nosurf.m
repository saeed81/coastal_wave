fid = fopen('./model.txt', 'r');

omega1 =fgetl(fid);

vx1 =fgetl(fid);

vy1 =fgetl(fid);


omega=str2double(omega1)

vx=str2double(vx1)

vy=str2double(vy1)

alpha = 1.210;

bp    = 1.628;

wn    = 1;

ssigma = 0.816


result= vx -vy*(wn / bp - sqrt(( 1.0 - omega * omega ) / (1.0-(ssigma*omega*omega)/ 3.0 )) * (besselk(wn +1,sqrt(( 1.0 - omega * omega ) / (1.0-(ssigma*omega*omega)/ 3.0 ))*bp)) /  (besselk(wn,sqrt(( 1.0 - omega * omega ) / (1.0-(ssigma*omega*omega)/ 3.0 ))*bp)) )

fid1 = fopen('./output.txt', 'w');

fprintf(fid1,'%14.7f',result);

fprintf(fid1, '\n');

exit;