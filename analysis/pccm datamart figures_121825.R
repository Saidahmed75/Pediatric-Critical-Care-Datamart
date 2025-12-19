# Core
library(tidyverse)
library(data.table)
# Plotting
library(scales)
library(viridis)
library(RColorBrewer)
library(colorspace)
library(ggrepel)
library(patchwork)
library(cowplot)
library(gridExtra)
library(ggpubr)
library(ggforce)
library(hrbrthemes)
# Heatmaps / correlations
library(heatmaply)
library(corrplot)
library(ggcorrplot)
# Venn
library(ggvenn)
# Modeling / ML
library(MASS)
library(glmnet)
library(caret)
library(pROC)
library(rpart)
library(rpart.plot)
library(nnet)
library(survival)
library(lme4)
library(mlr3)
library(mlr3learners)
# Explainability
library(shapviz)
library(iml)
library(DALEX)
# Stats / misc
library(cluster)
library(pwr)
library(longpower)
library(simr)
library(aod)
library(nparcomp)
library(Hmisc)
library(acepack)
# Legacy / datasets
library(datasets)
library(foreign)
library(lattice)
library(mlbench)
library(Amelia)
library(fastDummies)
library(tidyverse)
library(scales)
library(viridis)
library(grid)

library(tidyverse)
library(scales)
library(grid)

# ==========================================================
# Theme + saving
# ==========================================================
theme_fig_all <- function(base_size = 12) {
  theme_minimal(base_size = base_size) +
    theme(
      panel.grid.minor = element_blank(),
      panel.grid.major = element_line(linewidth = 0.25),
      
      strip.text = element_text(face = "bold", size = base_size + 2),
      
      axis.title = element_text(face = "bold", size = base_size),
      axis.title.x = element_text(margin = margin(t = 4, b = 6)),
      axis.title.y = element_text(margin = margin(r = 4)),
      
      axis.text = element_text(size = base_size - 1),
      axis.text.x = element_text(margin = margin(t = 2)),
      axis.text.y = element_text(margin = margin(r = 2)),
      
      axis.ticks.length = unit(2, "pt"),
      
      plot.title = element_text(face = "bold", size = base_size + 2),
      plot.subtitle = element_text(size = base_size),
      
      legend.title = element_text(face = "bold", size = base_size),
      legend.text  = element_text(size = base_size - 1),
      
      legend.box.spacing = unit(0.1, "cm"),
      legend.margin = margin(t = -2, unit = "pt"),
      
      plot.caption = element_text(size = base_size - 1),
      plot.margin = margin(4, 4, 2, 4)
    )
}

theme_legend_bottom <- function() {
  theme(
    legend.position = "bottom",
    legend.direction = "horizontal",
    legend.box = "horizontal"
  )
}

save_fig <- function(plot, filename_base, width = 7.5, height = 6.0, dpi = 300) {
  ggsave(
    filename = paste0(filename_base, ".png"),
    plot = plot,
    width = width, height = height, units = "in",
    dpi = dpi, bg = "white"
  )
  ggsave(
    filename = paste0(filename_base, ".pdf"),
    plot = plot,
    width = width, height = height, units = "in"
  )
}

# ==========================================================
# Helpers
# ==========================================================
num <- function(x) suppressWarnings(readr::parse_number(as.character(x)))
num01 <- function(x) pmin(pmax(num(x), 0), 1)

is_fig <- function(df, id) str_to_lower(df$figure_id) == str_to_lower(id)
has_panel <- function(df, pattern) str_detect(str_to_lower(df$panel), str_to_lower(pattern))

modality_levels <- c(
  "Any modality",
  "Flowsheets",
  "Medication administration",
  "Laboratory results",
  "Imaging",
  "Etiometry telemetry"
)

make_breaks <- function(x, base_breaks) {
  m <- suppressWarnings(max(x, na.rm = TRUE))
  if (!is.finite(m)) return(base_breaks)
  b <- sort(unique(c(base_breaks, round(m))))
  b[b <= m]
}

heatmap_by_cohort <- function(df, fill_var, fill_name, fill_breaks = NULL, fill_labels = NULL,
                              x_lab = "ICU day (0 = ICU admission day)", y_lab = "Modality",
                              x_breaks = seq(0, 20, 2), base_size = 12) {
  
  p <- ggplot(df, aes(x = icu_day, y = modality, fill = {{ fill_var }})) +
    geom_tile(color = "white", linewidth = 0.2) +
    facet_wrap(~ cohort, ncol = 1) +
    scale_x_continuous(breaks = x_breaks, expand = expansion(add = 0)) +
    scale_y_discrete(expand = expansion(add = 0)) +
    labs(x = x_lab, y = y_lab) +
    theme_fig_all(base_size) +
    theme_legend_bottom() +
    theme(panel.grid = element_blank(), axis.ticks = element_blank())
  
  p + scale_fill_viridis_c(
    name = fill_name,
    breaks = fill_breaks,
    labels = fill_labels,
    guide = guide_colorbar(
      barwidth = unit(10, "cm"),
      barheight = unit(0.35, "cm"),
      title.position = "top"
    )
  )
}

