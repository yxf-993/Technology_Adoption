


# Fig 1 -------------------------------------------------------------------


setwd("~/Desktop/2022-Technology reduce insecurity/R&R/figure")
load('Summer_Cost.Rdata')

HP_2020 <- EnergyCost %>% filter(Year == 2020)

Fig1a <- ggplot(HP_2020, aes(x = factor(VINCOME), y = Cost, fill = factor(Heatpump))) +
  geom_boxplot(alpha = 0.8) +
  scale_fill_manual(values = c("1" = "#5A5AC8", "0" = "#FCFFA4FF"),  
                    labels = c("0" = "No Heat Pump", "1" = "Heat Pump")) +  
  stat_summary(fun = median, geom = "text", aes(label = sprintf("%.0f", ..y..)), 
               vjust = -2.5, color = "black", position = position_dodge(width = 0.8)) +
  theme_minimal() +
  labs(x = "Income Group", y = "Energy Spending ($)", title = "Year 2020 Summer ") +
  theme_bw(base_size = 14, base_family = "Arial") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        legend.position = c(0.15, 0.8),
        legend.background = element_rect(fill = "transparent", colour = NA),
        legend.title = element_blank(),  
        legend.text = element_text(size = 9),
        panel.grid.major = element_line(color = "gray92", size = 0.1),
        panel.grid.minor = element_line(color = "gray93", size = 0.1))


ggsave("Fig_1a.pdf", plot = Fig1a, 
       width = 8, height = 6, units = "in", dpi = 600, device = cairo_pdf)

HP_2021 <- EnergyCost %>% filter(Year == 2021)
Fig1b <- ggplot(HP_2021, aes(x = factor(VINCOME), y = Cost, fill = factor(Heatpump))) +
  geom_boxplot(alpha = 0.8) +
  scale_fill_manual(values = c("1" = "#5A5AC8", "0" = "#FCFFA4FF"),  
                    labels = c("0" = "No Heat Pump", "1" = "Heat Pump")) +  
  stat_summary(fun = median, geom = "text", aes(label = sprintf("%.0f", ..y..)), 
               vjust = -2.5, color = "black", position = position_dodge(width = 0.8)) +
  theme_minimal() +
  labs(x = "Income Group", y = "Energy Spending ($)", title = "Year 2021 Summer") +
  theme_bw(base_size = 14, base_family = "Arial") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        legend.position = c(0.15, 0.8),
        legend.background = element_rect(fill = "transparent", colour = NA),
        legend.title = element_blank(),  
        legend.text = element_text(size = 9),
        panel.grid.major = element_line(color = "gray92", size = 0.1),
        panel.grid.minor = element_line(color = "gray93", size = 0.1))

ggsave("Fig_1b.pdf", plot = Fig1b, 
       width = 8, height = 6, units = "in", dpi = 600, device = cairo_pdf)


load('Winter_Cost.Rdata')
HP_2020 <- EnergyCost %>% filter(Year == 2020)
Fig1c <- ggplot(HP_2020, aes(x = factor(VINCOME), y = Cost, fill = factor(Heatpump))) +
  geom_boxplot(alpha = 0.8) +
  scale_fill_manual(values = c("1" = "#A52C60FF", "0" = "#FCFFA4FF"),  
                    labels = c("0" = "No Heat Pump (Mainly Gas)", "1" = "Heat Pump")) +  
  stat_summary(fun = median, geom = "text", aes(label = sprintf("%.0f", ..y..)), 
               vjust = -2.5, color = "black", position = position_dodge(width = 0.8)) +
  theme_minimal() +
  labs(x = "Income Group", y = "Electric Spending ($)", title = "Year 2020 Winter ") +
  theme_bw(base_size = 14, base_family = "Arial") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        legend.position = c(0.2, 0.8),
        legend.background = element_rect(fill = "transparent", colour = NA),
        legend.title = element_blank(),  
        legend.text = element_text(size = 9),
        panel.grid.major = element_line(color = "gray92", size = 0.1),
        panel.grid.minor = element_line(color = "gray93", size = 0.1))

ggsave("Fig_1c.pdf", plot = Fig1c, 
       width = 8, height = 6, units = "in", dpi = 600, device = cairo_pdf)


