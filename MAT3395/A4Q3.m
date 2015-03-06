
function y = A4Q3
    fprintf('===');
    % plot the logistic equation
    % dV/dt = rV(1-V/k) r = 2, k = 100
    V = [0:0.1:110];
    r = 2; 
    k = 100;
    logistic = r * (V .* (1 - V/k));

    % plot the gompertz equation
    % dV/dt = V(a-b*ln(V))
    b = r;
    a = r*log(k);
    gompertz = V.*(a - b*log(V));
    subplot(1, 2, 1);
    plot(V, gompertz, 'k--', V, logistic, 'k', V, 0*V, 'k:');
    xlabel('Volume (V)');
    ylabel('Derivative of V');
    title('Gompertz and Logistic Equation');
    legend('Gompertz Equation', 'Logistic Equation', 'Location', 'southeast');
    
    function dV = gompertzEq(t, V)
        dV = zeros(1,1);
        dV(1) = V(1)*(a - b*log(V(1)));
    end

    function dy = logisticEq(t, y)
        dy = zeros(1,1);
        dy(1) = r * y(1) * (1 - y(1)/k);
    end
    
    timespan=[0:0.01:4];   
    initial=[1];        
    [T, gompertzSol] = ode45(@gompertzEq,timespan,initial);
    [T2, logisticSol] = ode45(@logisticEq,timespan,initial);
    subplot(1, 2, 2);
    plot(T, gompertzSol, 'k--', T2, logisticSol, 'k');
    xlabel('Time (arbitrary units)');
    ylabel('Tumour Volume (arbitrary units)');
    title('Solutions to Gompertz and Logistic Equations');
    legend('Gompertz Solution', 'Logistic Solution', 'Location', 'southeast');
end