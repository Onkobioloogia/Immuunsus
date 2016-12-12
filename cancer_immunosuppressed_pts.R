transplants <- read.table(
textConnection("site, observed, expected
'non melanoma skin', 127, 5.1
'thyroid other endocrine', 30, 2.1
'mouth tongue lip',22,1.6
'cervix vulva vagina',39,3.6
'non-Hodgkins lymphoma',25,2.4
'kidney ureter',32,3.5
'bladder',26,4.7
'colorectal',38,10.5
'lung',30,12.5
'brain',10,4.1
'prostate',11,5.2
'melanoma',7,4.1
'breast',15,13.6")
, header = T, sep = ",")

library(dplyr)
transplants <- transplants %>% mutate(ratio = expected/observed)

library(MASS)
params <- fitdistr(transplants$ratio, densfun = "beta", start = list(shape1 = 0.8, shape2 = 2))$estimate

trcan <- transplants %>% 
  mutate(eb_ratio = (expected + params[1])/(observed + params[1] + params[2]),
                       eb_increase = round(1/eb_ratio, 1)) %>% 
  dplyr::select(site, observed, expected, eb_increase)

library(knitr)
kable(trcan, col.names = c("Site of cancer", "Nr. cases observed", "Nr. cases expected", "Ratio obs/exp (adj)"))
                       