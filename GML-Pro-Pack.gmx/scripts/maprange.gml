var inputValue,inputMin,inputMax,outputMin,outputMax,p;
inputValue = argument0
inputMin = argument1
inputMax = argument2
outputMin = argument3
outputMax = argument4
p=(inputValue-inputMin)/(inputMax-inputMin);
outMax=outputMax-outputMin;
return outputMin+(p*outMax);
