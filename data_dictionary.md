# Data Dictionary

## Project
CMS Hospital Quality & Patient Experience Analysis

## Data Sources

Public datasets obtained from CMS:

1. Hospital General Information
2. HCAHPS Hospital Data

---

| Variable | Type | Description |
|-----------|------|-------------|
| Facility ID | Character | Unique identifier assigned to each hospital/facility |
| Facility Name | Character | Name of hospital |
| State | Character | U.S. state where hospital is located |
| Hospital Type | Character | Classification of hospital (Acute Care, Critical Access, Veterans Administration, etc.) |
| Hospital Ownership | Character | Ownership category of hospital |
| Hospital overall rating | Character → Numeric | CMS overall hospital performance rating (1–5 stars) |
| Patient Survey Star Rating | Character → Numeric | HCAHPS patient experience star rating (1–5 stars) |
| Number of Completed Surveys | Character | Total completed patient surveys |
| Survey Response Rate Percent | Character | Percentage of patients responding to surveys |

---

## Derived Variables

| Variable | Type | Description |
|-----------|------|-------------|
| patient_star_num | Numeric | Numeric version of Patient Survey Star Rating |
| overall_rating_num | Numeric | Numeric version of Hospital Overall Rating |
| high_rating | Binary | Hospital overall rating categorized as: 1 = 4–5 stars, 0 = 1–3 stars |

---

## Outcome Variable

high_rating

Definition:

- 1 = High-rated hospital (4–5 stars)
- 0 = Lower-rated hospital (1–3 stars)

---

## Predictor Variable

patient_star_num

Definition:

Numeric patient experience score used to predict hospital quality performance.

---

## Notes

- Records with unavailable ratings were removed prior to analysis.
- Datasets were merged using Facility ID.
- Data cleaning and analyses were performed in SAS.
