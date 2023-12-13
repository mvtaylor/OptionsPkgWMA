(* ::Package:: *)

BeginPackage["OptionsPkg`"];


Npdf::usage = "Npdf[x] returns the Standard Normal probability distribution function evaluated at x";
Ncdf::usage = "Ncdf[x] returns the Standard Normal cumulative distribution function evaluated at x";
Nicdf::usage = "Nicdf[x] returns the inverse of the Standard Normal CDF evaluated at x";
Nipdf::usage = "Nipdf[x] returns the inverse of the Standard Normal PDF evaluated at x, with the positive branch being chosen";
Cvalue::usage = "Cvalue[S, Ks, \[Tau], \[Sigma], r] returns the value of a call at spot price S, strike price Ks, with time to expiration \[Tau] years, annual risk free interest rate r, and IV \[Sigma]";
Pvalue::usage = "Pvalue[S, Ks, \[Tau], \[Sigma], r] returns the value of a call at spot price S, strike price Ks, with time to expiration \[Tau] years, annual risk free interest rate r, and IV \[Sigma]";


Begin["Private`"];


Npdf[x_] := PDF[NormalDistribution[], t] /. t -> x
Ncdf[x_] := CDF[NormalDistribution[], t] /. t -> x
Nicdf[x_]:=InverseCDF[NormalDistribution[], t]/.t->x
Nipdf[x_]:=Sqrt[Log[1/(2*\[Pi]*x^2)]] (* choosing positive branch arbitrarily *)
Cvalue[S_, Ks_, \[Tau]_, \[Sigma]_, r_] := 
 Ncdf[1/(\[Sigma] Sqrt[\[Tau]]) (Log[
        S/Ks] + (r + \[Sigma]^2/2)*\[Tau])]*S - 
  Ncdf[1/(\[Sigma] Sqrt[\[Tau]]) (Log[
         S/Ks] + (r + \[Sigma]^2/2)*\[Tau]) - \[Sigma]*
      Sqrt[\[Tau]]] Ks*Exp[-r*\[Tau]]
Pvalue[S_, Ks_, \[Tau]_, \[Sigma]_, r_]:=Ncdf[-(1/(\[Sigma] Sqrt[\[Tau]]) (Log[
       S/Ks] + (r + \[Sigma]^2/2)*\[Tau]) - \[Sigma]*Sqrt[\[Tau]])]*Ks*Exp[-r*\[Tau]]-Ncdf[-(1/(\[Sigma] Sqrt[\[Tau]]) (Log[
      S/Ks] + (r + \[Sigma]^2/2)*\[Tau]))]*S


End[];


EndPackage[];
