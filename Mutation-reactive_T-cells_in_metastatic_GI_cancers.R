# Immunogenicity of somatic mutations in human gastrointestinal cancers
# Originally published in Science Express on 29 October 2015, doi: 10.1126/science.aad1253
# Science 11 December 2015: vol. 350 no. 6266 1387-1390

library(rvest)
tdist <- read_html("http://www.sciencemag.org/content/350/6266/1387/T1.expansion.html")
crc <- tdist %>% html_node("#table-1") %>% html_table(header = TRUE) 
crc.sub <- crc %>% dplyr::select(1:3,8:11)
colnames(crc.sub) <- c("ID","Age/sex","Tumor","Mutated prot","Aa change","T cell type","Mut-react TCR in tumor %")
kable(crc.sub)
