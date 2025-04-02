% === File 6: hermite_quadrature.m ===
function [x, w] = hermite_quadrature(N)
    % Generates N-point Gauss-Hermite quadrature nodes and weights
    % Based on Golub-Welsch algorithm using eigenvalues of Jacobi matrix

    i = (1:N-1)';
    a = sqrt(i/2);                  % Subdiagonal elements
    J = diag(a,1) + diag(a,-1);     % Symmetric tridiagonal matrix

    [V, D] = eig(J);                % Eigenvalue decomposition
    x = diag(D);                    % Nodes (roots)
    w = V(1,:).^2 * sqrt(pi);       % Weights
end