HP_2021 <- EnergyCost %>% filter(Year == 2021)
Fig1d <- ggplot(HP_2021, aes(x = factor(VINCOME), y = Cost, fill = factor(Heatpump))) +
  geom_boxplot(alpha = 0.8) +
  scale_fill_manual(values = c("1" = "#A52C60FF", "0" = "#FCFFA4FF"),  
                    labels = c("0" = "No Heat Pump (Mainly Gas)", "1" = "Heat Pump")) +  
  stat_summary(fun = median, geom = "text", aes(label = sprintf("%.0f", ..y..)), 
               vjust = -2.5, color = "black", position = position_dodge(width = 0.8)) +
  theme_minimal() +
  labs(x = "Income Group", y = "Electric Spending ($)", title = "Year 2021 Winter") +
  theme_bw(base_size = 14, base_family = "Arial") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        legend.position = c(0.2, 0.8),
        legend.background = element_rect(fill = "transparent", colour = NA),
        legend.title = element_blank(),  
        legend.text = element_text(size = 9),
        panel.grid.major = element_line(color = "gray92", size = 0.1),
        panel.grid.minor = element_line(color = "gray93", size = 0.1))

ggsave("Fig_1d.pdf", plot = Fig1d, 
       width = 8, height = 6, units = "in", dpi = 600, device = cairo_pdf)



# Fig 2 -------------------------------------------------------------------

setwd("~/Desktop/2022-Technology reduce insecurity/R&R_2/Data") #data path
load('Figure3_0525.Rdata')


DF <- DF %>%
  mutate(HP = if_else(VACTYPE == "Heat pump", 1, 0))

#### 2019 ####
# plot year 2019 CBP and CS

HP_2019 <- DF %>% filter(V8 == 2019)


ggplot(HP_2019, aes(x = factor(VINCOME), y = CBP, fill = factor(HP))) +
  geom_boxplot(alpha = 0.8) +
  scale_fill_manual(values = c("1" = "#38AAACCC", "0" = "#F4ECD8CC"),  
                    labels = c("0" = "No Heat Pump", "1" = "Heat Pump")) +
  stat_summary(fun = median, geom = "text", aes(label = sprintf("%.2f", ..y..)), 
               vjust = -0.5, color = "black", position = position_dodge(width = 0.8)) +
  theme_minimal() +  
  labs(x = "Income Group", y = "Cooling Balance Point (°C)", title = "Year 2019") +
  theme_bw(base_size = 14, base_family = "Arial") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        legend.position = c(0.15, 0.08),
        legend.background = element_rect(fill = "transparent", colour = NA),
        legend.title = element_blank(),  
        legend.text = element_text(size = 9),
        panel.grid.major = element_line(color = "gray92", size = 0.1),
        panel.grid.minor = element_line(color = "gray93", size = 0.1))

ggsave("Fig_2a.pdf", 
       width = 8, height = 6, units = "in", dpi = 600, device = cairo_pdf)



ggplot(HP_2019, aes(x = factor(VINCOME), y = S3, fill = factor(HP))) +
  geom_boxplot(alpha = 0.8) +
  scale_fill_manual(values = c("1" = "#38AAACCC", "0" = "#F4ECD8CC"),  
                    labels = c("0" = "No Heat Pump", "1" = "Heat Pump")) +
  stat_summary(fun = median, geom = "text", aes(label = sprintf("%.2f", ..y..)), 
               vjust = -0.5, color = "black", position = position_dodge(width = 0.8)) +
  theme_minimal() +  
  labs(x = "Income Group", y = "Cooling Slope (kWh/°C)", title = "Year 2019") +
  theme_bw(base_size = 14, base_family = "Arial") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        legend.position = c(0.15, 0.8),
        legend.background = element_rect(fill = "transparent", colour = NA),
        legend.title = element_blank(),  
        legend.text = element_text(size = 9),
        panel.grid.major = element_line(color = "gray92", size = 0.1),
        panel.grid.minor = element_line(color = "gray93", size = 0.1))

ggsave("Fig_2b.pdf", 
       width = 8, height = 6, units = "in", dpi = 600, device = cairo_pdf)



#### 2020 ####
HP_2020 <- DF %>% filter(V8 == 2020)


