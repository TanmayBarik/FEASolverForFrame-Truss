% FEA SOLVER 1D

u= zeros(6,1);               % generalized displacements
e= 3;                        % Number of elements  
B= zeros(e,2);               % Connectivity Matrix 

% No FOR loops for now call all iterations manually...
ele1 = LocalToGlobal(1,[1,2],B,10,144,10^6,1/72,1,10,pi/2);
ele2 = LocalToGlobal(1,[1,2],B,10,144,10^6,1/72,1,10,pi/2);

B= ele2(2);                  % update connectivity matrix at end of all iterations

AssembledStiffnessMatrix= AssembleStf(ele1,ele2,B);
AssembledForceMatrix= AssembleForce(ele1,ele2,B,BoundaryConditions);

Solution= Solver(AssembledStiffnessMatrix,AssembledForceMatrix);








