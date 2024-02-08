test:
	bin/rails test

lint:
	bundle exec rubocop
	bundle exec slim-lint app/views/

check: lint test