ggplot(HP_2020, aes(x = factor(VINCOME), y = CBP, fill = factor(HP))) +
  geom_boxplot(alpha = 0.8) +
  scale_fill_manual(values = c("1" = "#38AAACCC", "0" = "#F4ECD8CC"),  
                    labels = c("0" = "No Heat Pump", "1" = "Heat Pump")) +
  stat_summary(fun = median, geom = "text", aes(label = sprintf("%.2f", ..y..)), 
               vjust = -0.5, color = "black", position = position_dodge(width = 0.8)) +
  theme_minimal() +  
  labs(x = "Income Group", y = "Cooling Balance Point (°C)", title = "Year 2020") +
  theme_bw(base_size = 14, base_family = "Arial") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        legend.position = c(0.15, 0.08),
        legend.background = element_rect(fill = "transparent", colour = NA),
        legend.title = element_blank(),  
        legend.text = element_text(size = 9),
        panel.grid.major = element_line(color = "gray92", size = 0.1),
        panel.grid.minor = element_line(color = "gray93", size = 0.1))
ggsave("Fig_2c.pdf", 
       width = 8, height = 6, units = "in", dpi = 600, device = cairo_pdf)


ggplot(HP_2020, aes(x = factor(VINCOME), y = S3, fill = factor(HP))) +
  geom_boxplot(alpha = 0.8) +
  scale_fill_manual(values = c("1" = "#38AAACCC", "0" = "#F4ECD8CC"),  
                    labels = c("0" = "No Heat Pump", "1" = "Heat Pump")) +
  stat_summary(fun = median, geom = "text", aes(label = sprintf("%.2f", ..y..)), 
               vjust = -0.5, color = "black", position = position_dodge(width = 0.8)) +
  theme_minimal() +  
  labs(x = "Income Group", y = "Cooling Slope (kWh/°C)", title = "Year 2020") +
  theme_bw(base_size = 14, base_family = "Arial") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        legend.position = c(0.15, 0.8),
        legend.background = element_rect(fill = "transparent", colour = NA),
        legend.title = element_blank(),  
        legend.text = element_text(size = 9),
        panel.grid.major = element_line(color = "gray92", size = 0.1),
        panel.grid.minor = element_line(color = "gray93", size = 0.1))
ggsave("Fig_2d.pdf", 
       width = 8, height = 6, units = "in", dpi = 600, device = cairo_pdf)


#### 2021 ####
HP_2021 <- DF %>% filter(V8 == 2021)


ggplot(HP_2021, aes(x = factor(VINCOME), y = CBP, fill = factor(HP))) +
  geom_boxplot(alpha = 0.8) +
  scale_fill_manual(values = c("1" = "#38AAACCC", "0" = "#F4ECD8CC"),  
                    labels = c("0" = "No Heat Pump", "1" = "Heat Pump")) +
  stat_summary(fun = median, geom = "text", aes(label = sprintf("%.2f", ..y..)), 
               vjust = -0.5, color = "black", position = position_dodge(width = 0.8)) +
  theme_minimal() +  
  labs(x = "Income Group", y = "Cooling Balance Point (°C)", title = "Year 2021") +
  theme_bw(base_size = 14, base_family = "Arial") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        legend.position = c(0.15, 0.08),
        legend.background = element_rect(fill = "transparent", colour = NA),
        legend.title = element_blank(),  
        legend.text = element_text(size = 9),
        panel.grid.major = element_line(color = "gray92", size = 0.1),
        panel.grid.minor = element_line(color = "gray93", size = 0.1))

ggsave("Fig_2e.pdf", 
       width = 8, height = 6, units = "in", dpi = 600, device = cairo_pdf)


ggplot(HP_2021, aes(x = factor(VINCOME), y = S3, fill = factor(HP))) +
  geom_boxplot(alpha = 0.8) +
  scale_fill_manual(values = c("1" = "#38AAACCC", "0" = "#F4ECD8CC"),  
                    labels = c("0" = "No Heat Pump", "1" = "Heat Pump")) +
  stat_summary(fun = median, geom = "text", aes(label = sprintf("%.2f", ..y..)), 
               vjust = -0.5, color = "black", position = position_dodge(width = 0.8)) +
  theme_minimal() +  
  labs(x = "Income Group", y = "Cooling Slope (kWh/°C)", title = "Year 2021") +
  theme_bw(base_size = 14, base_family = "Arial") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        legend.position = c(0.15, 0.8),
        legend.background = element_rect(fill = "transparent", colour = NA),
        legend.title = element_blank(),  
        legend.text = element_text(size = 9),
        panel.grid.major = element_line(color = "gray92", size = 0.1),
        panel.grid.minor = element_line(color = "gray93", size = 0.1))

