library(tidyverse)
library(shiny)
library(shinythemes)
fluidPage()

payroll <- read_csv("/home/m280data/la_payroll/City_Employee_Payroll.csv")
head(payroll)
str(payroll)

### Question 1.2 ###
TotPay_w <- payroll %>% 
  group_by(Year) %>% 
  summarise(base = sum(as.numeric(`Base Pay`), na.rm = TRUE), 
            over = sum(as.numeric(`Overtime Pay`), na.rm = TRUE),
            other = sum(as.numeric(`Other Pay (Payroll Explorer)`), 
                        na.rm = TRUE),
            total = sum(base, over, other))
TotPay <- gather(TotPay_w, category, payment, base:other, factor_key=TRUE)
write_rds(TotPay, "hw3/LAPayroll_Shiny/TotPay.rds")

### Question 1.3 ###
HighestPay <- payroll %>% 
  select(Year, `Department Title`, `Total Payments`, `Job Class Title`, 
         `Base Pay`, `Overtime Pay`, `Other Pay (Payroll Explorer)`) %>% 
  arrange(Year, desc(as.numeric(`Total Payments`))) 
write_rds(HighestPay, "hw3/LAPayroll_Shiny/HighestPay.rds")

HighestPay <- payroll %>% 
  select(Year, `Department Title`, `Job Class Title`, `Total Payments`, `Base Pay`,
         `Overtime Pay`,`Other Pay (Payroll Explorer)`) %>% 
  arrange(Year, desc(as.numeric(gsub("\\$", "", `Total Payments`)))) 
write_rds(HighestPay, "hw3/LAPayroll_Shiny/HighestPay.rds")

### Question 1.4 ###
MeanPay <- payroll %>% 
  group_by(Year, `Department Title`) %>% 
  summarise(`Mean Total Pay` = mean(`Total Payments`, na.rm = TRUE), 
            `Mean Base Pay` = mean(as.numeric(`Base Pay`), na.rm = TRUE), 
            `Mean Overtime Pay` = mean(as.numeric(`Overtime Pay`), 
                                       na.rm = TRUE),
            `Mean Other Pay` = mean(as.numeric(`Other Pay (Payroll Explorer)`), 
                                    na.rm = TRUE)) %>% 
  arrange(Year, desc(`Mean Total Pay`))
write_rds(MeanPay, "hw3/LAPayroll_Shiny/MeanPay.rds")

### Question 1.4 ###
MedPay <- payroll %>% 
  group_by(Year, `Department Title`) %>% 
  summarise(`Median Total Pay` = median(`Total Payments`, na.rm = TRUE), 
            `Median Base Pay` = median(as.numeric(`Base Pay`), na.rm = TRUE), 
            `Median Overtime Pay` = median(as.numeric(`Overtime Pay`), 
                                       na.rm = TRUE),
            `Median Other Pay` = median(
              as.numeric(`Other Pay (Payroll Explorer)`), na.rm = TRUE)) %>% 
  arrange(Year, desc(`Median Total Pay`))
write_rds(MedPay, "hw3/LAPayroll_Shiny/MedPay.rds")

### Question 1.5 ###
HighestCost <- payroll %>% 
  group_by(Year, `Department Title`) %>%
  summarise(`Total Pay` =  sum(as.numeric(`Total Payments`),
                               na.rm = TRUE),
            `Base Pay` = sum(as.numeric(`Base Pay`), 
                             na.rm = TRUE),
            `Overtime Pay` = sum(as.numeric(`Overtime Pay`),
                                 na.rm = TRUE),
            `Other Pay` =  sum(as.numeric(`Other Pay (Payroll Explorer)`),
                               na.rm = TRUE),
            `Total Cost` = sum(as.numeric(`Average Benefit Cost`),
                               na.rm = TRUE)) %>% 
  arrange( Year, desc( `Total Cost` )) %>% 
  select(Year, `Department Title`, `Total Pay`, `Base Pay`, 
         `Overtime Pay`, `Other Pay`, `Total Cost`)
write_rds(HighestCost, "hw3/LAPayroll_Shiny/HighestCost.rds")

### Question 1.6 ###
HighestAnnual <- payroll %>% 
  group_by(Year, `Department Title`, `Job Class Title`) %>%
  summarise(`Mean Annual Salary` =  mean(as.numeric(`Projected Annual Salary`),
                               na.rm = TRUE),
            `Mean Hourly/Event Rate` = mean(as.numeric(`Hourly or Event Rate`), 
                             na.rm = TRUE)) %>% 
  arrange( Year, desc(`Mean Annual Salary`)) 
write_rds(HighestAnnual, "hw3/LAPayroll_Shiny/HighestAnnual.rds")

runApp("hw3/LAPayroll_Shiny/")
rsconnect::setAccountInfo(name='edwardmjyu',
                          token='3176DCF91E8F9DAF8EDEDF70140B38F3',
                          secret='V7Y0DUVoOEKVgFVCttolHtsmsfefBDvBUnw3/x6X')
library(rsconnect)
rsconnect::deployApp('hw3/LAPayroll_Shiny/')
