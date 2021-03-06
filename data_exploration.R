library(readxl)
library(dplyr)

##Data exploration on IC50
DDR_IC50_raw <- read.csv("drive:/DDR_IC50_data_raw.csv", header = TRUE)
DDR_IC50_curated <- read.csv("drive:/DDR_03_bioactivity_IC50_data_curated.csv", header = TRUE)
merge1 <- merge(x = DDR_IC50_curated,y = DDR_IC50_raw, by = "molecule_chembl_id", all = TRUE)
write.csv(merge1, file ="merge_DDR_IC50_curated_DDR_IC50_raw.csv")
document_chembl_id <- unique(merge1$document_chembl_id)
write.csv(document_chembl_id, file= "document_chembl_id_IC50.csv")
molecule_chembl_id <- unique(DDR_IC50_curated$molecule_chembl_id)

##Data exploration on Ki
DDR_Ki_raw <- read.csv("drive:/DDR_01_bioactivity_Ki_data_raw.csv", header = TRUE)
DDR_Ki_curated <- read.csv("drive:/DDR_03_bioactivity_Ki_data_curated.csv", header = TRUE)
merge1_Ki <- merge(x = DDR_Ki_curated,y = DDR_Ki_raw, by = "molecule_chembl_id", all = TRUE)
write.csv(merge1_Ki, file ="merge_DDR_Ki_curated_DDR_Ki_raw.csv")
document_chembl_id <- unique(merge1_Ki$document_chembl_id)
write.csv(document_chembl_id, file= "document_chembl_id_Ki.csv")
molecule_chembl_id <- unique(DDR_Ki_curated$molecule_chembl_id)

##count bioactivity
bioactivity_IC50_intermediate <- DDR_IC50_curated %>%
  filter(class == "intermediate")
bioactivity_Ki_intermediate <- DDR_Ki_curated %>%
  filter(class == "intermediate")
count(bioactivity_IC50_intermediate)
count(bioactivity_Ki_intermediate)

##remove intermediate
bioactivity_IC50_active <- DDR_IC50_curated %>%
  filter(class == "active")
bioactivity_IC50_inactive <- DDR_IC50_curated %>%
  filter(class == "inactive")
bioactive_IC50_filtered <- rbind(bioactivity_IC50_active,bioactivity_IC50_inactive)
write.csv(bioactive_IC50_filtered, file = "DDR_IC50_curated_filtered.csv")