ggsave("Fig_2f.pdf", 
       width = 8, height = 6, units = "in", dpi = 600, device = cairo_pdf)



# Fig 3 -------------------------------------------------------------------
# these results from stata reg (table S10)
reg_results <- data.frame(
  Outcome = rep(c("CBP", "CS"), each = 6),
  Variable = rep(c("Heat Pump", "Income", "Dwelling Size", "Age", "Ethnic", "Dwelling Age"), 2),
  Coefficient = c(
    -0.9956776, -0.0238853, 0.0071317, 0.0197583, -0.1336504, 0.0116964,
    -0.4761426, -0.0676433, 0.3122284, -0.0851437, -0.3315263, 0.0004923
  ),
  StdErr = c(
    0.0993851, 0.0213601, 0.0369836, 0.0319892, 0.1157113, 0.0029884,
    0.054885, 0.0114332, 0.0289603, 0.0169835, 0.0609984, 0.0017391
  ),
  CI_Lower = c(
    -1.190469, -0.0657504, -0.0653549, -0.0429394, -0.3604404, 0.0058393,
    -0.5837152, -0.0900520, 0.2554674, -0.1184307, -0.4510809, -0.0029162
  ),
  CI_Upper = c(
    -0.8008864, 0.0179798, 0.0796183, 0.0824559, 0.0931397, 0.0175535,
    -0.3685700, -0.0452347, 0.3689895, -0.0518567, -0.2119717, 0.0039008
  )
)



dodge_width <- 0.6  

main_df <- reg_results %>% filter(Variable == "Heat Pump")
controls_df <- reg_results %>% filter(Variable != "Heat Pump")


main_plot <- ggplot(main_df, aes(x = Coefficient, y = Variable, color = Outcome)) +
  geom_point(size = 2.5, shape = 16, position = position_dodge(width = dodge_width)) +
  geom_errorbarh(aes(xmin = CI_Lower, xmax = CI_Upper), height = 0.2, linewidth = 0.5,
                 position = position_dodge(width = dodge_width)) +
  geom_vline(xintercept = 0, linetype = "dashed", color = "red", size = 0.5) +
  geom_text(aes(label = sprintf("%.3f", Coefficient)),
            position = position_dodge(width = dodge_width), vjust = -1, size = 3) +
  scale_color_manual(values = c("CBP" = "#38AAACEE", "CS" = "#C4A080")) +
  labs(title = "Heat Pump Main Effect", x = "Coefficient", y = NULL) +
  theme_bw(base_size = 14, base_family = "Arial") +
  theme(
    plot.title = element_text(size = 14, hjust = 0),
    panel.grid.major = element_line(color = "gray92", size = 0.1),
    panel.grid.minor = element_line(color = "gray93", size = 0.1)
  )+
  guides(color = guide_legend(override.aes = list(label = "")))
ggsave("Fig_3a.pdf", plot = main_plot, width = 10, height = 2, dpi = 900, units = "in", device = cairo_pdf)

controls_plot <- ggplot(controls_df, aes(x = Coefficient, y = Variable, color = Outcome)) +
  geom_point(size = 2.5, shape = 16, position = position_dodge(width = dodge_width)) +
  geom_errorbarh(aes(xmin = CI_Lower, xmax = CI_Upper), height = 0.2, linewidth = 0.5,
                 position = position_dodge(width = dodge_width)) +
  geom_vline(xintercept = 0, linetype = "dashed", color = "red", size = 0.5) +
  geom_text(aes(label = sprintf("%.3f", Coefficient)),
            position = position_dodge(width = dodge_width), vjust = -1, size = 3) +
  scale_color_manual(values = c("CBP" = "#38AAACEE", "CS" = "#C4A080")) +
  labs(title = "Controls", x = "Coefficient", y = NULL) +
  theme_bw(base_size = 14, base_family = "Arial") +
  theme(
    plot.title = element_text(size = 14, hjust = 0),
    legend.text = element_text(size = 9),
    panel.grid.major = element_line(color = "gray92", size = 0.1),
    panel.grid.minor = element_line(color = "gray93", size = 0.1)
  )+
  guides(color = guide_legend(override.aes = list(label = "")))

