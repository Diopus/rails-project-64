test:
	bin/rails test

lint:
  bundle exec rubocop /bin
	bundle exec slim-lint app/views/
	# FIXME: remove /bin

check: lint test
