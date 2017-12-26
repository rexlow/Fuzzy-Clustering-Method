function z = member(D, q)
z = D*0 ;
SzD = size(D) ;
for Ptest = 1:SzD(1),
   OnTop = D(Ptest, :) == 0 ;
   if sum(OnTop) >= 1,
      z(Ptest, :) = OnTop./sum(OnTop);
   else
      p = 2/(q - 1) ;
      Sigma = sum(1./D(Ptest,:).^p);
      for Ptrain = 1:SzD(2),
         Mship = D(Ptest, Ptrain)^(-p)*(1/Sigma);
         z(Ptest, Ptrain) = Mship ;
      end ;
   end;
end;
