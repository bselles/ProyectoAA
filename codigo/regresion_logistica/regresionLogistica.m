#Funci�n que implementa la regresi�n log�stica.
#Utilizar� la lambda y el n�mero de iteraciones proporcionados por el usuario.
function percentage = regresionLogistica(lambda,numIter)
  #Para eliminar los warnings en el uso de fmincg.
  warning('off','all');   
  
  #Cargamos el dataset y separamos los ejemplos de entrenamiento de 
  #los resultados.
  X=load('../datasets/x.csv'); 
  y=X(:,end);
  
  #A cada soluci�n le asociamos una clase: normal, bueno o estrella.
  y=translateClasses(y);  
  X=X(:,1:end-1);
  all_theta=oneVsAll(X,y,3,lambda,numIter);
  
  #Cargamos los datos de validaci�n, con los que probaremos la precisi�n
  #del sistema.
  X=load('../datasets/xval.csv'); 
  y=X(:,end);
  y=translateClasses(y);  
  X=X(:,1:end-1);
  
  
  #A�adimos una columna de unos (la primera por la izquierda)
  X=[ones(rows(X),1) X];
  hipotesis = sigmoide(X*all_theta');
  
  #Obtenemos las etiquetas por las que se obtiene el valor m�ximo.
  #https://octave.sourceforge.io/octave/function/max.html
  [max, result] =max(hipotesis, [] ,2);
  
  #Calculamos el porcentage de aciertos y los devolvemos.
  result=(result==y);
  percentage = (sum(result)*100)/rows(X);
endfunction

