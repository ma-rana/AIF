%Oranges are food
%Steaks are food
%Apples are food
%Chocolate is food
%Fred eats oranges
%Fred eats steaks
%Tony eats apples
%John eats apples
%John eats chocolate.
food(oranges).
food(steaks).
food(apples).
eat(oranges,fred).
eat(steaks,fred).
eat(apples, tony).
eat(apples,john).
eat(chocolate, john).

% a) Is an apple food? => true
% b) What is food? => oranges,steaks,apples
% c) What does Fred eat? => oranges,steaks
% d) What does John eat? => apples,chocolate 
% e) Who eats apples? => tony, john