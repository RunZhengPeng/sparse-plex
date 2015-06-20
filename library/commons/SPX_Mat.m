classdef SPX_Mat < handle

    methods(Static)
        function result = is_square(A)
            [m, n]  = size(A);
            result = (m == n);
        end

        function result = is_symmetric(A)
            result = SPX_Mat.is_square(A);
            if ~result
                return;
            end
            result =  all(all(A==A.'));
        end

        function result = is_hermitian(A)
            result = SPX_Mat.is_square(A);
            if ~result
                return;
            end
            result =  all(all(A==A'));
        end

        function result = is_positive_definite(A)
            result = SPX_Mat.is_hermitian(A);
            if ~result
                return;
            end
            % Perform Cholesky decomposition of A
            [R, p] = chol(A);
            result = (p == 0);
        end
        
        function X = off_diagonal_elements(X)
            % Returns a column vector of off diagonal elements
            [m, n] = size(X);
            idx = eye(m, n);
            X = X(~idx);
        end

        function X = off_diagonal_matrix(X)
            % Returns the matrix of off diagonal elements
            [m, n] = size(X);
            idx = eye(m, n);
            X = (1 - idx).* X;
        end

        function X = off_diag_upper_tri_elements(X)
            % Returns the upper triangular off diagonal elements in a vector
            [m, n] = size(X);
            idx = tril(ones(m, n));
            X = X(~idx);
        end

        function X = off_diag_upper_tri_matrix(X)
            % Returns the upper triangular off diagonal elements in a matrix
            [m, n] = size(X);
            idx = tril(ones(m, n));
            X = (1 - idx).* X;
        end

        function result = nonzero_density(X)
            % Density of nonzero entries in the matrix
            result = nnz(X) / numel(X);
        end

        function [ result ] = is_diagonally_dominant( A, strict)
        %ISDIAGONALLYDOMINANT Returns if A is a diagonally dominant
        %matrix
        if ~exist('strict', 'var')
            strict = true;
        end
        A = abs(A);
        % Extract the diagonal
        d = diag(A);
        % Set the diagonal elements to 0
        A(logical(eye(size(A)))) = 0;
        % Now sum over the rows
        s = sum(A, 2);
        % We now check whether 
        if strict
            result = all(d > s);
        else
            result = all(d >= s);
        end
        end

        function [ A ] = make_diagonally_dominant( A, strict )
        %MAKEDIAGONALLYDOMINANT Makes a matrix diagonally dominant
        if ~exist('strict', 'var')
            strict = true;
        end
        B = abs(A);
        % Set the diagonal elements to 0
        B(logical(eye(size(B)))) = 0;
        % Now sum over the rows
        s = sum(B, 2);
        if strict
            d = s + 1;
        else
            d = s;
        end
        % Extract the diagonal elements of A
        dd = diag(A);
        % Identify the ones which are not dominant
        requiredChanges = abs(dd) < d;
        % Assign the updated values
        dd(requiredChanges) = d(requiredChanges);
        % Update the matrix
        A(logical(eye(size(A)))) = dd;
        end



    end

end

