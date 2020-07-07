clear all
clc
[nx,ny,nz] = textread('normals.txt','%f %f %f','headerlines',1);

Long_div=input('No. of longitudnal divisions=');
Lat_div=input('No. of latitudnal divisions=');

ic=zeros();  %Azimithul divisions
for i=1:(Long_div+1)
    ic(i)=(i-1)*2*pi/Long_div; 
end
jc=zeros();  %Polar divisions
for j=1:(Lat_div+1)
    jc(j)=acos(1-((2*(j-1))/Lat_div));
end

c=zeros(2*length(nx),3);
for i=1:length(nx)
    c(i,1)=nx(i);
    c(i,2)=ny(i);
    c(i,3)=nz(i);
end
%Also considering the opposite direction of every contact normal
for i=(length(nx)+1):(2*length(nx)) 
    c(i,1)=-nx(i-length(nx));
    c(i,2)=-ny(i-length(nx));
    c(i,3)=-nz(i-length(nx));
end

[R,Theta,PHI]=cart2sph_luxp2(c);  %Cartesian corrdiantes to polar coordinates

%---Distribution of vectors into bins-----%
hang=1;
A=zeros();
for i=1:(length(ic)-1)
    for j=1:(length(jc)-1)
        A(hang,5)=length(find(PHI(:)>ic(i)&PHI(:)<ic(i+1)&Theta(:)>jc(j)&Theta(:)<jc(j+1))); %Distribution to different bins
        A(hang,1)=ic(i);
        A(hang,2)=ic(i+1);
        A(hang,3)=jc(j);
        A(hang,4)=jc(j+1);
        hang=hang+1;
    end
end

M=max(A(:,5)); %No. of vectors in the maximally distributed bin
polar(nan,M*0.905);
hold all;
Total_vec=sum(A(:,5)) %Total number of vectors distributed
%20:705
for k=1:length(A)
  theta1=A(k,3);
  theta2=A(k,4);
  phi1=A(k,1);
  phi2=A(k,2);
  r=A(k,5);
  x1=r*sin(theta1)*cos(phi1);
  y1=r*sin(theta1)*sin(phi1);
  z1=r*cos(theta1);
  
  x2=r*sin(theta2)*cos(phi1);
  y2=r*sin(theta2)*sin(phi1);
  z2=r*cos(theta2);
  
  x3=r*sin(theta2)*cos(phi2);
  y3=r*sin(theta2)*sin(phi2);
  z3=r*cos(theta2);
  
  x4=r*sin(theta1)*cos(phi2);
  y4=r*sin(theta1)*sin(phi2);
  z4=r*cos(theta1);
  
  X1=[x1,x2,0];   %Faces
  Y1=[y1,y2,0];
  Z1=[z1,z2,0];
  
  X2=[x2,x3,0];
  Y2=[y2,y3,0];
  Z2=[z2,z3,0];
  
  X3=[x3,x4,0];
  Y3=[y3,y4,0];
  Z3=[z3,z4,0];
  
  X4=[x4,x1,0];
  Y4=[y4,y1,0];
  Z4=[z4,z1,0];
  
  X5=[x1,x2,x3,x4];
  Y5=[y1,y2,y3,y4];
  Z5=[z1,z2,z3,z4];
  a1=r/M;
  if a1>1
      a1=1;
  end
  
  C=[a1, a1, a1];     %Colour according to Number
  ColorSpec = a1*[1,0.5,0.5];
  fill3(X1,Y1,Z1,ColorSpec); %Plane-1,2,3,4 and Top Face
  fill3(X2,Y2,Z2,ColorSpec);
  fill3(X3,Y3,Z3,ColorSpec);
  fill3(X4,Y4,Z4,ColorSpec);
  fill3(X5,Y5,Z5,ColorSpec);
end

[Xs,Ys,Zs] = sphere(18);
hs = surf(M*Xs,M*Ys,M*Zs);
set(hs,'facecolor','none','edgecolor','b','edgealpha',0.2)
set(gca,{'xtick' 'ytick' 'ztick' 'vis' 'clim'},{[] [] [] 'on' [0 M]});
axis equal vis3d;
view(3);
drawnow;

function [R,Theta,PHI]=cart2sph_luxp2(ShapeData)
x=ShapeData(:,1);
y=ShapeData(:,2);
z=ShapeData(:,3);
R=sqrt(x.^2+y.^2+z.^2);
Theta=acos(z./R);
PHI=acos(x./sqrt(x.^2+y.^2));
Temp=PHI(y<0);
Temp=2*pi-Temp;
PHI(y<0)=Temp;
end