ggsave("Fig_3b.pdf", plot = controls_plot, width = 10, height = 6, dpi = 900, units = "in", device = cairo_pdf)


# Fig 4 -------------------------------------------------------------------

df1 <- data.frame(
  Variable = rep(c("A", "B", "C"), each = 2),
  Outcome = rep(c("CBP", "CS"), times = 3),
  Estimate = c(-7.922, -3.186, -6.126, -2.266, -9.087, -0.154),
  t_value = c(-4.05, -3.93, -3.67, -3.22, -3.77, -0.18),
  confDown = c(-11.75405,-4.773064,-9.395891,-3.645485,-13.81194,-1.821055),
  confup = c(-4.089398, -1.598737,-2.856333,-0.8859848,-4.361735,1.51381)
)

dodge_width <- 0.6  

ggplot(df1, aes(x = Estimate, y = Variable, color = Outcome)) +
  geom_point(aes(group = Outcome), size = 2.5, shape = 16, position = position_dodge(width = dodge_width)) +  
  geom_errorbarh(aes(xmin = confDown, xmax = confup, group = Outcome), 
                 height = 0.2, linewidth = 0.5, position = position_dodge(width = dodge_width)) +  
  geom_vline(xintercept = 0, linetype = "dashed", color = "red", size = 0.5) +
  geom_text(aes(label = sprintf("%.2f", Estimate)), 
            position = position_dodge(width = dodge_width), 
            vjust = -0.5, size = 3.5, family = "Arial") +  
  scale_color_manual(values = c("CBP" = "#38AAACEE", "CS" = "#C4A080")) + 
  labs(title = "Heat Pump Effects (IV)",
       x = "Heat Pump Estimated Effect",
       y = "Models") +
  theme_minimal() +
  theme_bw(base_size = 14, base_family = "Arial") +
  theme(legend.background = element_rect(fill = "transparent", colour = NA),
        legend.title = element_blank(),  
        legend.text = element_text(size = 9),
        panel.grid.major = element_line(color = "gray92", size = 0.1),
        panel.grid.minor = element_line(color = "gray93", size = 0.1)) +
  guides(color = guide_legend(override.aes = list(label = "")))  

ggsave("Fig_4.pdf", width = 10, height = 6,
       dpi = 900, units = "in", device = cairo_pdf)

# Fig 5 -------------------------------------------------------------------

regression_results <- data.frame(
  Model = rep(1:8, 2),  
  Outcome = c(rep("CBP", 8), rep("CS", 8)),  
  Heatpump_Estimate = c(-0.764, -1.012, -1.270, -0.950, -0.782, -0.876, -1.317, -0.834,
                        -0.598, -0.605, -0.473, -0.240, -0.506, -0.331, -0.339, -0.475),
  Std_Error = c(0.536, 0.376, 0.365, 0.267, 0.220, 0.242, 0.221, 0.300,
                0.261, 0.180, 0.185, 0.140, 0.107, 0.117, 0.122, 0.173),
  CI_Lower = c(-1.814, -1.749, -1.986, -1.473, -1.214, -1.350, -1.751, -1.421,
               -1.110, -0.958, -0.836, -0.514, -0.715, -0.561, -0.578, -0.814),
  CI_Upper = c(0.286, -0.275, -0.554, -0.428, -0.350, -0.403, -0.884, -0.246,
               -0.086, -0.251, -0.109, 0.034, -0.296, -0.102, -0.099, -0.136)
)


df <- regression_results %>%
  mutate(Model = recode(Model,
                        "1" = "Less than $15K",
                        "2" = "$15K - $24K",
                        "3" = "$25K - $34K",
                        "4" = "$35K - $49K",
                        "5" = "$50K - $74K",
                        "6" = "$75K - $99K",
                        "7" = "$100K - $149K",
                        "8" = "$150K or more"
  ))

