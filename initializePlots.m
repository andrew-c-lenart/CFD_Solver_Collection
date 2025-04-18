function initializePlots()
figure(1)
%Theoretical results from literature
solutionRe400 = [1,.73837,.68439,.61756,.55892,.29093,.16256,.02135,-.11477,-.17119,-.32726,-.24299,-.14612,-.10338,-.09266,-.08186,0];
solutionRe100 = [1,.84123,.78871,.73722,.68717,.23151,.00332,-.13641,-.20581,-.21090,-.15662,-.10150,-.06434,-.04775,-.04192,-.03717,0];
nodeNumbers = [129,126,125,124,123,110,95,80,65,59,37,23,14,10,9,8,1];
solYPos = nodeNumbers./129;
scatter(solYPos,solutionRe100)
hold on
scatter(solYPos,solutionRe400)
hold on



figure(2)
%Theoretical results from literature
solutionRe400 = [0,-.12146,-.15663,-.19254,-.22847,-.23827,-.44993,-.38598,0.05186,.30174,.30203,.28124,.22965,.20920,.19713,.18360,0];
solutionRe100 = [0,-.05906,-0.07391,-0.08864,-0.10313,-0.16914,-0.22445,-0.24533,0.05454,0.17527,0.17507,0.16077,0.12317,0.10890,0.10091,0.09233,0];
nodeNumbers = [129,125,124,123,122,117,111,104,65,31,30,21,13,11,10,9,1];
solYPos = nodeNumbers./129;
scatter(solYPos,solutionRe100)
hold on
scatter(solYPos,solutionRe400)
hold on
end
