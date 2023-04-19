# problem: the vendor provided p-value but no t-value nor effect size.
# problem: how many patients do we need to confidently evaluate performance?
# solution: convert the one-sided p-value to the corresponding t-statistic.
# the df for the t-distribution are n1+n2???2, where n1 and n2 are the group sizes. 
# example: if the one-sided p-value is 0.023 and n1 = 23 and n2 = 27, then t = 2.05.
# example: qt(.023, df = 23+27-2, lower.tail = F)

round(qt(0.01, df = 1864+1864-2, lower.tail = F), 2)
# t = 2.33

round(qt(1-0.01, 1863),2)
# t = 2.33
# d = t * sqrt(1/n1 + 1/n2)
round(2.33 *(sqrt(1/1864 + 1/1864)),2)
# d = 0.08

library(pwr)
pwr.t.test(d = 0.08, sig.level = 0.05, power = 0.80, type = c("two.sample"))
# power = the probability of finding an effect that is there
# so to have a 50/50 chance of finding the same effect size, we'd need 1200 members per group
# to have an 80% chance of finding the same effect size, we'd need 2400 members per group