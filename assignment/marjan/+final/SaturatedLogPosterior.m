function LogPosterior = SaturatedLogPosterior(parameter, data)
  A_easy= parameter(1);
  A_medium=parameter(2);
  A_hard=parameter(3);
  B_easy=parameter(4);
  B_medium=parameter(5);
  B_hard=parameter(6);

  DataE=data.easy;
  DataM=data.medium;
  DataH=data.hard;

  Loglikelihood_easy=-wbllike([A_easy, B_easy], DataE);
  Loglikelihood_medium=-wbllike([A_medium, B_medium], DataM);
  Loglikelihood_hard=-wbllike([A_hard, B_hard], DataH); 
  Loglikelihood= Loglikelihood_easy+Loglikelihood_medium+Loglikelihood_hard;

  lprior=-(parameter(1)+parameter(2)+parameter(3)+parameter(4)+parameter(5)+parameter(6));
  LogPosterior=lprior+Loglikelihood

end