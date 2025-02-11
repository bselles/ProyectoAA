#Utilizando los datasets de la carpeta ../datasets,
#entrena varios modelos con distintos valores de lambda y 
#genera una gr�fica mostrando las precisiones obtenidas 
#para cada valor de lambda.
function doTestCasesRN()
  posibles_lambda=[0.01,0.03,0.1,0.3,0.8,1,3,10];
  
  for i= 1:length(posibles_lambda) 
    #Para cambiar el n�mero de capas ocultas de la red neuronal, 
    #cambiar el segundo par�metro de aprendizajeRN.
    #Para cambiar el n�mero de iteraciones, el tercer par�metro.
    accuracy(i)=aprendizajeRN(posibles_lambda(i),100,100);
  endfor
 
  plot(posibles_lambda, accuracy, "linewidth", 3)

 
endfunction


