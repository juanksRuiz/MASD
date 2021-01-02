%1) Imagenes en blanco y negro

%a)
A1 = [];
par = [1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0];
impar = [0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1];
par8 = [1,0,1,0,1,0,1,0];
impar8 = [0,1,0,1,0,1,0,1];
for i = 1:8
    A1 = [A1;par];
    A1 = [A1;impar];
end

%b)
%figure(1);imshow(A1)
% 0 corresponde a pixel negro, 1 corresponde a pixel blanco

%d)
cNegro = zeros(100,100);
cBlanco = ones(100,100);

A2 = [];

for i = 1:8
    linea = [];
    if mod(i,2) == 0
        for j = par8
            if j == 1
                linea = [linea cBlanco];
            else
                linea = [linea cNegro];
            end
        end
    else
        for j = impar8
            if j == 1
                linea = [linea cBlanco];
            else
                linea = [linea cNegro];
            end
        end
    end
    A2 = [A2;linea]; 
end

%e)
imwrite(A2,'ajedrez_juancamilo_ruiz.bmp')

% f)
A3 = imread('ajedrez.bmp')
A3inv = A3 + ones(size(A3,1),size(A3,2));
A3inv = mod(A3inv,2);
imwrite(A3inv,'ajedrez2_juancamilo_ruiz.bmp')

%2) Imagenes en escala de grises
%a)
B1 = imread('balcones256.bmp');
B2 = B1;
for i = 1:size(B2,1)
    for j = 1:size(B2,2)
        if B2(i,j)> 50 & B2(i,j)< 100
            B2(i,j) = 0;
        else
            B2(i,j) = 255;
        end
    end
end

imwrite(B2,'balconesBN_juancamilo_ruiz.bmp')

% 3) Imagenes RGB
%a) 
RGB = zeros(600,1000,3);
%b)
imshow(RGB);
%c)
% Adicionando color rojo en la parte superior
%RGB(1:400,201:800,1) = 255;
%imshow(RGB);

%e)Adicionando verde en la parte inferior izquierda
%RGB(201:600,1:600,2)= 255;
%imshow(RGB);

%g) Adicionando azul en la parte inferior derecha
%RGB(201:600,401:1000,3)=255;
%imshow(RGB);

%i) Bandera de colombia
RGB = zeros(400,600,3);
imshow(RGB);
%Amarillo
RGB(1:250,1:600,1)=255;
RGB(1:250,1:600,2)=255;

%Azul
RGB(251:325,1:600,3)=255;
%Rojo
RGB(326:400,1:600,1)=255;
imshow(RGB);

%4) Modificaciion de imagenes
%a)
RGBguac = imread('guacamaya.jpg');
RGBguac(1:460,1:700,2)=0;
imwrite(RGBguac,'guacamaya_juancamilo_ruiz.bmp');
%b)
alfa = 0.5;
beta = 1-alfa;
RGBim1 = imread('rostro1.jpg');
RGBim2 = imread('rostro2.jpg');
%uint8(Im)para convertir los terminos de la matriz en enteros
% RGBim1 size: 1021,1023
r1 = alfa*RGBim1(1:1021,1:1023,1);
g1 = alfa*RGBim1(1:1021,1:1023,2);
b1 = alfa*RGBim1(1:1021,1:1023,3);

r2 = beta*RGBim2(1:1021,1:1023,1);
g2 = beta*RGBim2(1:1021,1:1023,2);
b2 = beta*RGBim2(1:1021,1:1023,3);

RGBfinal = uint8(zeros(1021,1023,3));
RGBfinal(1:1021,1:1023,1) = uint8(r1+r2);
RGBfinal(1:1021,1:1023,2) = uint8(g1+g2);
RGBfinal(1:1021,1:1023,3) = uint8(b1+b2);
imshow(RGBfinal);
imwrite(RGBfinal,'rostros_juancamilo_ruiz.bmp');




