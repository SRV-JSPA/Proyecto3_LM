% Derivadas básicas
derivar(X, X, 1).              % d/dx (x) = 1
derivar(C, _, 0) :- number(C). % d/dx (constante) = 0

% Derivadas de operaciones aritméticas
derivar(A + B, X, DA + DB) :- 
    derivar(A, X, DA), 
    derivar(B, X, DB).

derivar(A - B, X, DA - DB) :- 
    derivar(A, X, DA), 
    derivar(B, X, DB).

derivar(A * B, X, A * DB + B * DA) :- 
    derivar(A, X, DA), 
    derivar(B, X, DB).

derivar(A / B, X, (B * DA - A * DB) / (B * B)) :- 
    derivar(A, X, DA), 
    derivar(B, X, DB).

% Derivadas de funciones trigonométricas
derivar(sin(A), X, cos(A) * DA) :- 
    derivar(A, X, DA).

derivar(cos(A), X, -sin(A) * DA) :- 
    derivar(A, X, DA).

derivar(tan(A), X, (1 / (cos(A) * cos(A))) * DA) :- 
    derivar(A, X, DA).

derivar(atan(A), X, (1 / (1 + A * A)) * DA) :- 
    derivar(A, X, DA).

% Derivadas de funciones exponenciales y logarítmicas
derivar(exp(A), X, exp(A) * DA) :- 
    derivar(A, X, DA).

derivar(log(A), X, (1 / A) * DA) :- 
    derivar(A, X, DA).

% Regla de la cadena
derivar(A^N, X, N * A^(N-1) * DA) :- 
    number(N), 
    derivar(A, X, DA).