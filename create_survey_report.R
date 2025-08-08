# ==============================================================================
# setup
# ==============================================================================

# activate virtual environment for the project
renv::restore(prompt = FALSE)

# set project paths
proj_dir <- here::here()
data_dir <- fs::path(proj_dir, "data")
template_dir <- fs::path(proj_dir, "inst")
script_dir <- fs::path(proj_dir, "R")

# ==============================================================================
# check inputs
# ==============================================================================

# validate user-provided parameters
  # - report content
  #   - chapters
  #   - indicators
  # - report language (e.g., English (default), French, etc.)

# confirm data are present

# ==============================================================================
# create report
# ==============================================================================

# set paths for report files
template_path <- fs::path(template_dir, "survey_report.qmd")
report_orig_path <- fs::path(template_dir, "survey_report.docx")
report_dest_path <- fs::path(proj_dir, "survey_report.docx")

# render report
quarto::quarto_render(
  input = template_path
)

# move rendered report from `inst` to root
fs::file_move(
  path = report_orig_path,
  new_path = report_dest_path
)
