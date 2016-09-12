function runner(scale)
%DRV_PN_LEGENDRE_VECTN Summary of this function goes here
%   Detailed explanation goes here

x=[0 0.3 0.9 0.7 0.5];
n=5;

tic();
for i=1:scale
    PNa=PN_Legendre_vectN(x, n);
    PNxa=PNx_Legendre_vectN(x, n);
    PNxxa=PNxx_Legendre_vectN(x, n);
end
elapsed = toc();

ADJUST=10000;
checksum1 = fletcherSum(floor(PNa*ADJUST));
checksum2 = fletcherSum(floor(PNxa*ADJUST));
checksum3 = fletcherSum(floor(PNxxa*ADJUST));

checksum = fletcherSum([checksum1 checksum2 checksum3]);

disp('{');
disp('"time":');
disp(elapsed);
disp(', "output":');
disp(checksum);
disp('}');

end
