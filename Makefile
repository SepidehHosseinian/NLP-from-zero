install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt
	python -m textblob.download_corpora
test:
	python -m pytest -vv --cov=wikiphrases --cov=mylib --cov=main test_corenlp.py

lint:
	pylint --disable=R,C *.py mylib/*.py
	#docker run --rm -i hadolint/hadolint < Dockerfile
format:
	black *.py mylib

all: install lint test format
