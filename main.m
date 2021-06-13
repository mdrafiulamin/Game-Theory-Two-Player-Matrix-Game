%non co-operative game theory
%Md. Rafiul Amin
%PSID: 1637374

%% Given matrix

A = [3, 0; -1 1];

%% simulated outcome
NumberOfBernouliExp = 1000;

X = []; Y = []; Z = [];

p1 = 0:0.02:1;
p2 = 0:0.02:1;
outcome = [];
for l = 1:length(p1)
    for m = 1:length(p2)
        for exp_id = 1:NumberOfBernouliExp
        % we take 1-p and to denote 
        % the probability of success in binornd
        % as p is the probability of selecting zero
        i = binornd(1,1-p1(l)) + 1; 
        j = binornd(1,1-p2(m)) + 1;
        outcome_arr(exp_id) = A(i,j);
        end
        outcome(l,m) = mean(outcome_arr);
    end
end
figure,mesh(p1, p2, outcome);
xlabel('p_1','fontsize',18);
ylabel('p_2','fontsize',18);
zlabel('Outcome','fontsize',18);

%% Given matrix
A = [3, 0; -1 1];
%% Analytical expression for the outcome using probability

outcome_fnc = @(x,y)(x*y*A(1,1)+(1-x)*y*A(2,1)+(1-x)*(1-y)*A(2,2)+(x)*(1-y)*A(1,2));

p1 = 0:0.001:1;
p2 = 0:0.001:1;
for l = 1:length(p1)
    for m = 1:length(p2)
        outcome(l,m) = outcome_fnc(p1(l),p2(m));
    end
end

figure, mesh(p1, p2, outcome); 
xlabel('p_1','fontsize',18);
ylabel('p_2','fontsize',18);
zlabel('Outcome','fontsize',18);