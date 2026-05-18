# CMS Hospital Quality & Patient Experience Analysis

## Project Overview

This project evaluates relationships between hospital quality metrics and patient experience measures using publicly available Centers for Medicare & Medicaid Services (CMS) hospital data and HCAHPS (Hospital Consumer Assessment of Healthcare Providers and Systems) survey data.

The goal was to examine whether patient experience measures are associated with overall hospital performance and to translate findings into healthcare quality improvement insights.

---

## Objective

To investigate whether patient survey ratings are associated with higher hospital performance ratings across U.S. hospitals.

---

## Data Sources

Public CMS datasets:

- Hospital General Information
- HCAHPS Hospital Data

Data were merged using Facility ID.

---

## Tools Used

- SAS
- Logistic Regression
- Descriptive Statistics
- Correlation Analysis
- Healthcare Quality Analytics

---

## Methods

### Data Preparation

- Imported CMS hospital datasets into SAS
- Merged datasets using Facility ID
- Removed observations with unavailable ratings
- Created numeric versions of hospital and patient survey ratings

### Descriptive Analysis

Evaluated:

- Average hospital ratings by hospital type
- Patient survey ratings by hospital type

### Correlation Analysis

Assessed the relationship between:

- Overall hospital rating
- Patient survey rating

### Predictive Modeling

Created a binary outcome:

**High-rated hospital**
- 1 = Overall hospital rating of 4–5 stars
- 0 = Overall hospital rating of 1–3 stars

Logistic regression was used to determine whether patient survey ratings predicted high overall hospital performance.

---

## Key Results

Sample size:

- Total hospitals analyzed: 2,929

Average overall ratings:

- Acute Care–Veterans Administration Hospitals: 4.15
- Acute Care Hospitals: 3.19
- Critical Access Hospitals: 3.25

Correlation findings:

- Patient survey ratings showed a moderate positive association with overall hospital ratings

r = 0.41  
p < .0001

Logistic regression findings:

- Each 1-star increase in patient survey rating was associated with:

OR = 2.08  
95% CI: 1.91–2.25  
p < .0001

Interpretation:

Hospitals with stronger patient experience ratings demonstrated significantly greater odds of receiving higher overall hospital ratings.

---

## Healthcare Quality Implications

These findings suggest that patient experience metrics may provide useful information for healthcare quality monitoring and performance improvement efforts. Healthcare organizations can use patient feedback measures to identify opportunities to improve care delivery and patient outcomes.

---

## Author

Chloe Sequeira  
MPH Candidate, Epidemiology | Healthcare Analytics | SAS | Public Health Research
