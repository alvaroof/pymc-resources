CONDA=conda
SHELL := /bin/bash

jupyter: ## Launch Jupyter notebook
	source activate base && $(CONDA) activate stat-rethink2-pymc_v4 && jupyter lab --allow-root