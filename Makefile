dirs := panther_community_detections

lint: lint-pylint lint-fmt

lint-pylint:
	pipenv run bandit -r $(dirs) --skip B101  # allow assert statements in tests
	pipenv run pylint $(dirs) \
	  --disable=missing-docstring,duplicate-code,import-error,fixme,consider-iterating-dictionary,global-variable-not-assigned \
	  --load-plugins=pylint.extensions.mccabe,pylint_print \
	  --max-line-length=100

lint-fmt:
	@echo Checking python file formatting with the black code style checker
	pipenv run black --line-length=100 --check $(dirs)

fmt:
	pipenv run isort --profile=black $(dirs)
	pipenv run black --line-length=100 $(dirs)

install:
	pipenv install --dev

test: 
	pipenv run nosetests -v --with-coverage --cover-html --cover-html-dir=htmlcov

docker-build:
	docker build -t panther-detections .

docker-test:
	docker run --mount "type=bind,source=${CURDIR},target=/home/panther-detections" panther-detections make test

docker-lint:
	docker run --mount "type=bind,source=${CURDIR},target=/home/panther-detections" panther-detections make lint

pypi: ## Publish to PyPi
	rm -rf dist *.egg-info
	pipenv run python3 setup.py sdist
	pipenv run twine upload dist/*