# ==========================================================
# Load and normalize data
# ==========================================================
df_all <- read_csv("comb_fig_data121725_2.csv", show_col_types = FALSE) %>%
  mutate(
    icu_day = suppressWarnings(as.integer(icu_day)),
    is_ecmo_num = suppressWarnings(as.integer(as.numeric(str_trim(as.character(is_ecmo))))),
    cohort = factor(
      case_when(
        is_ecmo_num == 0 ~ "Non-ECMO",
        is_ecmo_num == 1 ~ "ECMO",
        TRUE ~ NA_character_
      ),
      levels = c("Non-ECMO", "ECMO")
    ),
    modality = factor(modality, levels = modality_levels)
  )

# ==========================================================
# FIGURE 2
# ==========================================================
df2 <- df_all %>%
  filter(is_fig(., "figure2")) %>%
  mutate(
    median_records_per_encounter_day = num(median_records_per_encounter_day),
    p95_records_per_encounter_day    = num(p95_records_per_encounter_day)
  ) %>%
  filter(!is.na(cohort), !is.na(modality), !is.na(icu_day))

# Fig 2A
med_breaks_raw <- make_breaks(df2$median_records_per_encounter_day,
                              base_breaks = c(0, 1, 5, 10, 25, 50, 100, 250, 500, 1000, 2500, 5000))

p_fig2a <- heatmap_by_cohort(
  df2 %>% mutate(fill_med = log10(median_records_per_encounter_day + 1)),
  fill_var   = fill_med,
  fill_name  = "Median records per day (log10 + 1)",
  fill_breaks = log10(med_breaks_raw + 1),
  fill_labels = as.character(med_breaks_raw),
  x_lab = "ICU day (0 = ICU admission day)",
  base_size = 12
)

# Fig 2B
p95_breaks_raw <- make_breaks(df2$p95_records_per_encounter_day,
                              base_breaks = c(0, 1, 10, 50, 100, 250, 500, 1000, 2500, 5000, 10000))

p_fig2b <- heatmap_by_cohort(
  df2 %>% mutate(fill_p95 = log10(p95_records_per_encounter_day + 1)),
  fill_var   = fill_p95,
  fill_name  = "95th percentile records per day (log10 + 1)",
  fill_breaks = log10(p95_breaks_raw + 1),
  fill_labels = as.character(p95_breaks_raw),
  x_lab = "ICU day (0 = ICU admission day)",
  base_size = 12
)

# ==========================================================
# FIGURE 3A (hourly availability heatmap)
# ==========================================================
df3_hourly <- df_all %>%
  filter(is_fig(., "figure3"), has_panel(., "hour")) %>%
  mutate(median_pct_bins_with_any = num01(median_pct_bins_with_any)) %>%
  filter(!is.na(cohort), !is.na(modality), !is.na(icu_day))

p_fig3a <- heatmap_by_cohort(
  df3_hourly,
  fill_var   = median_pct_bins_with_any,
  fill_name  = "Median percent of hourly bins with any data",
  fill_breaks = NULL,
  fill_labels = percent_format(accuracy = 1),
  x_lab = "Hour within ICU day 1",
  base_size = 12
)

# ==========================================================
# FIGURE 3B (5-min bin delta over ICU day 1)
# ==========================================================
df3b_bins <- df_all %>%
  filter(is_fig(., "figure3"), has_panel(., "bin-level")) %>%
  mutate(
    bin_minutes      = suppressWarnings(as.integer(bin_minutes)),
    bin_start_minute = suppressWarnings(as.integer(bin_start_minute)),
    hour_in_day      = bin_start_minute / 60,
    p_bin            = num01(pct_enc_with_any_in_bin)
  ) %>%
  filter(bin_minutes == 5, !is.na(cohort), !is.na(modality), !is.na(hour_in_day))

df_profile <- df3b_bins %>%
  group_by(cohort, modality, bin_start_minute, hour_in_day) %>%
  summarise(
    mean_p = mean(p_bin, na.rm = TRUE),
    lo     = quantile(p_bin, 0.25, na.rm = TRUE, names = FALSE),
    hi     = quantile(p_bin, 0.75, na.rm = TRUE, names = FALSE),
    .groups = "drop"
  )

df_delta <- df_profile %>%
  select(modality, hour_in_day, cohort, mean_p) %>%
  pivot_wider(names_from = cohort, values_from = mean_p) %>%
  mutate(delta = ECMO - `Non-ECMO`)

p_delta <- ggplot(df_delta, aes(x = hour_in_day, y = delta)) +
  geom_hline(yintercept = 0, linewidth = 0.4, color = "grey40") +
  geom_line(linewidth = 0.6, color = "black") +
  facet_wrap(~ modality, ncol = 3, scales = "free_y") +
  scale_x_continuous(breaks = seq(0, 24, 4), limits = c(0, 24)) +
  scale_y_continuous(labels = percent_format(accuracy = 1)) +
  labs(
    x = "Hour within ICU day 1",
    y = "Percent difference in within day mean modality data availability,\nECMO - Non-ECMO",
    title = "Within-day differences in data availability by modality"
  ) +
  theme_fig_all(11.5) +
  theme(
    panel.border = element_rect(color = "grey30", fill = NA, linewidth = 0.5),
    axis.line = element_blank(),
    panel.grid.major = element_line(color = "grey50", linetype = "dotted", linewidth = 0.4),
    panel.grid.minor = element_line(color = "grey60", linetype = "dotted", linewidth = 0.25)
  )

# Save if desired
save_fig(p_delta, "Fig3B_1218_5minBins_AllModalities_difference", width = 12, height = 8)