*DIANTI FARHANA KAMASELA
*ASSIGNMENT 1 - 2022 / 05/ 15

*---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


*QUESTION.1


*Q1.1. Input by each indices

Set
  i   /i1*i2/
  j   /j1*j2/

Parameter
        X1 (i,j);

        X1 ("i1", "j1")=1;
        X1 ("i1", "j2")=0;
        X1 ("i2", "j1")=0;
        X1 ("i1", "j2")=1;
display X1;





*Q1.2. Input by Table

Table
    X2 (i,j)
        j1      j2
i1      1       0
i2      0       1

;
Display X2;





*Q1.3. Input from excel

Parameter
    X3  (i,j);

*$libinclude xlimport X3 sample_table.xls    Z2_2!; still cannot sorry
*display X3;

*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


*QUESTION.2



*Q2.1

Set

    o   /o1*o3/
    p   /p1*p3/
    q   /q1*q2/
    r   /r1*r4/
    ;
    


table   A(o,p)
        p1      p2      p3
o1      1       0       1
o2      0       2       1
o3      3       2       4
;

table   B(o,p)
        p1      p2      p3
o1      0       1       3
o2      1       1       2
o3      2       1       0
;

table   C(q,p)
        p1      p2      p3
q1      3       1       0
q2      0       1       2
;

table   D(p,r)
        r1      r2      r3      r4
p1      1       1       1       4
p2      1       1       3       0
p3      2       0       0       2
;

*Q2.1
scalar ab;
ab=sum((o,p),A(o,p)*B(o,p));
display ab;


*Q2.2
Parameter cd(q,r);
cd(q,r)=sum(p,C(q,p)*D(p,r));
display cd;

*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


*QUESTION.3 This table shows CO2 emissions in 15 countries and other regions in 2000 (EDGAR32FT2000)


Set country         /Japan, Korea, China, Indonesia, India, USA, Canada, Mexico, Brazil, England, France, Germany, Italy, Ukuraina, Russia, Otherregions/
    Region          /"Asia", "North America", "Middle and South Amaerica", "EU", "USSR","other"/

;


parameter
         CO2_Emission(country)
         ;
         CO2_Emission('Japan')           = 1320  ;
         CO2_Emission('Korea')           = 477   ;
         CO2_Emission('China')           = 3859  ;
         CO2_Emission('Indonesia')       = 515   ;
         CO2_Emission('India')           = 1261  ;
         CO2_Emission('USA')             = 6228  ;
         CO2_Emission('Canada')          = 585   ;
         CO2_Emission('Mexico')          = 494   ;
         CO2_Emission('Brazil')          = 1127  ;
         CO2_Emission('England')         = 601   ;
         CO2_Emission('France')          = 443   ;
         CO2_Emission('Germany')         = 969   ;
         CO2_Emission('Italy')           = 485   ;
         CO2_Emission('Ukuraina')         = 419   ;
         CO2_Emission('Russia')          = 1822  ;
         CO2_Emission('Otherregions')   = 9307  ;

set
         map1(country,region) /
         Japan                          . "Asia"
         Korea                          . "Asia"
         China                          . "Asia"
         Indonesia                      . "Asia"
         India                          . "Asia"
         USA                            . "North America"
         Canada                         . "North America"
         Mexico                         . "Middle and South Amaerica"
         Brazil                         . "Middle and South Amaerica"
         England                        . "EU"
         France                         . "EU"
         Germany                        . "EU"
         Italy                          . "EU"
         Ukuraina                       ."USSR"
         Russia                         . "USSR"
         Otherregions                  . "other"/
         ;
         

         ;
*Q3.1 Aggregate them into CO2 emissions of regions
parameter
         RegionCO2_Emission(region)
         ;
         RegionCO2_Emission(region)= sum(map1(Country,Region),
                                 CO2_Emission(Country));
   

* Q3.2 Calculate total emission of EU, North America, Japan using a part of indices.

parameter
      EU_NorthAmerica_Japan_CO2 ;
      EU_NorthAmerica_Japan_CO2 = RegionCO2_Emission("EU")+ RegionCO2_Emission("North America")
                                         + CO2_Emission("Japan");


* Q3.3 Write output in the lst file
display  RegionCO2_Emission, EU_NorthAmerica_Japan_CO2












