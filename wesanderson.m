function [ rgb ] = wesanderson( film, n )
%Wes Anderson color palettes for MATLAB
%   Via https://wesandersonpalettes.tumblr.com/

i = 1;
wes(i).Film='tenenbaums1'; wes(i).Hex=['#fe6d7e';'#f19167';'#e8aa9d';'#3d1f1f';'#fcded4']; i=i+1;
wes(i).Film='tenenbaums2'; wes(i).Hex=['#cebac6';'#9f4f5c';'#c3bab5';'#2d2e67';'#dadbdd']; i=i+1;
wes(i).Film='tenenbaums3'; wes(i).Hex=['#99b1b3';'#d3af7b';'#ded4cb';'#deb0b0']; i=i+1;
wes(i).Film='tenenbaums4'; wes(i).Hex=['#89b151';'#f4ddbe';'#715a38';'#201a02']; i=i+1;
wes(i).Film='tenenbaums5'; wes(i).Hex=['#899da4';'#c93312';'#faefd1';'#dc863b']; i=i+1;
wes(i).Film='tenenbaums6'; wes(i).Hex=['#9a8822';'#f5cdb4';'#c3bab5';'#fddda0';'#74a089']; i=i+1;
wes(i).Film='aquatic1'; wes(i).Hex=['#deb058';'#ce9486';'#d4c5b2';'#c9573c';'#77674e']; i=i+1;
wes(i).Film='aquatic2'; wes(i).Hex=['#9dadc4';'#ebe85d';'#6cafcc';'#af9e73';'#c9c6d7']; i=i+1;
wes(i).Film='aquatic3'; wes(i).Hex=['#433022';'#235135';'#f3d28f';'#7b6da8';'#c5a495']; i=i+1;
wes(i).Film='aquatic4'; wes(i).Hex=['#1b346c';'#01abe9';'#c3ced0';'#e5c39e';'#f54b1a']; i=i+1;
wes(i).Film='darjeeling1'; wes(i).Hex=['#877b7b';'#7c5b76';'#941504';'#c9950d';'#bd6f6f']; i=i+1;
wes(i).Film='darjeeling2'; wes(i).Hex=['#b5b867';'#ffea59';'#b7dbdb';'#335b8e';'#6ca18f']; i=i+1;
wes(i).Film='darjeeling3'; wes(i).Hex=['#dde8e0';'#749ca8';'#f9e0a8';'#bc5e21';'#8b8378']; i=i+1;
wes(i).Film='darjeeling4'; wes(i).Hex=['#aea8a8';'#cc9e02';'#95796d';'#ad6e45']; i=i+1;
wes(i).Film='chevalier'; wes(i).Hex=['#446455';'#fdd262';'#d3dddc';'#c7b19c']; i=i+1;
wes(i).Film='fantasticfox1'; wes(i).Hex=['#e8c95d';'#d16b54';'#a9d8c8';'#433447';'#b9b09f']; i=i+1;
wes(i).Film='fantasticfox2'; wes(i).Hex=['#f8e03e';'#a45e60';'#541f0f';'#cd8b34';'#e7d2b7']; i=i+1;
wes(i).Film='moonrise1'; wes(i).Hex=['#313167';'#747b74';'#b66e56';'#a33a36';'#fee7a3']; i=i+1;
wes(i).Film='moonrise2'; wes(i).Hex=['#cb654f';'#d3b1a7';'#cfcb9c';'#8cbea3';'#dfba47']; i=i+1;
wes(i).Film='moonrise3'; wes(i).Hex=['#e69ea1';'#ded9a2';'#f6c83e';'#4d5b28';'#db4372';'#b77e60']; i=i+1;
wes(i).Film='moonrise4'; wes(i).Hex=['#8d9876';'#cbb345';'#609f80';'#4b574d';'#af420a']; i=i+1;
wes(i).Film='moonrise5'; wes(i).Hex=['#ceab07';'#f3df6c';'#d5d5d3';'#24281a']; i=i+1;
wes(i).Film='moonrise6'; wes(i).Hex=['#798e87';'#c27d38';'#ccc591';'#29211f']; i=i+1;
wes(i).Film='moonrise7'; wes(i).Hex=['#85d4e3';'#f4b5bd';'#9c964a';'#cdc08c';'#fad77b']; i=i+1;
wes(i).Film='cavalcanti'; wes(i).Hex=['#02401b';'#81a88d';'#a2a475';'#d8b70a';'#972d15']; i=i+1;
wes(i).Film='budapest1'; wes(i).Hex=['#e7a396';'#9f295d';'#d9a34b';'#ecd1ca';'#430e00']; i=i+1;
wes(i).Film='budapest2'; wes(i).Hex=['#c68006';'#642e68';'#fff7c9';'#a9902b';'#2a1824']; i=i+1;
wes(i).Film='budapest3'; wes(i).Hex=['#ffe2c4';'#314856';'#ecbbad';'#798881';'#9d5141';'#a67f48']; i=i+1;
wes(i).Film='budapest4'; wes(i).Hex=['#ffb5a0';'#fcd5c4';'#9e1906';'#370c03']; i=i+1;
wes(i).Film='budapest5'; wes(i).Hex=['#5b1a18';'#fd6467';'#f1bb7b';'#d67236']; i=i+1;
wes(i).Film='budapest6'; wes(i).Hex=['#e6a0c4';'#c6cdf7';'#d8a499';'#7294d4']; i=i+1;
wes(i).Film='dogs1'; wes(i).Hex=['#aa82a7';'#9e2f28';'#deb867';'#110d0e';'#e3ced3';'#948580']; i=i+1;
wes(i).Film='dogs2'; wes(i).Hex=['#ffd0bc';'#bd9184';'#dc7c40';'#412f2f';'#201718']; i=i+1;

idx = strcmp(film, {wes.Film});

rgb = hex2rgb(wes(idx).Hex);

end

