
install.packages("dplyr")
install.packages("remotes")
remotes::install_github("mrcieu/ieugwasr")
remotes::install_github("mrcieu/TwoSampleMR")
remotes::install_github("explodecomputer/plinkbinr")
# 链接：https://pan.baidu.com/s/1jOQoSy4mCUpdEysj8Df9YA?pwd=z4j3 
# 提取码：z4j3 

# F:/本地clump/1kg.v3/EUR


library(dplyr)
library(TwoSampleMR)
library(ieugwasr)



exp_data <- extract_instruments(outcomes = c('ieu-a-2','ieu-a-300'),clump = F)



out <- ieugwasr::ld_clump(dplyr::tibble(rsid=exp_data$SNP, pval=exp_data$pval.exposure,id = exp_data$id.exposure),
                          clump_kb = 10000,
                          clump_r2 = 0.001,
                          clump_p = 1,
                          plink_bin = plinkbinr::get_plink_exe(),
                          bfile = "F:/本地clump/1kg.v3/EUR",
                          pop = "EUR")
keep <- paste(exp_data$SNP,exp_data$id.exposure) %in% paste(out$rsid,out$id)
exp_clumped <- exp_data[keep,]


















