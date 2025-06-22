% B=ConnectivityMatrix | th= angle wrt x axis (radians) | GlobalNodes = [LeftNodeNum, RightNodeNum]
function ElementData = LocalToGlobal(ElementNumber,GlobalNodes,B,A,h,E,f,q,I,th)

mU= (A*h^2)/(2*I);          

BUpdated= B;                                 % Updated connectivity matrix BUpdated= B(GlobalNodes,ElementNumber)
BUpdated(ElementNumber,1)= GlobalNodes(1);         
BUpdated(ElementNumber,2)= GlobalNodes(2); 

f= [
    0.5*q*h; 
    0.5*f*h;
    (-1/12)*f*h^2;
    0.5*q*h;
    0.5*f*h;
    (1/12)*f*h^2
    ];

q= [q1 q2 q3 q4 q5 q6]';     % boundary conditions 
F= f+q;                      % generalized forces

K= ((2*E*I)/h^3)*[mU  0    0      -mU  0    0  ;
                  0   6   -3*h     0  -6   -3*h;
                  0  -3*h  2*h^2   0   3*h  h^2;
                 -mU  0    0       mU  0    0  ;
                  0  -6    3*h     0   6    3*h;
                  0  -3*h  h^2     0   3*h  2*h^2];  % stiffness matrix

T= [cos(th) sin(th) 0  0        0       0;
   -sin(th) cos(th) 0  0        0       0;
    0       0       1  0        0       0;
    0       0       0  cos(th)  sin(th) 0;
    0       0       0 -sin(th)  cos(th) 0;
    0       0       0  0        0       1]; % Transformation matrix


GlobalStiffnessMatrix= transpose(T)*K*T;
GlobalForceMatrix= transpose(T)*F;

ElementData= [GlobalStiffnessMatrix,GlobalForceMatrix,BUpdated];
end