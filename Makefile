test:
	bin/rails test

lint:
  # TODO: bundle exec rubocop
  bundle exec slim-lint app/views/

check: lint test
