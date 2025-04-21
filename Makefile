all:
	Rscript scripts/01_load_data.R
	Rscript scripts/02_methods.R
	Rscript scripts/03_model.R
	Rscript scripts/04_results.R
	
clean:
	rm -rf data/*
	rm -rf output/*
	rm -rf models/*