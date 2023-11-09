library(janitor)
library(tidyverse)

setwd('C:/Users/c23060968/OneDrive - Cardiff University/Documents/MAT021 Foundations of Operational Research and Analytics/Coursework/USAID')

raw_data <- read.csv('Supply_Chain_Shipment_Pricing_Data_20231104.csv') %>%
  clean_names()

str(raw_data)
length(unique(raw_data$id)) == nrow(raw_data)
table(raw_data$po_sent_to_vendor_date)
table(raw_data$fulfill_via)

sum(is.na(raw_data$scheduled_delivery_date))
sum(is.na(raw_data$delivered_to_client_date))
sum(is.na(raw_data$delivery_recorded_date))

data <- raw_data %>%
  mutate(po_sent_to_vendor_date = as.Date(po_sent_to_vendor_date, format = '%m/%d/%Y'),
         scheduled_delivery_date = as.Date(scheduled_delivery_date, format = '%d-%b-%y'),
         delivered_to_client_date = as.Date(delivered_to_client_date, format = '%d-%b-%y'),
         delivery_recorded_date = as.Date(delivery_recorded_date, format = '%d-%b-%y'),
         weight_kilograms = as.numeric(weight_kilograms),
         freight_cost_usd = as.numeric(freight_cost_usd),
         line_item_insurance_usd = as.numeric(line_item_insurance_usd))

sum(raw_data$po_sent_to_vendor_date %in% c('Date Not Captured', 'N/A - From RDC'))
sum(is.na(data$po_sent_to_vendor_date))
