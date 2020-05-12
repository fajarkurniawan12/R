luasLingkaran = function(r){
  pi = 3.14
  luas = pi*r^2
  return(luas)
}

luasPersegi = function(p,l){
  luas = p*l
  return(luas)
}

luasSegitiga = function(a,t){
  return(a*t/2)
}

berhitung = function(z){
  for (x in 1:z) {
    print(x)
  }
}