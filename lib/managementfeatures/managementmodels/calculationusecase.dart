double total(double? add1,double? add2){
  return  add1! + add2!;
}

double percentprice(double? actualprice,double? dis){
    double ac = actualprice??0;
    double di = dis??0;
    return ac - (ac* 0.01 * di);

}
