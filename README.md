# Sentinel Risk Intelligence Platform

[![CI](https://github.com/h-rishi16/Sentinel/actions/workflows/ci.yml/badge.svg)](https://github.com/h-rishi16/Sentinel/actions)
![Python 3.11+](https://img.shields.io/badge/Python-3.11+-blue.svg)
![FastAPI](https://img.shields.io/badge/FastAPI-0.103.2-009688.svg)
![HTMX](https://img.shields.io/badge/HTMX-1.9.10-3D72D7.svg)
![Tailwind](https://img.shields.io/badge/Tailwind_CSS-3.4-38B2AC.svg)
![XGBoost](https://img.shields.io/badge/XGBoost-Enabled-orange.svg)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)

**Sentinel** is a high-performance, quantitative risk management and surveillance terminal. It provides a unified platform for real-time fraud detection, credit risk modeling, market volatility forecasting, and systemic stress testing, natively integrated with an interactive HTMX + Tailwind CSS dark-mode dashboard.

---

## Live Cloud Deployment

Experience the live, interactive terminal and API documentation:
- **Live Terminal Dashboard:** [Sentinel](https://sentinel-risk-platform.onrender.com/)
- **Interactive OpenAPI / Swagger Documentation:** [Docs](https://sentinel-risk-platform.onrender.com/docs)

---

## Key Risk Engines

* **Transaction Surveillance (Fraud Detection):** Real-time XGBoost classifier identifying fraudulent behavior utilizing temporal velocity, amount Z-scores, and categorical encoding.
* **Loan Default Engine (Credit Risk):** Probability of Default (PD) and Expected Loss (EL) calculations leveraging decision trees on borrower credit profiles (FICO, DTI).
* **Portfolio Value at Risk (Market Risk):** 99% VaR and Expected Shortfall (CVaR) calculations utilizing Monte Carlo simulations with Kupiec POF backtesting validation.
* **Volatility Surface:** Long-run annualized volatility forecasting using GARCH(1,1) Maximum Likelihood Estimation (MLE) and RiskMetrics EWMA ($\lambda=0.94$).
* **Scenario Analysis (Stress Testing):** Shock absorption simulations for historical crises (2008 GFC, 2022 Rate Shocks) and hypothetical sector crashes.
* **Obligor 360:** A unified, cross-engine entity search that aggregates an individual borrower's credit, fraud, and exposure risks into a single pane of glass.
* **Data Forge:** Synthetic data generation pipeline capable of rapidly seeding millions of rows of correlated, stressed financial data for backtesting.

> **Mathematical Architecture:** Want to know exactly how the underlying math and architecture work? [Read the technical guide](HOW_IT_WORKS.md).

---

## Limitations & Disclaimer

> **Synthetic Data Disclaimer:** Sentinel uses synthetic financial data for demonstration and testing purposes. Model performance should not be interpreted as production performance on real-world banking data. Synthetic data may contain assumptions and patterns that make prediction easier than in real financial environments.

---

## Architecture & Tech Stack

Sentinel is built to prioritize mathematical accuracy, low-latency execution, and responsive UX without heavy client-side frameworks:

* **Backend & API:** Python 3.11+, FastAPI, SQLAlchemy, Uvicorn
* **Quantitative Modeling:** Pandas, Scikit-Learn, XGBoost, SciPy, Arch, PyArrow
* **Frontend:** HTMX (Server-Side UI rendering), Tailwind CSS (Dark Mode supported), Lucide Icons
* **Database:** SQLite (Embedded relational storage; production path: PostgreSQL)
* **DevOps & CI/CD:** Docker, GitHub Actions (automated Ruff linting + Pytest suite)

---

## Local Installation & Setup

1. **Clone the repository:**
   ```bash
   git clone https://github.com/h-rishi16/Sentinel.git
   cd Sentinel
   ```

2. **Set up a virtual environment and install dependencies:**
   ```bash
   python3 -m venv .venv
   source .venv/bin/activate
   pip install -e .
   ```

3. **Seed the Synthetic Database:**
   Ensure the database is populated with financial data for the engines to run:
   ```bash
   python scripts/seed_db.py 1000 5000 20000 0.002 0.0 normal normal
   ```
   *(Or simply launch the application and use the **Data Forge** UI tab to generate datasets interactively).*

---

## Running the Application Locally

Start the FastAPI ASGI server with Uvicorn:

```bash
uvicorn sentinel.api.main:app --host 0.0.0.0 --port 8000 --reload
```

Then open your browser and navigate to: **[http://localhost:8000](http://localhost:8000)**

---

## License

This project is open-source and available under the [MIT License](LICENSE).
