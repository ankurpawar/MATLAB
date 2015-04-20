function mandelbrot_small_rgb
%function generate mandelbrot set image.Code calculate the mandelbrot
%points and color it according to the colormap.This function doesn't store
%big array in memory. Calculate row one by one and write to a BMP file.
%Takes more time to complete the fractal as compared to methods stroing the
%whole image in memory.First the header of BMP file is created and written
%to disk.Then during the loop each point in a row is calculated and written
%to the disk.
WIDTH = 500;
HEIGHT = 500;
MAX_ITERATIONS = 256;
bmpFile = 'bigmandel';

fid = fopen([bmpFile '.bmp'],'w');
x = linspace(-1.5,0.6,WIDTH);
y = linspace(-1.26,1.26,HEIGHT);

xnew =  0;
ynew =  0;
a =  0;
b =  0;
xn =  0;
yn =  0;
zval =  zeros(WIDTH,1);
nColors = MAX_ITERATIONS;
cmap = gray(nColors);

%prepare bmp header
bmpStruct = struct([]);
bmpStruct = struct('magicWord', uint8('BM'), ...
    'dataSize',uint32(WIDTH*HEIGHT*3 + 54), ...
    'unused', uint32(0), ...
    'dataOffset', uint32(54), ...
    'headerSize', uint32(40), ...
    'bmpWidth', uint32(WIDTH), ...
    'bmpHeight', uint32(HEIGHT), ...
    'nColorPlane', uint16(1), ...
    'bitsPerPixel', uint16(24), ...
    'compression', uint32(0), ...
    'rawDataSize', uint32(WIDTH*HEIGHT*3), ...
    'hResolution', uint32(0), ... %pixels/meter
    'vResolution', uint32(0), ...  %pixels/meter
    'colorPalletLength', uint32(0), ... %colors in pallet
    'importantColor', uint32(0)); %all colors are important

%write bmp header to file
c = struct2cell(bmpStruct);
for n = 1:size(c,1)
    dat = c{n};
    fwrite(fid, dat, class(dat));
end

rgb = ind2rgb8(1:(nColors), cmap);
rgb = squeeze(rgb);
rgb = rgb';

tic
for n = HEIGHT: -1: 1
    b = y(n);
    for m = 1: WIDTH
        a = x(m);
        xn = 0;
        yn = 0;
        k = 0;
        while (k < MAX_ITERATIONS) && ((xn^2 + yn^2) < 4)
            xnew = xn^2 - yn^2 + a;
            ynew = 2*xn*yn + b;
            xn = xnew;
            yn = ynew;
            k = k+1;
        end
        zval(m) = k;
    end
    rgb_row = rgb(:,zval);
    %write a row of pixels
    fwrite(fid, rgb_row, 'uint8');
    %padding to maintain 4 byte alignment at the end of each row
    padWidth = mod(WIDTH, 4);
    if padWidth
        fwrite(fid, zeros(padWidth,1), 'uint8');
    end
end
toc
%Close the BMP file
st=fclose(fid);
end