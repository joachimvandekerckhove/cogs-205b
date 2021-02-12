%% Nelder-Mead Simplex
% An optimization algorithm that is widely used because it is very robust
% is the Nelder-Mean simplex algorithm. 
% To minimize the function $f( {x} )$,
% where ${x} \in {R}^{n}$, and starting from a set of
% points ${x}_{1},...,{x}_{n+1}$, proceed along these steps:
% 
%% 1. Order points according to the values at the vertices
% 
%% 2. Calculate the centroid of all points except ${x}_{n+1}$
% 
%% 3. Reflection
% 
% Compute reflected point 
% ${x}_{r}= {x}_{o}+\alpha ( {x}_{o}-{x}_{n+1})$
% with $\alpha >0$.  
% If the reflected point is better than the second worst, but not better
% than the best, i.e. 
% $f( {x}_{1})\leq f( {x}_{r})<f( {x}_{n})$,  
% then obtain a new simplex by replacing the worst point 
% ${x}_{n+1}$
% with the reflected point
% ${x}_{r}$
% , and go to
% step 1.  
%
%% 4. Expansion
% 
% If the reflected point is the best point so far, 
% $f( {x}_{r})<f( {x}_{1})$, 
% then compute the expanded point 
% ${x}_{e}= {x}_{o}+\gamma ( {x}_{r}-{x}_{o})$ 
% with $\gamma >1$.  
% If the expanded point is better than the reflected point, 
% $f( {x}_{e})<f( {x}_{r})$,  
% then obtain a new simplex by replacing the worst point 
% ${x}_{n+1}$
% with the expanded point 
% ${x}_{e}$
% and go to step
% 1;  
% else obtain a new simplex by replacing the worst point 
% ${x}_{n+1}$
% with the reflected point
% ${x}_{r}$
% and go to step
% 1.  
% 
%% 5. Contraction
% 
% Here it is certain that 
% $f( {x}_{r})\geq f( {x}_{n})$
% . (Note that 
% ${x}_{n}$ 
% is second or "next" to
% highest.)  
% Compute contracted point 
% 
% ${x}_{c}= {x}_{o}+\rho ( {x}_{n+1}- {x}_{o})$
% with 
% $0<\rho \leq 0.5$.  
% If the contracted point is better than the worst point, i.e. 
% $f({x}_{c})<f( {x}_{n+1})$,  
% then obtain a new simplex by replacing the worst point 
% ${x}_{n+1}$
% with the contracted point 
% ${x}_{c}$ and go to
% step 1;  
% 
%% 6. Shrink
% 
% Replace all points except the best (
% ${x}_{1}$) 
% with
% ${x}_{i}= {x}_{1}+\sigma( {x}_{i}- {x}_{1})$
% and go to step 1. 
% Note: 
% $\alpha$, $\gamma$, $\rho$, and $\sigma$
% are respectively the reflection, expansion, contraction and
% shrink coefficients. Standard values are $\alpha =1$, $\gamma=2$, $\rho =1/2$ 
% and $\sigma =1/2$.
% 
% 
% For the reflection, since 
% ${x}_{n+1}$ is the vertex with
% the higher associated value among the vertices, we can expect to find a
% lower value at the reflection of 
% ${x}_{n+1}$ in the
% opposite face formed by all vertices 
% ${x}_{i}$ except ${x}_{n+1}$.    
% 
% For the expansion, if the reflection point 
% ${x}_{r}$ is the
% new minimum along the vertices, we can expect to find interesting values
% along the direction from 
% ${x}_{o}$ to ${x}_{r}$.   
% 
% Concerning the contraction, if 
%     $f( {x}_{r})>f({x}_{n})$, we can expect that a better value will be inside the simplex
% formed by all the vertices ${x}_{i}$.  
%
%%
% Finally, the shrink handles the rare case that contracting away from the
% largest point increases $f$, something that cannot happen sufficiently
% close to a non-singular minimum. In that case we contract towards the
% lowest point in the expectation of finding a simpler landscape. However,
% Nash notes that finite-precision arithmetic can sometimes fail to
% actually shrink the simplex, and implemented a check that the size is
% actually reduced.
%

rng(1)
nm = NelderMead(@(x)sum(x.^2),randn(2,3))
nm.Solve()
nm.Solution()

