test:
	export TERM=xterm && bundle exec rspec
cov:
	export TERM=xterm && COVERAGE=true bundle exec rspec
lint:
	bundle exec rubocop
run:
	ruby main.rb
test-run:
	ruby main.rb --test-run