df$Model <- factor(df$Model,levels = c('Less than $15K',
                                       '$15K - $24K',
                                       '$25K - $34K',
                                       '$35K - $49K',
                                       '$50K - $74K',
                                       "$75K - $99K",
                                       '$100K - $149K',
                                       "$150K or more"))

dodge_width <- 0.6  


final_plot <- ggplot(df, aes(x = Heatpump_Estimate, y = Model, color = Outcome)) +
  geom_point(aes(group = Outcome), size = 2.5, shape = 16,
             position = position_dodge(width = dodge_width)) +  
  geom_errorbarh(aes(xmin = CI_Lower, xmax = CI_Upper, group = Outcome), 
                 height = 0.2, linewidth = 0.5, 
                 position = position_dodge(width = dodge_width)) +  
  geom_vline(xintercept = 0, linetype = "dashed", color = "red", size = 0.5) +
  geom_text(aes(label = sprintf("%.2f", Heatpump_Estimate)), 
            position = position_dodge(width = dodge_width), 
            vjust = -0.5, hjust = 0, size = 3.5, family = "Arial") +  
  scale_color_manual(values = c("CBP" = "#38AAACEE", "CS" = "#C4A080")) + 
  labs(
    title = "Heat Pump Effects (Different Income Levels)",
    x = "Heat Pump Estimated Effect",
    y = "Income Levels"
  ) +
  theme_bw(base_size = 14, base_family = "Arial") +
  theme(
    legend.background = element_rect(fill = "transparent", colour = NA),
    legend.title = element_blank(),
    legend.text = element_text(size = 9),
    panel.grid.major = element_line(color = "gray90", size = 0.1),
    panel.grid.minor = element_line(color = "gray95", size = 0.1),
    plot.title = element_text(size = 14, hjust = 0),
    axis.title = element_text(size = 12),
    axis.text = element_text(size = 10)
  ) +
  guides(color = guide_legend(override.aes = list(label = "")))  

ggsave("Fig_5.pdf", plot = final_plot, width = 10, height = 6,
       dpi = 900, units = "in", device = cairo_pdf)

# Fig 6 -------------------------------------------------------------------

regression_results <- data.frame(
  Model = c(1, 2, 3, 4),
  Outcome = c("CBP", "CBP", "CS", "CS"),
  Heatpump_Estimate = c(-1.047, -0.862, -0.477, -0.485),
  Std_Error = c(0.113, 0.205, 0.063, 0.112),
  CI_Lower = c(-1.269, -1.263, -0.600, -0.705),
  CI_Upper = c(-0.825, -0.461, -0.354, -0.265)
)

df <- regression_results %>%
  mutate(Model = recode(Model,
                        "1" = "White/Caucasian",
                        "2" = "Others",
                        "3" = "White/Caucasian",
                        "4" = "Others"))
dodge_width <- 0.6 
ggplot(df, aes(x = Heatpump_Estimate, y = Model, color = Outcome)) +
  geom_point(aes(group = Outcome), size = 2.5, shape = 16, position = position_dodge(width = dodge_width)) +  
  geom_errorbarh(aes(xmin = CI_Lower, xmax = CI_Upper, group = Outcome), 
                 height = 0.2, linewidth = 0.5, position = position_dodge(width = dodge_width)) +  
  geom_vline(xintercept = 0, linetype = "dashed", color = "red", size = 0.5) +
  geom_text(aes(label = sprintf("%.2f", Heatpump_Estimate)), 
            position = position_dodge(width = dodge_width), 
            vjust = -0.5, size = 3.5) +  
  scale_color_manual(values = c("CBP" = "#38AAACEE", "CS" = "#C4A080")) + 
  labs(title = "Heat Pump Effects (Ethnic)",
       x = "Heat Pump Estimated Effect",
       y = "Ethnic") +
  theme_minimal() +
  theme_bw(base_size = 14, base_family = "Arial") +
  theme(legend.background = element_rect(fill = "transparent", colour = NA),
        legend.title = element_blank(),  
        legend.text = element_text(size = 9),
        panel.grid.major = element_line(color = "gray92", size = 0.1),
        panel.grid.minor = element_line(color = "gray93", size = 0.1)) +
  guides(color = guide_legend(override.aes = list(label = "")))  

ggsave("Fig_6.pdf", width = 10, height = 6,
       dpi = 900, units = "in", device = cairo_pdf)

